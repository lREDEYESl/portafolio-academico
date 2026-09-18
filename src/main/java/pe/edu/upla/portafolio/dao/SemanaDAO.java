package pe.edu.upla.portafolio.dao;

import pe.edu.upla.portafolio.config.DatabaseConfig;
import pe.edu.upla.portafolio.model.Semana;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SemanaDAO {

    private static final String SQL_POR_UNIDAD = """
            SELECT id, unidad_id, titulo, contenido
            FROM semanas
            WHERE unidad_id = ?
            ORDER BY id
            """;

    private static final String SQL_POR_ID = """
            SELECT id, unidad_id, titulo, contenido
            FROM semanas
            WHERE id = ?
            """;

    private static final String SQL_TODAS = """
            SELECT id, unidad_id, titulo, contenido
            FROM semanas
            ORDER BY unidad_id, id
            """;

    public List<Semana> listarPorUnidad(int unidadId) throws SQLException {
        List<Semana> semanas = new ArrayList<>();

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement ps = JdbcSafety.prepare(connection, SQL_POR_UNIDAD)) {

            ps.setInt(1, unidadId);
            try (ResultSet resultSet = ps.executeQuery()) {
                while (resultSet.next()) {
                    semanas.add(mapear(resultSet));
                }
            }
        }

        return semanas;
    }

    public Semana buscarPorId(int id) throws SQLException {
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

    public List<Semana> listarTodas() throws SQLException {
        List<Semana> semanas = new ArrayList<>();

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement ps = JdbcSafety.prepare(connection, SQL_TODAS);
             ResultSet resultSet = ps.executeQuery()) {
            while (resultSet.next()) {
                semanas.add(mapear(resultSet));
            }
        }

        return semanas;
    }

    private Semana mapear(ResultSet resultSet) throws SQLException {
        Semana semana = new Semana();
        semana.setId(resultSet.getLong("id"));
        semana.setUnidadId(resultSet.getLong("unidad_id"));
        semana.setTitulo(resultSet.getString("titulo"));
        semana.setContenido(resultSet.getString("contenido"));
        return semana;
    }
}
