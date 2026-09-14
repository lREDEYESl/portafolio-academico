package pe.edu.upla.portafolio.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pe.edu.upla.portafolio.dao.UsuarioDAO;
import pe.edu.upla.portafolio.model.Usuario;

import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    private final UsuarioDAO usuarioDAO = new UsuarioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("pageTitle", "Login | Portafolio Académico");
        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        request.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String ctx = request.getContextPath();

        Usuario usuario = usuarioDAO.autenticar(email, password);
        if (usuario == null) {
            response.sendRedirect(ctx + "/login?error=true");
            return;
        }

        if ("PENDIENTE".equalsIgnoreCase(usuario.getEstado())) {
            response.sendRedirect(ctx + "/login?error=pendiente");
            return;
        }

        if (!"APROBADO".equalsIgnoreCase(usuario.getEstado())) {
            response.sendRedirect(ctx + "/login?error=true");
            return;
        }

        HttpSession session = request.getSession(true);
        session.setAttribute("usuario", usuario);
        response.sendRedirect(ctx + "/admin/dashboard");
    }
}
