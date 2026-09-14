package pe.edu.upla.portafolio.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.edu.upla.portafolio.dao.ArchivoDAO;
import pe.edu.upla.portafolio.model.Semana;
import pe.edu.upla.portafolio.model.Tarea;
import pe.edu.upla.portafolio.model.Unidad;
import pe.edu.upla.portafolio.service.SemanaService;
import pe.edu.upla.portafolio.service.TareaService;
import pe.edu.upla.portafolio.service.UnidadService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "SemanaDetalleServlet", urlPatterns = {"/semana", "/semana/detalle"})
public class SemanaDetalleServlet extends HttpServlet {

    private final SemanaService semanaService = new SemanaService();
    private final TareaService tareaService = new TareaService();
    private final UnidadService unidadService = new UnidadService();
    private final ArchivoDAO archivoDAO = new ArchivoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int semanaId = parseId(request.getParameter("id"));
        if (semanaId <= 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Debe indicar una semana válida.");
            return;
        }

        try {
            Semana semana = semanaService.buscarPorId(semanaId);
            if (semana == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Semana no encontrada.");
                return;
            }

            Unidad unidad = unidadService.buscarPorId(semana.getUnidadId().intValue());
            List<Tarea> tareas = tareaService.listarPorSemana(semanaId);
            for (Tarea tarea : tareas) {
                tarea.setArchivos(archivoDAO.listarPorTarea(tarea.getId()));
            }
            String ctx = request.getContextPath();
            String unidadTitulo = unidad != null ? unidad.getTitulo() : "Unidad";

            request.setAttribute("semana", semana);
            request.setAttribute("unidad", unidad);
            request.setAttribute("tareas", tareas);
            request.setAttribute("pageTitle", semana.getTitulo() + " | Portafolio Académico");
            request.setAttribute("breadcrumbLabels", new String[]{
                    "Inicio", "Unidades", unidadTitulo, semana.getTitulo()
            });
            request.setAttribute("breadcrumbHrefs", new String[]{
                    ctx + "/",
                    ctx + "/unidades",
                    ctx + "/unidad/detalle?id=" + semana.getUnidadId(),
                    ""
            });
            request.getRequestDispatcher("/WEB-INF/views/semana/detalle.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("No se pudo cargar el detalle de la semana.", e);
        }
    }

    private int parseId(String raw) {
        try {
            return Integer.parseInt(raw);
        } catch (NumberFormatException e) {
            return -1;
        }
    }
}
