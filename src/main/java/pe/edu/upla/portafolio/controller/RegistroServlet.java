package pe.edu.upla.portafolio.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.edu.upla.portafolio.dao.UsuarioDAO;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "RegistroServlet", urlPatterns = {"/registro"})
public class RegistroServlet extends HttpServlet {

    private final UsuarioDAO usuarioDAO = new UsuarioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("pageTitle", "Solicitar acceso | Portafolio Académico");
        request.getRequestDispatcher("/WEB-INF/views/registro.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        request.setCharacterEncoding("UTF-8");
        String ctx = request.getContextPath();
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (nombre == null || nombre.isBlank() || email == null || email.isBlank()
                || password == null || password.isBlank()) {
            response.sendRedirect(ctx + "/registro?error=datos");
            return;
        }

        try {
            if (usuarioDAO.existeEmail(email)) {
                response.sendRedirect(ctx + "/registro?error=existe");
                return;
            }
            usuarioDAO.registrar(nombre, email, password);
            response.sendRedirect(ctx + "/login?ok=registro");
        } catch (SQLException e) {
            response.sendRedirect(ctx + "/registro?error=datos");
        }
    }
}
