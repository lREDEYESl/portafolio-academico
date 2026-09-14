-- Portafolio Académico — FASE 20 RBAC
-- Añade estado de cuenta. El ADMIN existente queda APROBADO.

ALTER TABLE usuarios
    ADD COLUMN IF NOT EXISTS estado VARCHAR(20) DEFAULT 'PENDIENTE';

UPDATE usuarios
SET estado = 'APROBADO'
WHERE rol = 'ADMIN';

UPDATE usuarios
SET estado = 'PENDIENTE'
WHERE estado IS NULL;

ALTER TABLE usuarios
    ALTER COLUMN estado SET DEFAULT 'PENDIENTE';

ALTER TABLE usuarios
    ALTER COLUMN estado SET NOT NULL;

ALTER TABLE usuarios
    DROP CONSTRAINT IF EXISTS ck_usuarios_estado;

ALTER TABLE usuarios
    ADD CONSTRAINT ck_usuarios_estado
        CHECK (estado IN ('PENDIENTE', 'APROBADO', 'RECHAZADO'));
