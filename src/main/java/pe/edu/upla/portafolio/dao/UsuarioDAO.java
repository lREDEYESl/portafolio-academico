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

    public Usuario autenticar(String email, String passwordTextoPlano) {
        if (email == null || email.isBlank() || passwordTextoPlano == null || passwordTextoPlano.isBlank()) {
            return null;
        }

        String sql = """
                SELECT id, nombre, email, password_hash, rol, estado
                FROM usuarios
                WHERE email = ?
                """;

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, email.trim());
            try (ResultSet resultSet = statement.executeQuery()) {
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
        String sql = "SELECT 1 FROM usuarios WHERE email = ?";
        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, email.trim());
            try (ResultSet resultSet = statement.executeQuery()) {
                return resultSet.next();
            }
        }
    }

    public void registrar(String nombre, String email, String passwordTextoPlano) throws SQLException {
        String sql = """
                INSERT INTO usuarios (nombre, email, password_hash, rol, estado)
                VALUES (?, ?, ?, 'USUARIO', 'PENDIENTE')
                """;
        String passwordHash = BCrypt.hashpw(passwordTextoPlano, BCrypt.gensalt());

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, nombre.trim());
            statement.setString(2, email.trim());
            statement.setString(3, passwordHash);
            statement.executeUpdate();
        }
    }

    public List<Usuario> listarTodos() throws SQLException {
        String sql = """
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
        List<Usuario> usuarios = new ArrayList<>();

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                usuarios.add(mapear(resultSet));
            }
        }

        return usuarios;
    }

    public void cambiarEstado(int id, String nuevoEstado) throws SQLException {
        if (!"APROBADO".equals(nuevoEstado) && !"RECHAZADO".equals(nuevoEstado) && !"PENDIENTE".equals(nuevoEstado)) {
            throw new SQLException("Estado no permitido.");
        }

        String sql = "UPDATE usuarios SET estado = ? WHERE id = ?";
        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, nuevoEstado);
            statement.setInt(2, id);
            statement.executeUpdate();
        }
    }

    public Usuario obtenerPorId(int id) throws SQLException {
        String sql = """
                SELECT id, nombre, email, password_hash, rol, estado
                FROM usuarios
                WHERE id = ?
                """;

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return mapear(resultSet);
                }
            }
        }

        return null;
    }

    public void actualizar(Usuario usuario) throws SQLException {
        String sql = """
                UPDATE usuarios
                SET nombre = ?, email = ?, rol = ?
                WHERE id = ?
                """;

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, usuario.getNombre().trim());
            statement.setString(2, usuario.getEmail().trim());
            statement.setString(3, usuario.getRol());
            statement.setLong(4, usuario.getId());
            statement.executeUpdate();
        }
    }

    public void actualizarPassword(int id, String passwordHash) throws SQLException {
        String sql = "UPDATE usuarios SET password_hash = ? WHERE id = ?";

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, passwordHash);
            statement.setInt(2, id);
            statement.executeUpdate();
        }
    }

    public void eliminar(int id) throws SQLException {
        String sql = "DELETE FROM usuarios WHERE id = ?";

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
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
