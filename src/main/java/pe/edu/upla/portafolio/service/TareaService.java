package pe.edu.upla.portafolio.service;

import pe.edu.upla.portafolio.dao.TareaDAO;
import pe.edu.upla.portafolio.model.Tarea;

import java.sql.SQLException;
import java.util.List;

public class TareaService {

    private final TareaDAO tareaDAO = new TareaDAO();

    public List<Tarea> listarPorSemana(int semanaId) throws SQLException {
        return tareaDAO.listarPorSemana(semanaId);
    }
}
