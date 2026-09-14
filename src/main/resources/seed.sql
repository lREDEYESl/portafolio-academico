-- Portafolio Académico — datos de prueba
-- FASE 15.4 / sílabo real de Arquitectura de Software
-- El rol no es una tabla: se carga en usuarios.rol (ADMIN, EDITOR, USUARIO).
-- Hash BCrypt de prueba. Contraseña en texto plano: password

TRUNCATE TABLE archivos, tareas, semanas, unidades, usuarios RESTART IDENTITY CASCADE;

INSERT INTO usuarios (nombre, email, password_hash, rol, estado) VALUES
(
    'Administrador del Portafolio',
    'admin@portafolio.edu',
    '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',
    'ADMIN',
    'APROBADO'
),
(
    'Estudiante Demo',
    'usuario@portafolio.edu',
    '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',
    'USUARIO',
    'APROBADO'
);

INSERT INTO unidades (titulo, descripcion) VALUES
(
    'Unidad I: Fundamentos de la Arquitectura de Software',
    'Explica los fundamentos de la arquitectura de software, utilizando los estándares internacionales, para la producción del software.'
),
(
    'Unidad II: Modelado de la Arquitectura de Software mediante POO',
    'Crea la arquitectura del software, mediante la POO, para elaborar el modelo de la arquitectura del software.'
),
(
    'Unidad III: Comunicación e Integración de Arquitecturas de Software',
    'Conoce la comunicación de arquitecturas, utilizando los métodos y técnicas adecuadas, para definir los modos de transmisión de datos entre las mismas.'
),
(
    'Unidad IV: Frameworks y Estándares para la Implementación',
    'Utiliza los frameworks de arquitectura de software, utilizando normas internacionales, para obtener la arquitectura adecuada del software.'
);

INSERT INTO semanas (unidad_id, titulo, contenido) VALUES
(1, 'Semana 1', 'Introducción a la arquitectura de software: definición, atributos de calidad y rol del arquitecto en la producción de software.'),
(1, 'Semana 2', 'Estándares internacionales (ISO/IEC/IEEE 42010) y vistas arquitectónicas para documentar decisiones de diseño.'),
(1, 'Semana 3', 'Estilos y patrones arquitectónicos clásicos: capas, cliente-servidor, pipes and filters y repositorio.'),
(1, 'Semana 4', 'Cierre de fundamentos: evaluación de atributos de calidad y evidencias de la Unidad I.'),
(2, 'Semana 5', 'Modelado orientado a objetos aplicado a la arquitectura: clases, paquetes y responsabilidades.'),
(2, 'Semana 6', 'Diagramas UML de clases y componentes para elaborar el modelo de la arquitectura del software.'),
(2, 'Semana 7', 'Diagramas de secuencia y despliegue: comportamiento e infraestructura del sistema.'),
(2, 'Semana 8', 'Cierre de modelado POO: consolidación del modelo arquitectónico de la Unidad II.'),
(3, 'Semana 9', 'Comunicación entre arquitecturas: protocolos, contratos y modos de transmisión de datos.'),
(3, 'Semana 10', 'APIs REST y mensajería: técnicas para integrar servicios y componentes.'),
(3, 'Semana 11', 'Integración de sistemas heterogéneos, sincronía/asincronía y manejo de fallos.'),
(3, 'Semana 12', 'Cierre de integración: definición de los modos de transmisión entre arquitecturas.'),
(4, 'Semana 13', 'Frameworks de arquitectura de software y su relación con normas internacionales.'),
(4, 'Semana 14', 'Selección e implementación de frameworks para obtener la arquitectura adecuada del software.'),
(4, 'Semana 15', 'Cierre del curso: evidencias finales, estándares de implementación y presentación del portafolio.');

INSERT INTO tareas (semana_id, titulo, descripcion, fecha_limite)
SELECT s.id, v.titulo, v.descripcion, v.fecha_limite::date
FROM semanas s
JOIN (
    VALUES
        (
            'Semana 1',
            'Mapa de fundamentos',
            'Elaborar un mapa conceptual de arquitectura de software, estándares y atributos de calidad.',
            '2026-09-20'
        ),
        (
            'Semana 5',
            'Modelo UML de clases',
            'Diseñar el diagrama de clases del portafolio y justificar las responsabilidades de cada componente.',
            '2026-10-18'
        ),
        (
            'Semana 9',
            'Contrato de integración',
            'Definir un contrato de API o mensajería para la comunicación entre dos módulos del sistema.',
            '2026-11-15'
        ),
        (
            'Semana 13',
            'Selección de framework',
            'Comparar dos frameworks arquitectónicos y argumentar cuál se adapta al portafolio académico.',
            '2026-12-06'
        )
) AS v(semana_titulo, titulo, descripcion, fecha_limite)
    ON v.semana_titulo = s.titulo;
