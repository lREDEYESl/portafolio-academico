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

    public List<Unidad> listarTodas() throws SQLException {
        String sql = "SELECT id, titulo, descripcion FROM unidades ORDER BY id";
        List<Unidad> unidades = new ArrayList<>();

        try (Connection connection = DatabaseConfig.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                unidades.add(mapear(resultSet));
            }
        }

        return unidades;
    }

    public Unidad buscarPorId(int id) throws SQLException {
        String sql = "SELECT id, titulo, descripcion FROM unidades WHERE id = ?";

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

    private Unidad mapear(ResultSet resultSet) throws SQLException {
        Unidad unidad = new Unidad();
        unidad.setId(resultSet.getLong("id"));
        unidad.setTitulo(resultSet.getString("titulo"));
        unidad.setDescripcion(resultSet.getString("descripcion"));
        return unidad;
    }
}
