package pe.edu.upla.portafolio.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.edu.upla.portafolio.model.Unidad;
import pe.edu.upla.portafolio.service.UnidadService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UnidadesServlet", urlPatterns = {"/unidades"})
public class UnidadesServlet extends HttpServlet {

    private final UnidadService unidadService = new UnidadService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Unidad> unidades = unidadService.listarTodas();
            request.setAttribute("unidades", unidades);
            request.getRequestDispatcher("/WEB-INF/views/unidad/unidades.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("No se pudieron cargar las unidades académicas.", e);
        }
    }
}
