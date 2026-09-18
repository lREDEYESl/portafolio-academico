package pe.edu.upla.portafolio.dao;

import pe.edu.upla.portafolio.config.DatabaseConfig;
import pe.edu.upla.portafolio.model.Archivo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ArchivoDAO {

    private static final String SQL_LISTAR_TODOS = """
            SELECT a.id, a.entidad_tipo, a.entidad_id, a.nombre, a.url, t.titulo AS tarea_titulo
            FROM archivos a
            LEFT JOIN tareas t
                ON a.entidad_tipo = 'TAREA' AND a.entidad_id = t.id
            ORDER BY a.id
            """;

    private static final String SQL_POR_ID = """
            SELECT a.id, a.entidad_tipo, a.entidad_id, a.nombre, a.url, t.titulo AS tarea_titulo
            FROM archivos a
            LEFT JOIN tareas t
                ON a.entidad_tipo = 'TAREA' AND a.entidad_id = t.id
            WHERE a.id = ?
            """;

    private static final String SQL_POR_TAREA = """
            SELECT id, entidad_tipo, entidad_id, nombre, url, CAST(NULL AS VARCHAR) AS tarea_titulo
            FROM archivos
            WHERE entidad_tipo = 'TAREA' AND entidad_id = ?
            ORDER BY id ASC
            """;

    private static final String SQL_INSERTAR = """
            INSERT INTO archivos (entidad_tipo, entidad_id, nombre, url)
            VALUES (?, ?, ?, ?)
            """;

    private static final String SQL_ELIMINAR = "DELETE FROM archivos WHERE id = ?";

    private static final String SQL_ACTUALIZAR = """
            UPDATE archivos
            SET entidad_tipo = ?, entidad_id = ?, nombre = ?, url = ?
            WHERE id = ?
            """;

    public List<Archivo> listarTodos() throws SQLException {
        List<Archivo> archivos = new ArrayList<>();

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement ps = JdbcSafety.prepare(connection, SQL_LISTAR_TODOS);
             ResultSet resultSet = ps.executeQuery()) {
            while (resultSet.next()) {
                archivos.add(mapear(resultSet));
            }
        }

        return archivos;
    }

    public Archivo obtenerPorId(int id) throws SQLException {
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

    public List<Archivo> listarPorTarea(int tareaId) throws SQLException {
        List<Archivo> archivos = new ArrayList<>();

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement ps = JdbcSafety.prepare(connection, SQL_POR_TAREA)) {
            ps.setInt(1, tareaId);
            try (ResultSet resultSet = ps.executeQuery()) {
                while (resultSet.next()) {
                    archivos.add(mapear(resultSet));
                }
            }
        }

        return archivos;
    }

    public List<Archivo> listarPorTarea(Long tareaId) throws SQLException {
        if (tareaId == null) {
            return List.of();
        }
        return listarPorTarea(tareaId.intValue());
    }

    public void insertar(Archivo archivo) throws SQLException {
        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement ps = JdbcSafety.prepare(connection, SQL_INSERTAR)) {
            bindArchivo(ps, archivo);
            int filas = ps.executeUpdate();
            if (filas != 1) {
                throw new SQLException("No se insertó el archivo en la base de datos.");
            }
        }
    }

    public void actualizar(Archivo archivo) throws SQLException {
        if (archivo == null || archivo.getId() == null) {
            throw new SQLException("Archivo inválido.");
        }

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement ps = JdbcSafety.prepare(connection, SQL_ACTUALIZAR)) {
            bindArchivo(ps, archivo);
            ps.setLong(5, archivo.getId());
            int filas = ps.executeUpdate();
            if (filas != 1) {
                throw new SQLException("No se actualizó el archivo en la base de datos.");
            }
        }
    }

    public void eliminar(int id) throws SQLException {
        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement ps = JdbcSafety.prepare(connection, SQL_ELIMINAR)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    private void bindArchivo(PreparedStatement ps, Archivo archivo) throws SQLException {
        if (archivo == null || archivo.getEntidadId() == null) {
            throw new SQLException("Archivo inválido.");
        }

        ps.setString(1, JdbcSafety.requireEntidadTipo(archivo.getEntidadTipo()));
        ps.setLong(2, archivo.getEntidadId());
        ps.setString(3, JdbcSafety.requireTexto(archivo.getNombre(), "nombre"));
        ps.setString(4, JdbcSafety.requireTexto(archivo.getUrl(), "url"));
    }

    private Archivo mapear(ResultSet resultSet) throws SQLException {
        Archivo archivo = new Archivo();
        archivo.setId(resultSet.getLong("id"));
        archivo.setEntidadTipo(resultSet.getString("entidad_tipo"));
        archivo.setEntidadId(resultSet.getLong("entidad_id"));
        archivo.setNombre(resultSet.getString("nombre"));
        archivo.setUrl(resultSet.getString("url"));
        archivo.setTareaTitulo(resultSet.getString("tarea_titulo"));
        return archivo;
    }
}
