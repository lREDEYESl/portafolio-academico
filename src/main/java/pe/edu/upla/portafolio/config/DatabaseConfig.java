package pe.edu.upla.portafolio.config;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public final class DatabaseConfig {

    static {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    private DatabaseConfig() {
    }

    public static Connection getConnection() throws SQLException {
        String url = System.getenv("DB_URL");
        String user = System.getenv("DB_USER");
        String password = System.getenv("DB_PASSWORD");

        if (url == null) {
            Properties props = cargarPropiedadesLocales();
            if (props != null) {
                url = props.getProperty("db.url");
                user = props.getProperty("db.user");
                password = props.getProperty("db.password");
            }
        }

        if (url == null || user == null || password == null) {
            throw new SQLException("Credenciales de base de datos no configuradas");
        }

        return DriverManager.getConnection(url, user, password);
    }

    private static Properties cargarPropiedadesLocales() throws SQLException {
        try (InputStream is = Thread.currentThread().getContextClassLoader()
                .getResourceAsStream("local.properties")) {
            if (is == null) {
                return null;
            }
            Properties props = new Properties();
            props.load(is);
            return props;
        } catch (IOException e) {
            throw new SQLException("Credenciales de base de datos no configuradas", e);
        }
    }
}
