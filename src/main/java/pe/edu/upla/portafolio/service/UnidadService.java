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

    public Unidad[] unidadesVecinas(Long id) throws SQLException {
        List<Unidad> unidades = listarTodas();
        Unidad anterior = null;
        Unidad siguiente = null;
        for (int i = 0; i < unidades.size(); i++) {
            if (id != null && id.equals(unidades.get(i).getId())) {
                if (i > 0) {
                    anterior = unidades.get(i - 1);
                }
                if (i < unidades.size() - 1) {
                    siguiente = unidades.get(i + 1);
                }
                break;
            }
        }
        return new Unidad[]{anterior, siguiente};
    }
}
