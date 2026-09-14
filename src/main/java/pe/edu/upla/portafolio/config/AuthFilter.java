package pe.edu.upla.portafolio.config;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pe.edu.upla.portafolio.model.Usuario;

import java.io.IOException;

@WebFilter(filterName = "AuthFilter", urlPatterns = {"/admin/*"})
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String ctx = request.getContextPath();
        String ruta = request.getRequestURI().substring(ctx.length());

        HttpSession session = request.getSession(false);
        Usuario usuario = session == null ? null : (Usuario) session.getAttribute("usuario");

        if (usuario == null) {
            response.sendRedirect(ctx + "/login");
            return;
        }

        boolean rutaUsuarios = ruta.startsWith("/admin/usuarios");
        if (rutaUsuarios && !"ADMIN".equals(usuario.getRol())) {
            response.sendRedirect(ctx + "/admin/dashboard?error=permisos");
            return;
        }

        chain.doFilter(request, response);
    }
}
