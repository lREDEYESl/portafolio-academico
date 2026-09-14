package pe.edu.upla.portafolio.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import pe.edu.upla.portafolio.dao.ArchivoDAO;
import pe.edu.upla.portafolio.dao.TareaDAO;
import pe.edu.upla.portafolio.model.Archivo;
import pe.edu.upla.portafolio.model.Tarea;
import pe.edu.upla.portafolio.service.SupabaseStorageService;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.UUID;

@WebServlet(name = "ArchivoAdminServlet", urlPatterns = {"/admin/archivos"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
public class ArchivoAdminServlet extends HttpServlet {

    private static final Set<String> EXTENSIONES = Set.of(".pdf", ".png", ".jpg", ".jpeg", ".doc", ".docx");

    private final ArchivoDAO archivoDAO = new ArchivoDAO();
    private final TareaDAO tareaDAO = new TareaDAO();
    private final SupabaseStorageService storageService = new SupabaseStorageService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Archivo> archivos = archivoDAO.listarTodos();
            List<Tarea> tareas = tareaDAO.listarTodas();
            request.setAttribute("archivos", archivos);
            request.setAttribute("tareas", tareas);
            request.setAttribute("pageTitle", "Archivos | Administración");
            request.getRequestDispatcher("/WEB-INF/views/admin/archivos.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("No se pudieron cargar los archivos.", e);
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
                archivoDAO.eliminar(Integer.parseInt(request.getParameter("id")));
            } else {
                Archivo archivo = leerYGuardarArchivo(request);
                archivoDAO.insertar(archivo);
            }
            response.sendRedirect(ctx + "/admin/archivos");
        } catch (SQLException | IllegalArgumentException | InterruptedException e) {
            if (e instanceof InterruptedException) {
                Thread.currentThread().interrupt();
            }
            throw new ServletException("No se pudo procesar el archivo.", e);
        }
    }

    private Archivo leerYGuardarArchivo(HttpServletRequest request)
            throws IOException, ServletException, InterruptedException {
        Part filePart = request.getPart("archivo");
        if (filePart == null || filePart.getSize() == 0 || filePart.getSubmittedFileName() == null
                || filePart.getSubmittedFileName().isBlank()) {
            throw new ServletException("Debe seleccionar un archivo.");
        }

        String originalName = new File(filePart.getSubmittedFileName()).getName();
        String extension = extensionDe(originalName);
        if (!EXTENSIONES.contains(extension)) {
            throw new ServletException("Formato no permitido. Use PDF, PNG, JPG, DOC o DOCX.");
        }

        String baseName = originalName.substring(0, originalName.length() - extension.length());
        String safeBase = baseName.replaceAll("[^a-zA-Z0-9_-]", "_").replaceAll("_+", "_");
        if (safeBase.isBlank() || "_".equals(safeBase)) {
            safeBase = "archivo";
        }
        String nombreUnico = UUID.randomUUID() + "_" + safeBase + extension;
        byte[] bytes = filePart.getInputStream().readAllBytes();
        String urlPublica = storageService.subir(bytes, nombreUnico, filePart.getContentType());

        String nombreVisible = request.getParameter("nombre");
        if (nombreVisible == null || nombreVisible.isBlank()) {
            nombreVisible = safeBase + extension;
        }

        Archivo archivo = new Archivo();
        archivo.setEntidadTipo("TAREA");
        archivo.setEntidadId(Long.parseLong(request.getParameter("tarea_id")));
        archivo.setNombre(nombreVisible.trim());
        archivo.setUrl(urlPublica);
        return archivo;
    }

    private String extensionDe(String fileName) {
        int punto = fileName.lastIndexOf('.');
        if (punto < 0 || punto == fileName.length() - 1) {
            return "";
        }
        return fileName.substring(punto).toLowerCase(Locale.ROOT);
    }
}
