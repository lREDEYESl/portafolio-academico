package pe.edu.upla.portafolio.service;

import pe.edu.upla.portafolio.dao.SemanaDAO;
import pe.edu.upla.portafolio.model.Semana;

import java.sql.SQLException;
import java.util.List;

public class SemanaService {

    private final SemanaDAO semanaDAO = new SemanaDAO();

    public List<Semana> listarPorUnidad(int unidadId) throws SQLException {
        return semanaDAO.listarPorUnidad(unidadId);
    }

    public Semana buscarPorId(int id) throws SQLException {
        return semanaDAO.buscarPorId(id);
    }
}
