package pe.edu.upla.portafolio.dao;

import pe.edu.upla.portafolio.config.DatabaseConfig;
import pe.edu.upla.portafolio.model.Unidad;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UnidadDAO {

    private static final String SQL_TODAS = "SELECT id, titulo, descripcion FROM unidades ORDER BY id";
    private static final String SQL_POR_ID = "SELECT id, titulo, descripcion FROM unidades WHERE id = ?";

    public List<Unidad> listarTodas() throws SQLException {
        List<Unidad> unidades = new ArrayList<>();

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement ps = JdbcSafety.prepare(connection, SQL_TODAS);
             ResultSet resultSet = ps.executeQuery()) {

            while (resultSet.next()) {
                unidades.add(mapear(resultSet));
            }
        }

        return unidades;
    }

    public Unidad buscarPorId(int id) throws SQLException {
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

    private Unidad mapear(ResultSet resultSet) throws SQLException {
        Unidad unidad = new Unidad();
        unidad.setId(resultSet.getLong("id"));
        unidad.setTitulo(resultSet.getString("titulo"));
        unidad.setDescripcion(resultSet.getString("descripcion"));
        return unidad;
    }
}
