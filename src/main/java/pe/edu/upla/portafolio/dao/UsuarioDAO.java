package pe.edu.upla.portafolio.dao;

import org.mindrot.jbcrypt.BCrypt;
import pe.edu.upla.portafolio.config.DatabaseConfig;
import pe.edu.upla.portafolio.model.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    private static final String SQL_POR_EMAIL = """
            SELECT id, nombre, email, password_hash, rol, estado
            FROM usuarios
            WHERE email = ?
            """;

    private static final String SQL_EXISTE_EMAIL = "SELECT 1 FROM usuarios WHERE email = ?";

    private static final String SQL_REGISTRAR = """
            INSERT INTO usuarios (nombre, email, password_hash, rol, estado)
            VALUES (?, ?, ?, 'USUARIO', 'PENDIENTE')
            """;

    private static final String SQL_LISTAR = """
            SELECT id, nombre, email, password_hash, rol, estado
            FROM usuarios
            ORDER BY
                CASE estado
                    WHEN 'PENDIENTE' THEN 1
                    WHEN 'APROBADO' THEN 2
                    ELSE 3
                END,
                id
            """;

    private static final String SQL_CAMBIAR_ESTADO = "UPDATE usuarios SET estado = ? WHERE id = ?";

    private static final String SQL_POR_ID = """
            SELECT id, nombre, email, password_hash, rol, estado
            FROM usuarios
            WHERE id = ?
            """;

    private static final String SQL_ACTUALIZAR = """
            UPDATE usuarios
            SET nombre = ?, email = ?, rol = ?
            WHERE id = ?
            """;

    private static final String SQL_PASSWORD = "UPDATE usuarios SET password_hash = ? WHERE id = ?";

    private static final String SQL_ELIMINAR = "DELETE FROM usuarios WHERE id = ?";

    public Usuario autenticar(String email, String passwordTextoPlano) {
        if (email == null || email.isBlank() || passwordTextoPlano == null || passwordTextoPlano.isBlank()) {
            return null;
        }

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement ps = JdbcSafety.prepare(connection, SQL_POR_EMAIL)) {

            ps.setString(1, email.trim());
            try (ResultSet resultSet = ps.executeQuery()) {
                if (!resultSet.next()) {
                    return null;
                }

                String passwordHash = resultSet.getString("password_hash");
                if (passwordHash == null || !BCrypt.checkpw(passwordTextoPlano, passwordHash)) {
                    return null;
                }

                return mapear(resultSet);
            }
        } catch (SQLException | IllegalArgumentException e) {
            return null;
        }
    }

    public boolean existeEmail(String email) throws SQLException {
        if (email == null || email.isBlank()) {
            return false;
        }

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement ps = JdbcSafety.prepare(connection, SQL_EXISTE_EMAIL)) {
            ps.setString(1, email.trim());
            try (ResultSet resultSet = ps.executeQuery()) {
                return resultSet.next();
            }
        }
    }

    public void registrar(String nombre, String email, String passwordTextoPlano) throws SQLException {
        String nombreSeguro = JdbcSafety.requireTexto(nombre, "nombre");
        String emailSeguro = JdbcSafety.requireTexto(email, "email");
        if (passwordTextoPlano == null || passwordTextoPlano.isBlank()) {
            throw new SQLException("El campo password es obligatorio.");
        }
        String passwordHash = BCrypt.hashpw(passwordTextoPlano, BCrypt.gensalt());

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement ps = JdbcSafety.prepare(connection, SQL_REGISTRAR)) {
            ps.setString(1, nombreSeguro);
            ps.setString(2, emailSeguro);
            ps.setString(3, passwordHash);
            ps.executeUpdate();
        }
    }

    public List<Usuario> listarTodos() throws SQLException {
        List<Usuario> usuarios = new ArrayList<>();

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement ps = JdbcSafety.prepare(connection, SQL_LISTAR);
             ResultSet resultSet = ps.executeQuery()) {
            while (resultSet.next()) {
                usuarios.add(mapear(resultSet));
            }
        }

        return usuarios;
    }

    public void cambiarEstado(int id, String nuevoEstado) throws SQLException {
        String estadoSeguro = JdbcSafety.requireEstado(nuevoEstado);

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement ps = JdbcSafety.prepare(connection, SQL_CAMBIAR_ESTADO)) {
            ps.setString(1, estadoSeguro);
            ps.setInt(2, id);
            ps.executeUpdate();
        }
    }

    public Usuario obtenerPorId(int id) throws SQLException {
        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement ps = JdbcSafety.prepare(connection, SQL_POR_ID)) {
            ps.setInt(1, id);
            try (ResultSet resultSet = ps.executeQuery()) {
                if (resultSet.next()) {
                    return mapear(resultSet);
                }
            }
        }

        return null;
    }

    public void actualizar(Usuario usuario) throws SQLException {
        if (usuario == null || usuario.getId() == null) {
            throw new SQLException("Usuario inválido.");
        }

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement ps = JdbcSafety.prepare(connection, SQL_ACTUALIZAR)) {
            ps.setString(1, JdbcSafety.requireTexto(usuario.getNombre(), "nombre"));
            ps.setString(2, JdbcSafety.requireTexto(usuario.getEmail(), "email"));
            ps.setString(3, JdbcSafety.requireRol(usuario.getRol()));
            ps.setLong(4, usuario.getId());
            ps.executeUpdate();
        }
    }

    public void actualizarPassword(int id, String passwordHash) throws SQLException {
        String hashSeguro = JdbcSafety.requireTexto(passwordHash, "password_hash");

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement ps = JdbcSafety.prepare(connection, SQL_PASSWORD)) {
            ps.setString(1, hashSeguro);
            ps.setInt(2, id);
            ps.executeUpdate();
        }
    }

    public void eliminar(int id) throws SQLException {
        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement ps = JdbcSafety.prepare(connection, SQL_ELIMINAR)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    private Usuario mapear(ResultSet resultSet) throws SQLException {
        Usuario usuario = new Usuario();
        usuario.setId(resultSet.getLong("id"));
        usuario.setNombre(resultSet.getString("nombre"));
        usuario.setEmail(resultSet.getString("email"));
        usuario.setRol(resultSet.getString("rol"));
        usuario.setEstado(resultSet.getString("estado"));
        usuario.setPasswordHash(null);
        return usuario;
    }
}
