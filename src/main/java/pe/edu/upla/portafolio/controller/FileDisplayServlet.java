package pe.edu.upla.portafolio.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Locale;

@WebServlet(name = "FileDisplayServlet", urlPatterns = {"/uploads/*"})
public class FileDisplayServlet extends HttpServlet {

    public static final String UPLOAD_DIR = System.getProperty("java.io.tmpdir")
            + File.separator + "portafolio_uploads";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.isBlank() || "/".equals(pathInfo)) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        String fileName = Path.of(pathInfo).getFileName().toString();
        if (fileName.isBlank() || fileName.contains("..")) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        Path archivo = Path.of(UPLOAD_DIR).resolve(fileName).normalize();
        if (!archivo.startsWith(Path.of(UPLOAD_DIR).normalize()) || !Files.isRegularFile(archivo)) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        response.setContentType(contentTypeDe(fileName, archivo));
        response.setHeader("Content-Disposition", "inline; filename=\"" + fileName + "\"");
        response.setContentLengthLong(Files.size(archivo));
        try (OutputStream out = response.getOutputStream()) {
            Files.copy(archivo, out);
        }
    }

    private String contentTypeDe(String fileName, Path archivo) throws IOException {
        String probed = Files.probeContentType(archivo);
        if (probed != null && !probed.isBlank()) {
            return probed;
        }
        String lower = fileName.toLowerCase(Locale.ROOT);
        if (lower.endsWith(".png")) {
            return "image/png";
        }
        if (lower.endsWith(".jpg") || lower.endsWith(".jpeg")) {
            return "image/jpeg";
        }
        if (lower.endsWith(".pdf")) {
            return "application/pdf";
        }
        if (lower.endsWith(".doc")) {
            return "application/msword";
        }
        if (lower.endsWith(".docx")) {
            return "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
        }
        return "application/octet-stream";
    }
}
