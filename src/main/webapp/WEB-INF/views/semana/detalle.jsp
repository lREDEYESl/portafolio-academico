<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/WEB-INF/views/includes/head.jsp"/>
</head>
<body>
    <jsp:include page="/WEB-INF/views/includes/navbar.jsp"/>

    <main>
        <section class="page-header">
            <div class="container">
                <jsp:include page="/WEB-INF/views/includes/breadcrumb.jsp"/>
                <span class="hero-badge mb-3">
                    <i class="fa-solid fa-calendar-week"></i>
                    Unidad 0<c:out value="${unidad.id}"/> · Semana 0<c:out value="${semana.id}"/>
                </span>
                <h1 class="section-title"><c:out value="${semana.titulo}"/></h1>
                <p class="section-subtitle mb-0">
                    Contenido teórico, tareas y archivos de esta semana en
                    <strong><c:out value="${unidad.titulo}"/></strong>.
                </p>
            </div>
        </section>

        <section class="section pt-0">
            <div class="container">
                <div class="card bg-dark border-secondary text-light mb-4 shadow-sm">
                    <div class="card-body text-light">
                        <h2 class="h4 mb-3 text-light">
                            <i class="fa-solid fa-lightbulb me-2 text-info"></i>Puntos Clave de la Semana
                        </h2>
                        <c:choose>
                            <c:when test="${semana.titulo == 'Semana 1'}">
                                <ul class="mb-0">
                                    <li><strong>Fundamentos:</strong> Conceptos, objetivos e importancia de la arquitectura de software.</li>
                                    <li><strong>Rol del Arquitecto:</strong> Diferencia entre diseño y arquitectura, y alineación con los objetivos del negocio.</li>
                                    <li><strong>Impacto:</strong> Elementos fundamentales y su impacto directo en la calidad y sostenibilidad del proyecto.</li>
                                </ul>
                            </c:when>
                            <c:when test="${semana.titulo == 'Semana 2'}">
                                <ul class="mb-0">
                                    <li><strong>Atributos de Calidad:</strong> Rendimiento, seguridad, disponibilidad y mantenibilidad (basados en ISO/IEC 25010).</li>
                                    <li><strong>Principios Arquitectónicos:</strong> Trade-offs y decisiones de diseño a alto nivel.</li>
                                    <li><strong>Estándares Internacionales:</strong> Normativas aplicables al ciclo de vida del desarrollo de software.</li>
                                </ul>
                            </c:when>
                            <c:when test="${semana.titulo == 'Semana 3'}">
                                <ul class="mb-0">
                                    <li><strong>Estilos Arquitectónicos:</strong> Monolítico, Cliente-Servidor, y Arquitecturas Orientadas a Eventos.</li>
                                    <li><strong>Patrones Estructurales:</strong> Capas (Layered), MVC y Hexagonal (Puertos y Adaptadores).</li>
                                    <li><strong>Selección:</strong> Criterios para elegir la alternativa más adecuada según los requerimientos del proyecto.</li>
                                </ul>
                            </c:when>
                            <c:when test="${semana.titulo == 'Semana 4'}">
                                <ul class="mb-0">
                                    <li><strong>Modelos de Representación:</strong> Uso del Modelo 4+1 vistas (Kruchten) y el Modelo C4 (Contexto, Contenedores, Componentes, Código).</li>
                                    <li><strong>Documentación:</strong> Elaboración de ADRs (Architecture Decision Records).</li>
                                    <li><strong>UML:</strong> Justificación de decisiones usando diagramas estandarizados.</li>
                                </ul>
                            </c:when>
                            <c:when test="${semana.titulo == 'Semana 5'}">
                                <ul class="mb-0">
                                    <li><strong>POO a Nivel Arquitectónico:</strong> Aplicación de abstracción y encapsulamiento en los límites de los componentes.</li>
                                    <li><strong>Acoplamiento:</strong> Herencia y polimorfismo para lograr sistemas extensibles y bajo acoplamiento.</li>
                                    <li><strong>Modelos Coherentes:</strong> Construcción de propuestas basadas en requisitos funcionales.</li>
                                </ul>
                            </c:when>
                            <c:when test="${semana.titulo == 'Semana 6'}">
                                <ul class="mb-0">
                                    <li><strong>Modelado Estructural UML:</strong> Diseño de diagramas de clases y paquetes para definir la estructura estática.</li>
                                    <li><strong>Modelado de Comportamiento:</strong> Diagramas de casos de uso y de secuencia para el flujo de operaciones.</li>
                                    <li><strong>Buenas Prácticas:</strong> Alineación del modelo UML con la arquitectura propuesta.</li>
                                </ul>
                            </c:when>
                            <c:when test="${semana.titulo == 'Semana 7'}">
                                <ul class="mb-0">
                                    <li><strong>Diseño de Componentes:</strong> Identificación de módulos, responsabilidades y contratos de interfaces.</li>
                                    <li><strong>Estratificación:</strong> Diseño de capas lógicas (Presentación, Negocio, Persistencia).</li>
                                    <li><strong>Métricas:</strong> Evaluación de alta cohesión y bajo acoplamiento.</li>
                                </ul>
                            </c:when>
                            <c:when test="${semana.titulo == 'Semana 8'}">
                                <ul class="mb-0">
                                    <li><strong>Validación:</strong> Integración de artefactos orientados a objetos.</li>
                                    <li><strong>Evaluación:</strong> Uso de métodos como ATAM (Architecture Tradeoff Analysis Method).</li>
                                    <li><strong>Sustentación:</strong> Justificación técnica de las decisiones de diseño adoptadas.</li>
                                </ul>
                            </c:when>
                            <c:when test="${semana.titulo == 'Semana 9'}">
                                <ul class="mb-0">
                                    <li><strong>Mecanismos de Comunicación:</strong> Interacción síncrona vs. asíncrona entre componentes.</li>
                                    <li><strong>Protocolos:</strong> Uso de HTTP/REST, gRPC y WebSockets.</li>
                                    <li><strong>Flujos de Información:</strong> Diseño de modelos de interacción para sistemas distribuidos.</li>
                                </ul>
                            </c:when>
                            <c:when test="${semana.titulo == 'Semana 10'}">
                                <ul class="mb-0">
                                    <li><strong>Integración de Sistemas:</strong> Patrones de integración empresarial e interoperabilidad.</li>
                                    <li><strong>Tecnologías:</strong> Servicios Web, APIs RESTful y Colas de Mensajería (RabbitMQ/Kafka).</li>
                                    <li><strong>Selección de Métodos:</strong> Evaluación de alternativas según requerimientos no funcionales.</li>
                                </ul>
                            </c:when>
                            <c:when test="${semana.titulo == 'Semana 11'}">
                                <ul class="mb-0">
                                    <li><strong>Diseño de Interfaces (API):</strong> Contratos de datos, versionamiento y seguridad.</li>
                                    <li><strong>Transmisión de Datos:</strong> Formatos estándar como JSON, XML y Protocol Buffers.</li>
                                    <li><strong>Interoperabilidad:</strong> Garantizar la correcta transmisión de información entre subsistemas.</li>
                                </ul>
                            </c:when>
                            <c:when test="${semana.titulo == 'Semana 12'}">
                                <ul class="mb-0">
                                    <li><strong>Implementación:</strong> Desarrollo de las interfaces y mecanismos definidos.</li>
                                    <li><strong>Pruebas de Integración:</strong> Verificación de integridad, disponibilidad y tolerancia a fallos.</li>
                                    <li><strong>Eficiencia:</strong> Monitoreo y validación de la carga de datos.</li>
                                </ul>
                            </c:when>
                            <c:when test="${semana.titulo == 'Semana 13'}">
                                <ul class="mb-0">
                                    <li><strong>Frameworks de Arquitectura:</strong> Características, Inversión de Control (IoC) e Inyección de Dependencias (DI).</li>
                                    <li><strong>Soluciones Escalables:</strong> Comparativa de entornos (Ej. Spring Boot, Jakarta EE).</li>
                                    <li><strong>Alineación:</strong> Contribución del framework a los requisitos del proyecto.</li>
                                </ul>
                            </c:when>
                            <c:when test="${semana.titulo == 'Semana 14'}">
                                <ul class="mb-0">
                                    <li><strong>Buenas Prácticas Aplicadas:</strong> Patrones GoF, Clean Code y Secure by Design.</li>
                                    <li><strong>Criterios de Calidad:</strong> Optimización de escalabilidad, seguridad y rendimiento.</li>
                                    <li><strong>Selección Tecnológica:</strong> Decisiones basadas en el contexto del despliegue.</li>
                                </ul>
                            </c:when>
                            <c:when test="${semana.titulo == 'Semana 15'}">
                                <ul class="mb-0">
                                    <li><strong>Integración Final:</strong> Ensamblaje de patrones de diseño, comunicación y principios arquitectónicos.</li>
                                    <li><strong>Implementación:</strong> Despliegue de componentes utilizando el framework seleccionado.</li>
                                    <li><strong>Evaluación y Optimización:</strong> Métricas de calidad y cumplimiento final de los requisitos.</li>
                                </ul>
                            </c:when>
                            <c:otherwise>
                                <ul class="mb-0">
                                    <li>Revisa el material adjunto para esta semana.</li>
                                </ul>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <h4 class="text-light mt-4 mb-3"><i class="fas fa-tasks me-2"></i>Entregables y Tareas</h4>
                <c:choose>
                    <c:when test="${empty tareas}">
                        <div class="alert alert-secondary">
                            <span class="alert-hud">NO QUEST</span>
                            No hay tareas asignadas para esta semana.
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="tarea" items="${tareas}">
                            <div class="card bg-dark border-secondary text-light mb-3 shadow-sm task-card">
                                <div class="card-body">
                                    <div class="d-flex flex-wrap justify-content-between align-items-start gap-2 mb-2">
                                        <h5 class="card-title mb-0"><c:out value="${tarea.titulo}"/></h5>
                                        <span class="badge rounded-pill text-bg-info text-dark">
                                            <i class="fa-regular fa-calendar me-1"></i>
                                            <c:out value="${tarea.fechaLimite}"/>
                                        </span>
                                    </div>
                                    <p class="card-text text-secondary mb-3"><c:out value="${tarea.descripcion}"/></p>
                                    <div class="task-attachments p-3 rounded">
                                        <p class="small text-uppercase text-info mb-2 mb-md-3">
                                            <i class="fa-solid fa-paperclip me-1"></i> Archivos adjuntos
                                        </p>
                                        <c:choose>
                                            <c:when test="${empty tarea.archivos}">
                                                <span class="text-muted small">Sin archivos adjuntos</span>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="d-flex flex-column gap-2">
                                                    <c:forEach var="archivo" items="${tarea.archivos}">
                                                        <c:set var="ruta" value="${fn:toLowerCase(archivo.url)}"/>
                                                        <div class="d-flex flex-wrap align-items-center gap-2">
                                                            <c:choose>
                                                                <c:when test="${fn:endsWith(ruta, '.png') or fn:endsWith(ruta, '.jpg') or fn:endsWith(ruta, '.jpeg')}">
                                                                    <img src="${archivo.url}"
                                                                         alt="<c:out value='${archivo.nombre}'/>"
                                                                         width="50" height="50"
                                                                         class="rounded"
                                                                         style="object-fit: cover;">
                                                                </c:when>
                                                                <c:when test="${fn:endsWith(ruta, '.pdf')}">
                                                                    <i class="fa-solid fa-file-pdf fa-2x text-danger"></i>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <i class="fa-solid fa-file-lines fa-2x text-info"></i>
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <span class="small"><c:out value="${archivo.nombre}"/></span>
                                                            <a href="${archivo.url}"
                                                               target="_blank"
                                                               class="btn btn-sm btn-outline-info rounded-pill">
                                                                <i class="fas fa-eye me-1"></i>Vista previa rápida
                                                            </a>
                                                            <a href="${archivo.url}"
                                                               target="_blank"
                                                               class="btn btn-sm btn-outline-light rounded-pill">
                                                                <i class="fas fa-external-link-alt me-1"></i>Abrir
                                                            </a>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>

                <p class="section-kicker">Contenido teórico</p>
                <h2 class="section-title mb-4">Temas de la semana</h2>
                <div class="row g-4 mb-5">
                    <div class="col-md-4">
                        <article class="card-app h-100">
                            <span class="skill-icon mb-3"><i class="fa-solid fa-bullseye"></i></span>
                            <h3 class="h5">Objetivos</h3>
                            <p class="text-muted-app mb-0">
                                Comprender el alcance de la semana, preparar el entorno de trabajo
                                y dejar evidencias claras para la revisión académica.
                            </p>
                        </article>
                    </div>
                    <div class="col-md-4">
                        <article class="card-app h-100">
                            <span class="skill-icon mb-3"><i class="fa-solid fa-book"></i></span>
                            <h3 class="h5">Teoría</h3>
                            <p class="text-muted-app mb-0"><c:out value="${semana.contenido}"/></p>
                        </article>
                    </div>
                    <div class="col-md-4">
                        <article class="card-app h-100">
                            <span class="skill-icon mb-3"><i class="fa-solid fa-code"></i></span>
                            <h3 class="h5">Práctica</h3>
                            <p class="text-muted-app mb-0">
                                Implementar o documentar el entregable de la semana, organizar
                                capturas y adjuntar los archivos de evidencia.
                            </p>
                        </article>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <jsp:include page="/WEB-INF/views/includes/footer.jsp"/>
</body>
</html>
