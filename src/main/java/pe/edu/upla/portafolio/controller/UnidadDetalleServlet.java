package pe.edu.upla.portafolio.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.edu.upla.portafolio.model.Semana;
import pe.edu.upla.portafolio.model.Unidad;
import pe.edu.upla.portafolio.service.SemanaService;
import pe.edu.upla.portafolio.service.UnidadService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UnidadDetalleServlet", urlPatterns = {"/unidad", "/unidad/detalle"})
public class UnidadDetalleServlet extends HttpServlet {

    private final UnidadService unidadService = new UnidadService();
    private final SemanaService semanaService = new SemanaService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int unidadId = parseId(request.getParameter("id"));
        if (unidadId <= 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Debe indicar una unidad válida.");
            return;
        }

        try {
            Unidad unidad = unidadService.buscarPorId(unidadId);
            if (unidad == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Unidad no encontrada.");
                return;
            }

            List<Semana> semanas = semanaService.listarPorUnidad(unidadId);
            String ctx = request.getContextPath();

            request.setAttribute("unidad", unidad);
            request.setAttribute("semanas", semanas);
            request.setAttribute("pageTitle", unidad.getTitulo() + " | Portafolio Académico");
            request.setAttribute("breadcrumbLabels", new String[]{"Inicio", "Unidades", unidad.getTitulo()});
            request.setAttribute("breadcrumbHrefs", new String[]{ctx + "/", ctx + "/unidades", ""});
            request.getRequestDispatcher("/WEB-INF/views/unidad/detalle.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("No se pudo cargar el detalle de la unidad.", e);
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
