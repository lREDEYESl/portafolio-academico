-- Portafolio Académico — esquema PostgreSQL
-- Fases 14 y 15: DDL con PK, FK, UNIQUE, CHECK y NOT NULL.

DROP TABLE IF EXISTS archivos CASCADE;
DROP TABLE IF EXISTS tareas CASCADE;
DROP TABLE IF EXISTS semanas CASCADE;
DROP TABLE IF EXISTS unidades CASCADE;
DROP TABLE IF EXISTS usuarios CASCADE;

CREATE TABLE usuarios (
    id             BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre         VARCHAR(120)  NOT NULL,
    email          VARCHAR(180)  NOT NULL,
    password_hash  VARCHAR(255)  NOT NULL,
    rol            VARCHAR(20)   NOT NULL DEFAULT 'USUARIO',
    estado         VARCHAR(20)   NOT NULL DEFAULT 'PENDIENTE',
    CONSTRAINT uq_usuarios_email UNIQUE (email),
    CONSTRAINT ck_usuarios_email CHECK (email ~* '^[^@]+@[^@]+\.[^@]+$'),
    CONSTRAINT ck_usuarios_rol CHECK (rol IN ('ADMIN', 'EDITOR', 'USUARIO')),
    CONSTRAINT ck_usuarios_estado CHECK (estado IN ('PENDIENTE', 'APROBADO', 'RECHAZADO'))
);

CREATE TABLE unidades (
    id           BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo       VARCHAR(150) NOT NULL,
    descripcion  TEXT         NOT NULL
);

CREATE TABLE semanas (
    id          BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    unidad_id   BIGINT       NOT NULL,
    titulo      VARCHAR(150) NOT NULL,
    contenido   TEXT         NOT NULL,
    CONSTRAINT fk_semanas_unidad
        FOREIGN KEY (unidad_id)
        REFERENCES unidades (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE tareas (
    id            BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    semana_id     BIGINT       NOT NULL,
    titulo        VARCHAR(150) NOT NULL,
    descripcion   TEXT         NOT NULL,
    fecha_limite  DATE         NOT NULL,
    CONSTRAINT fk_tareas_semana
        FOREIGN KEY (semana_id)
        REFERENCES semanas (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Relación polimórfica: un archivo puede pertenecer a unidad, semana o tarea.
CREATE TABLE archivos (
    id            BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    entidad_tipo  VARCHAR(20)  NOT NULL,
    entidad_id    BIGINT       NOT NULL,
    nombre        VARCHAR(255) NOT NULL,
    url           VARCHAR(500) NOT NULL,
    CONSTRAINT ck_archivos_entidad_tipo
        CHECK (entidad_tipo IN ('UNIDAD', 'SEMANA', 'TAREA')),
    CONSTRAINT ck_archivos_url CHECK (url <> '')
);

CREATE INDEX idx_semanas_unidad_id ON semanas (unidad_id);
CREATE INDEX idx_tareas_semana_id ON tareas (semana_id);
CREATE INDEX idx_archivos_entidad ON archivos (entidad_tipo, entidad_id);
CREATE INDEX idx_usuarios_rol ON usuarios (rol);

COMMENT ON TABLE usuarios IS 'Cuentas del portafolio. La contraseña se almacena como hash, nunca en texto plano.';
COMMENT ON TABLE unidades IS 'Bloques académicos del curso.';
COMMENT ON TABLE semanas IS 'Semanas asociadas a una unidad (1:N).';
COMMENT ON TABLE tareas IS 'Actividades de una semana (1:N).';
COMMENT ON TABLE archivos IS 'Metadatos de evidencias. El archivo físico no se guarda en PostgreSQL.';
