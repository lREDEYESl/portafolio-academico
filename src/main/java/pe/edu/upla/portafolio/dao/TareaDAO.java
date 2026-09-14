package pe.edu.upla.portafolio.dao;

import pe.edu.upla.portafolio.config.DatabaseConfig;
import pe.edu.upla.portafolio.model.Tarea;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class TareaDAO {

    public List<Tarea> listarPorSemana(int semanaId) throws SQLException {
        String sql = """
                SELECT id, semana_id, titulo, descripcion, fecha_limite
                FROM tareas
                WHERE semana_id = ?
                ORDER BY fecha_limite, id
                """;
        List<Tarea> tareas = new ArrayList<>();

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, semanaId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    tareas.add(mapear(resultSet));
                }
            }
        }

        return tareas;
    }

    public List<Tarea> listarTodas() throws SQLException {
        String sql = """
                SELECT id, semana_id, titulo, descripcion, fecha_limite
                FROM tareas
                ORDER BY fecha_limite, id
                """;
        List<Tarea> tareas = new ArrayList<>();

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                tareas.add(mapear(resultSet));
            }
        }

        return tareas;
    }

    public Tarea obtenerPorId(int id) throws SQLException {
        String sql = """
                SELECT id, semana_id, titulo, descripcion, fecha_limite
                FROM tareas
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

    public void insertar(Tarea tarea) throws SQLException {
        String sql = """
                INSERT INTO tareas (semana_id, titulo, descripcion, fecha_limite)
                VALUES (?, ?, ?, ?)
                """;

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            bindTarea(statement, tarea);
            statement.executeUpdate();
        }
    }

    public void actualizar(Tarea tarea) throws SQLException {
        String sql = """
                UPDATE tareas
                SET semana_id = ?, titulo = ?, descripcion = ?, fecha_limite = ?
                WHERE id = ?
                """;

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            bindTarea(statement, tarea);
            statement.setLong(5, tarea.getId());
            statement.executeUpdate();
        }
    }

    public void eliminar(int id) throws SQLException {
        String sql = "DELETE FROM tareas WHERE id = ?";

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }

    private void bindTarea(PreparedStatement statement, Tarea tarea) throws SQLException {
        statement.setLong(1, tarea.getSemanaId());
        statement.setString(2, tarea.getTitulo());
        statement.setString(3, tarea.getDescripcion());
        statement.setDate(4, Date.valueOf(tarea.getFechaLimite()));
    }

    private Tarea mapear(ResultSet resultSet) throws SQLException {
        Tarea tarea = new Tarea();
        tarea.setId(resultSet.getLong("id"));
        tarea.setSemanaId(resultSet.getLong("semana_id"));
        tarea.setTitulo(resultSet.getString("titulo"));
        tarea.setDescripcion(resultSet.getString("descripcion"));
        LocalDate fechaLimite = resultSet.getObject("fecha_limite", LocalDate.class);
        tarea.setFechaLimite(fechaLimite);
        return tarea;
    }
}
