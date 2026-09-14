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

    public List<Archivo> listarTodos() throws SQLException {
        String sql = """
                SELECT a.id, a.entidad_tipo, a.entidad_id, a.nombre, a.url, t.titulo AS tarea_titulo
                FROM archivos a
                LEFT JOIN tareas t
                    ON a.entidad_tipo = 'TAREA' AND a.entidad_id = t.id
                ORDER BY a.id
                """;
        List<Archivo> archivos = new ArrayList<>();

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                archivos.add(mapear(resultSet));
            }
        }

        return archivos;
    }

    public List<Archivo> listarPorTarea(int tareaId) throws SQLException {
        String sql = """
                SELECT * FROM archivos
                WHERE entidad_tipo = 'TAREA' AND entidad_id = ?
                ORDER BY id ASC
                """;
        List<Archivo> archivos = new ArrayList<>();

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, tareaId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Archivo archivo = new Archivo();
                    archivo.setId(resultSet.getLong("id"));
                    archivo.setEntidadTipo(resultSet.getString("entidad_tipo"));
                    archivo.setEntidadId(resultSet.getLong("entidad_id"));
                    archivo.setNombre(resultSet.getString("nombre"));
                    archivo.setUrl(resultSet.getString("url"));
                    archivos.add(archivo);
                }
            }
        }

        return archivos;
    }

    public List<Archivo> listarPorTarea(Long tareaId) throws SQLException {
        return listarPorTarea(tareaId.intValue());
    }

    public void insertar(Archivo archivo) throws SQLException {
        String sql = """
                INSERT INTO archivos (entidad_tipo, entidad_id, nombre, url)
                VALUES (?, ?, ?, ?)
                """;

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, archivo.getEntidadTipo());
            statement.setLong(2, archivo.getEntidadId());
            statement.setString(3, archivo.getNombre());
            statement.setString(4, archivo.getUrl());
            int filas = statement.executeUpdate();
            if (filas != 1) {
                throw new SQLException("No se insertó el archivo en la base de datos.");
            }
        }
    }

    public void eliminar(int id) throws SQLException {
        String sql = "DELETE FROM archivos WHERE id = ?";

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
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
