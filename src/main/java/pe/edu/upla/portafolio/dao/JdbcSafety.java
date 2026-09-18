package pe.edu.upla.portafolio.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Set;

final class JdbcSafety {

    private static final int QUERY_TIMEOUT_SECONDS = 15;
    private static final Set<String> ROLES = Set.of("ADMIN", "EDITOR", "USUARIO");
    private static final Set<String> ESTADOS = Set.of("APROBADO", "RECHAZADO", "PENDIENTE");
    private static final Set<String> ENTIDAD_TIPOS = Set.of("TAREA");

    private JdbcSafety() {
    }

    static PreparedStatement prepare(Connection connection, String sql) throws SQLException {
        PreparedStatement ps = connection.prepareStatement(sql);
        try {
            ps.setQueryTimeout(QUERY_TIMEOUT_SECONDS);
            return ps;
        } catch (SQLException e) {
            try {
                ps.close();
            } catch (SQLException closeError) {
                e.addSuppressed(closeError);
            }
            throw e;
        }
    }

    static String requireRol(String rol) throws SQLException {
        if (rol == null || !ROLES.contains(rol)) {
            throw new SQLException("Rol no permitido.");
        }
        return rol;
    }

    static String requireEstado(String estado) throws SQLException {
        if (estado == null || !ESTADOS.contains(estado)) {
            throw new SQLException("Estado no permitido.");
        }
        return estado;
    }

    static String requireEntidadTipo(String entidadTipo) throws SQLException {
        if (entidadTipo == null || !ENTIDAD_TIPOS.contains(entidadTipo)) {
            throw new SQLException("Tipo de entidad no permitido.");
        }
        return entidadTipo;
    }

    static String requireTexto(String valor, String campo) throws SQLException {
        if (valor == null || valor.isBlank()) {
            throw new SQLException("El campo " + campo + " es obligatorio.");
        }
        return valor.trim();
    }
}
