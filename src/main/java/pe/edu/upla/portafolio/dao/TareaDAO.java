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

    private static final String SQL_POR_SEMANA = """
            SELECT id, semana_id, titulo, descripcion, fecha_limite
            FROM tareas
            WHERE semana_id = ?
            ORDER BY fecha_limite, id
            """;

    private static final String SQL_TODAS = """
            SELECT id, semana_id, titulo, descripcion, fecha_limite
            FROM tareas
            ORDER BY fecha_limite, id
            """;

    private static final String SQL_POR_ID = """
            SELECT id, semana_id, titulo, descripcion, fecha_limite
            FROM tareas
            WHERE id = ?
            """;

    private static final String SQL_INSERTAR = """
            INSERT INTO tareas (semana_id, titulo, descripcion, fecha_limite)
            VALUES (?, ?, ?, ?)
            """;

    private static final String SQL_ACTUALIZAR = """
            UPDATE tareas
            SET semana_id = ?, titulo = ?, descripcion = ?, fecha_limite = ?
            WHERE id = ?
            """;

    private static final String SQL_ELIMINAR = "DELETE FROM tareas WHERE id = ?";

    public List<Tarea> listarPorSemana(int semanaId) throws SQLException {
        List<Tarea> tareas = new ArrayList<>();

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement ps = JdbcSafety.prepare(connection, SQL_POR_SEMANA)) {

            ps.setInt(1, semanaId);
            try (ResultSet resultSet = ps.executeQuery()) {
                while (resultSet.next()) {
                    tareas.add(mapear(resultSet));
                }
            }
        }

        return tareas;
    }

    public List<Tarea> listarTodas() throws SQLException {
        List<Tarea> tareas = new ArrayList<>();

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement ps = JdbcSafety.prepare(connection, SQL_TODAS);
             ResultSet resultSet = ps.executeQuery()) {
            while (resultSet.next()) {
                tareas.add(mapear(resultSet));
            }
        }

        return tareas;
    }

    public Tarea obtenerPorId(int id) throws SQLException {
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

    public void insertar(Tarea tarea) throws SQLException {
        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement ps = JdbcSafety.prepare(connection, SQL_INSERTAR)) {
            bindTarea(ps, tarea);
            ps.executeUpdate();
        }
    }

    public void actualizar(Tarea tarea) throws SQLException {
        if (tarea == null || tarea.getId() == null) {
            throw new SQLException("Tarea inválida.");
        }

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement ps = JdbcSafety.prepare(connection, SQL_ACTUALIZAR)) {
            bindTarea(ps, tarea);
            ps.setLong(5, tarea.getId());
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

    private void bindTarea(PreparedStatement ps, Tarea tarea) throws SQLException {
        if (tarea == null || tarea.getSemanaId() == null) {
            throw new SQLException("Tarea inválida.");
        }
        if (tarea.getFechaLimite() == null) {
            throw new SQLException("El campo fecha_limite es obligatorio.");
        }

        ps.setLong(1, tarea.getSemanaId());
        ps.setString(2, JdbcSafety.requireTexto(tarea.getTitulo(), "titulo"));
        ps.setString(3, tarea.getDescripcion() == null ? null : tarea.getDescripcion().trim());
        ps.setDate(4, Date.valueOf(tarea.getFechaLimite()));
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
