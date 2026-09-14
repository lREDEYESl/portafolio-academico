package pe.edu.upla.portafolio.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;
import pe.edu.upla.portafolio.dao.UsuarioDAO;
import pe.edu.upla.portafolio.model.Usuario;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Set;

@WebServlet(name = "UsuarioAdminServlet", urlPatterns = {"/admin/usuarios"})
public class UsuarioAdminServlet extends HttpServlet {

    private static final Set<String> ROLES = Set.of("ADMIN", "EDITOR", "USUARIO");
    private final UsuarioDAO usuarioDAO = new UsuarioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if ("editar".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Usuario usuarioEditar = usuarioDAO.obtenerPorId(id);
                if (usuarioEditar == null) {
                    response.sendRedirect(request.getContextPath() + "/admin/usuarios");
                    return;
                }
                request.setAttribute("usuarioEditar", usuarioEditar);
                request.setAttribute("pageTitle", "Editar usuario | Administración");
                request.getRequestDispatcher("/WEB-INF/views/admin/usuario-form.jsp").forward(request, response);
                return;
            }

            List<Usuario> usuarios = usuarioDAO.listarTodos();
            request.setAttribute("usuarios", usuarios);
            request.setAttribute("pageTitle", "Usuarios | Administración");
            request.getRequestDispatcher("/WEB-INF/views/admin/usuarios.jsp").forward(request, response);
        } catch (SQLException | NumberFormatException e) {
            throw new ServletException("No se pudieron cargar los usuarios.", e);
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
                usuarioDAO.eliminar(Integer.parseInt(request.getParameter("id")));
                response.sendRedirect(ctx + "/admin/usuarios");
                return;
            }

            if ("actualizar".equals(action)) {
                actualizarUsuario(request);
                response.sendRedirect(ctx + "/admin/usuarios");
                return;
            }

            int usuarioId = Integer.parseInt(request.getParameter("usuario_id"));
            usuarioDAO.cambiarEstado(usuarioId, request.getParameter("nuevo_estado"));
            response.sendRedirect(ctx + "/admin/usuarios");
        } catch (SQLException | NumberFormatException e) {
            throw new ServletException("No se pudo procesar la acción de usuarios.", e);
        }
    }

    private void actualizarUsuario(HttpServletRequest request) throws SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String rol = request.getParameter("rol");
        String nuevaPassword = request.getParameter("nuevaPassword");

        if (nombre == null || email == null || !ROLES.contains(rol)) {
            throw new SQLException("Datos de usuario inválidos.");
        }

        Usuario usuario = new Usuario();
        usuario.setId((long) id);
        usuario.setNombre(nombre.trim());
        usuario.setEmail(email.trim());
        usuario.setRol(rol);
        usuarioDAO.actualizar(usuario);

        if (nuevaPassword != null && !nuevaPassword.isBlank()) {
            String hash = BCrypt.hashpw(nuevaPassword, BCrypt.gensalt());
            usuarioDAO.actualizarPassword(id, hash);
        }
    }
}
