package pe.edu.upla.portafolio.service;

import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;
import java.util.Properties;

public class SupabaseStorageService {

    private static final String BUCKET = "archivos";
    private static final HttpClient CLIENT = HttpClient.newBuilder()
            .connectTimeout(Duration.ofSeconds(20))
            .build();

    public String subir(byte[] contenido, String nombreUnico, String contentType)
            throws IOException, InterruptedException {
        String supabaseUrl = normalizarBase(credencial("SUPABASE_URL", "supabase.url"));
        String supabaseKey = credencial("SUPABASE_KEY", "supabase.key");
        if (supabaseUrl == null || supabaseKey == null) {
            throw new IOException("Credenciales de Supabase no configuradas");
        }

        String tipo = (contentType == null || contentType.isBlank())
                ? "application/octet-stream"
                : contentType;
        String encodedName = java.net.URLEncoder.encode(nombreUnico, java.nio.charset.StandardCharsets.UTF_8)
                .replace("+", "%20");
        String endpoint = supabaseUrl + "/storage/v1/object/" + BUCKET + "/" + encodedName;

        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(endpoint))
                .timeout(Duration.ofSeconds(60))
                .header("Authorization", "Bearer " + supabaseKey)
                .header("apikey", supabaseKey)
                .header("Content-Type", tipo)
                .POST(HttpRequest.BodyPublishers.ofByteArray(contenido))
                .build();

        HttpResponse<String> response = CLIENT.send(request, HttpResponse.BodyHandlers.ofString());
        if (response.statusCode() != 200) {
            throw new IOException("Error HTTP " + response.statusCode() + " al subir a Supabase: " + response.body());
        }

        return supabaseUrl + "/storage/v1/object/public/" + BUCKET + "/" + nombreUnico;
    }

    public void eliminarArchivoFisico(String urlOArchivoPath) throws IOException, InterruptedException {
        String objectName = extraerNombreObjeto(urlOArchivoPath);
        if (objectName == null || objectName.isBlank()) {
            throw new IOException("No se pudo determinar el objeto a eliminar en Storage.");
        }

        String supabaseUrl = normalizarBase(credencial("SUPABASE_URL", "supabase.url"));
        String supabaseKey = credencial("SUPABASE_KEY", "supabase.key");
        if (supabaseUrl == null || supabaseKey == null) {
            throw new IOException("Credenciales de Supabase no configuradas");
        }

        String endpoint = supabaseUrl + "/storage/v1/object/" + BUCKET + "/" + encodeObjectPath(objectName);
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(endpoint))
                .timeout(Duration.ofSeconds(30))
                .header("Authorization", "Bearer " + supabaseKey)
                .header("apikey", supabaseKey)
                .DELETE()
                .build();

        HttpResponse<String> response = CLIENT.send(request, HttpResponse.BodyHandlers.ofString());
        int status = response.statusCode();
        if (status == 200 || status == 204 || status == 404) {
            return;
        }
        throw new IOException("Error HTTP " + status + " al eliminar de Supabase: " + response.body());
    }

    private static String extraerNombreObjeto(String urlOArchivoPath) {
        if (urlOArchivoPath == null || urlOArchivoPath.isBlank()) {
            return null;
        }
        String valor = recortarQuery(urlOArchivoPath.trim());
        String publicMarker = "/storage/v1/object/public/" + BUCKET + "/";
        String privateMarker = "/storage/v1/object/" + BUCKET + "/";
        int idx = valor.indexOf(publicMarker);
        if (idx >= 0) {
            return decodePath(valor.substring(idx + publicMarker.length()));
        }
        idx = valor.indexOf(privateMarker);
        if (idx >= 0) {
            return decodePath(valor.substring(idx + privateMarker.length()));
        }
        String prefix = BUCKET + "/";
        if (valor.startsWith(prefix)) {
            return decodePath(valor.substring(prefix.length()));
        }
        int slash = valor.lastIndexOf('/');
        return decodePath(slash >= 0 ? valor.substring(slash + 1) : valor);
    }

    private static String recortarQuery(String valor) {
        int query = valor.indexOf('?');
        if (query >= 0) {
            valor = valor.substring(0, query);
        }
        int hash = valor.indexOf('#');
        if (hash >= 0) {
            valor = valor.substring(0, hash);
        }
        return valor;
    }

    private static String decodePath(String path) {
        if (path == null || path.isBlank()) {
            return path;
        }
        return java.net.URLDecoder.decode(path, java.nio.charset.StandardCharsets.UTF_8);
    }

    private static String encodeObjectPath(String objectName) {
        String[] parts = objectName.split("/");
        StringBuilder encoded = new StringBuilder();
        for (int i = 0; i < parts.length; i++) {
            if (parts[i].isBlank()) {
                continue;
            }
            if (encoded.length() > 0) {
                encoded.append('/');
            }
            encoded.append(java.net.URLEncoder.encode(parts[i], java.nio.charset.StandardCharsets.UTF_8)
                    .replace("+", "%20"));
        }
        return encoded.toString();
    }

    private static String credencial(String envKey, String propertyKey) throws IOException {
        String valor = System.getenv(envKey);
        if (valor != null && !valor.isBlank()) {
            return valor.trim();
        }
        Properties props = cargarPropiedadesLocales();
        if (props == null) {
            return null;
        }
        valor = props.getProperty(propertyKey);
        return (valor == null || valor.isBlank()) ? null : valor.trim();
    }

    private static String normalizarBase(String supabaseUrl) {
        if (supabaseUrl == null) {
            return null;
        }
        String base = supabaseUrl.trim();
        while (base.endsWith("/")) {
            base = base.substring(0, base.length() - 1);
        }
        if (base.endsWith("/rest/v1")) {
            base = base.substring(0, base.length() - "/rest/v1".length());
        }
        return base;
    }

    private static Properties cargarPropiedadesLocales() throws IOException {
        try (InputStream is = Thread.currentThread().getContextClassLoader()
                .getResourceAsStream("local.properties")) {
            if (is == null) {
                return null;
            }
            Properties props = new Properties();
            props.load(is);
            return props;
        }
    }
}
