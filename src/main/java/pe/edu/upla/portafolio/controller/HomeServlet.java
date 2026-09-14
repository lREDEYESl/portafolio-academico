package pe.edu.upla.portafolio.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

// No mapear "/" — en el spec de Servlets ese patrón reemplaza al DefaultServlet
// y Tomcat deja de servir CSS, JS e imágenes de /assets.
@WebServlet(name = "HomeServlet", urlPatterns = {"", "/home"})
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Aquí le decimos al Servlet que envíe la petición al archivo JSP
        request.getRequestDispatcher("/WEB-INF/views/home/index.jsp").forward(request, response);
    }
}