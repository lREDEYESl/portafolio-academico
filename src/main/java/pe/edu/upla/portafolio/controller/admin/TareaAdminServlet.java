package pe.edu.upla.portafolio.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.edu.upla.portafolio.dao.SemanaDAO;
import pe.edu.upla.portafolio.dao.TareaDAO;
import pe.edu.upla.portafolio.model.Semana;
import pe.edu.upla.portafolio.model.Tarea;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

@WebServlet(name = "TareaAdminServlet", urlPatterns = {"/admin/tareas"})
public class TareaAdminServlet extends HttpServlet {

    private final TareaDAO tareaDAO = new TareaDAO();
    private final SemanaDAO semanaDAO = new SemanaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.isBlank() || "listar".equals(action)) {
            listar(request, response);
            return;
        }

        try {
            if ("crear".equals(action)) {
                cargarFormulario(request, null);
                request.getRequestDispatcher("/WEB-INF/views/admin/tarea-form.jsp").forward(request, response);
                return;
            }

            if ("editar".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Tarea tarea = tareaDAO.obtenerPorId(id);
                if (tarea == null) {
                    response.sendRedirect(request.getContextPath() + "/admin/tareas");
                    return;
                }
                cargarFormulario(request, tarea);
                request.getRequestDispatcher("/WEB-INF/views/admin/tarea-form.jsp").forward(request, response);
                return;
            }

            listar(request, response);
        } catch (SQLException | NumberFormatException e) {
            throw new ServletException("No se pudo abrir el formulario de tareas.", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        String ctx = request.getContextPath();
        String action = request.getParameter("action");

        try {
            if ("eliminar".equals(action)) {
                tareaDAO.eliminar(Integer.parseInt(request.getParameter("id")));
            } else {
                Tarea tarea = leerFormulario(request);
                if ("actualizar".equals(action) && tarea.getId() != null) {
                    tareaDAO.actualizar(tarea);
                } else {
                    tareaDAO.insertar(tarea);
                }
            }
            response.sendRedirect(ctx + "/admin/tareas");
        } catch (SQLException | IllegalArgumentException e) {
            throw new ServletException("No se pudo guardar la tarea.", e);
        }
    }

    private void listar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Tarea> tareas = tareaDAO.listarTodas();
            request.setAttribute("tareas", tareas);
            request.setAttribute("pageTitle", "Tareas | Administración");
            request.getRequestDispatcher("/WEB-INF/views/admin/tareas.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("No se pudieron cargar las tareas.", e);
        }
    }

    private void cargarFormulario(HttpServletRequest request, Tarea tarea) throws SQLException {
        List<Semana> semanas = semanaDAO.listarTodas();
        request.setAttribute("semanas", semanas);
        request.setAttribute("tarea", tarea);
        request.setAttribute("pageTitle", tarea == null ? "Nueva tarea" : "Editar tarea");
    }

    private Tarea leerFormulario(HttpServletRequest request) {
        Tarea tarea = new Tarea();
        String id = request.getParameter("id");
        if (id != null && !id.isBlank()) {
            tarea.setId(Long.parseLong(id));
        }
        tarea.setSemanaId(Long.parseLong(request.getParameter("semana_id")));
        tarea.setTitulo(request.getParameter("titulo").trim());
        tarea.setDescripcion(request.getParameter("descripcion").trim());
        tarea.setFechaLimite(LocalDate.parse(request.getParameter("fecha_limite")));
        return tarea;
    }
}
