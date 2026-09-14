package pe.edu.upla.portafolio.service;

import pe.edu.upla.portafolio.dao.UnidadDAO;
import pe.edu.upla.portafolio.model.Unidad;

import java.sql.SQLException;
import java.util.List;

public class UnidadService {

    private final UnidadDAO unidadDAO = new UnidadDAO();

    public List<Unidad> listarTodas() throws SQLException {
        return unidadDAO.listarTodas();
    }

    public Unidad buscarPorId(int id) throws SQLException {
        return unidadDAO.buscarPorId(id);
    }
}
