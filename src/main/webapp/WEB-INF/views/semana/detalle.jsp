<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/WEB-INF/views/includes/head.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cyber-glass.css?v=20260919w">
</head>
<body class="week-detail-body">
    <jsp:include page="/WEB-INF/views/includes/navbar.jsp"/>

    <main class="week-detail-stage">
        <section class="page-header">
            <div class="container">
                <jsp:include page="/WEB-INF/views/includes/breadcrumb.jsp"/>
                <div class="week-head-row">
                    <a class="week-back-cmd" href="${pageContext.request.contextPath}/unidad/detalle?id=${unidad.id}">
                        &lt; Volver a la Unidad
                    </a>
                    <span class="cyber-badge">
                        <i class="fa-solid fa-calendar-week"></i>
                        <c:out value="${semana.titulo}"/>
                    </span>
                </div>
                <%@ include file="/WEB-INF/views/includes/unit-quest.jsp" %>
                <%@ include file="/WEB-INF/views/includes/week-quest.jsp" %>
                <h1 class="week-detail-title">
                    <c:out value="${semana.titulo}"/>: <c:out value="${questWeekTitle}"/>
                </h1>
                <p class="cyber-copy">
                    Contenido teórico, tareas y archivos de esta semana en
                    <strong><c:out value="${unidad.titulo}"/></strong>.
                </p>
                <p class="cyber-copy">
                    <c:out value="${questWeekLore}"/>
                </p>
                <div class="unit-detail-tabs">
                    <jsp:include page="/WEB-INF/views/includes/week-rail.jsp"/>
                </div>
            </div>
        </section>

        <section class="section pt-0">
            <div class="container">
                    <article class="cyber-glass puntos-clave-panel">
                        <span class="cyber-frame" aria-hidden="true"></span>
                        <p class="cyber-kicker">Teoría</p>
                        <h2 class="cyber-heading h4 mb-3">
                            <i class="fa-solid fa-lightbulb me-2"></i>Puntos Clave de la Semana
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
                    </article>

                    <h4 class="cyber-heading mt-4 mb-3"><i class="fas fa-tasks me-2"></i>Entregables y Tareas</h4>
                    <c:choose>
                        <c:when test="${empty tareas}">
                            <div class="week-empty">
                                No hay tareas asignadas para esta semana.
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="week-task-grid">
                            <c:forEach var="tarea" items="${tareas}">
                                <article class="cyber-glass week-task-card cyber-lift">
                                    <span class="cyber-frame" aria-hidden="true"></span>
                                    <div class="week-task-head">
                                        <h5 class="cyber-heading h5 mb-0"><c:out value="${tarea.titulo}"/></h5>
                                        <span class="week-date">
                                            <i class="fa-regular fa-calendar me-1"></i>
                                            <c:out value="${tarea.fechaLimite}"/>
                                        </span>
                                    </div>
                                    <p class="cyber-copy"><c:out value="${tarea.descripcion}"/></p>
                                    <p class="cyber-kicker">
                                        <i class="fa-solid fa-paperclip me-1"></i> Archivos adjuntos
                                    </p>
                                    <c:choose>
                                        <c:when test="${empty tarea.archivos}">
                                            <span class="cyber-copy mb-0">Sin archivos adjuntos</span>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="week-evidence-grid">
                                                <c:forEach var="archivo" items="${tarea.archivos}">
                                                    <c:set var="ruta" value="${fn:toLowerCase(archivo.url)}"/>
                                                    <article class="archivo-card cyber-glass">
                                                        <span class="cyber-frame" aria-hidden="true"></span>
                                                        <div class="archivo-thumb">
                                                            <c:choose>
                                                                <c:when test="${fn:endsWith(ruta, '.png') or fn:endsWith(ruta, '.jpg') or fn:endsWith(ruta, '.jpeg')}">
                                                                    <button type="button" class="week-file-icon"
                                                                            data-lightbox="${archivo.url}"
                                                                            data-lightbox-alt="<c:out value='${archivo.nombre}'/>">
                                                                        <img src="${archivo.url}"
                                                                             alt="<c:out value='${archivo.nombre}'/>">
                                                                    </button>
                                                                </c:when>
                                                                <c:when test="${fn:endsWith(ruta, '.pdf')}">
                                                                    <button type="button" class="week-file-icon"
                                                                            data-lightbox="${archivo.url}"
                                                                            data-lightbox-alt="<c:out value='${archivo.nombre}'/>">
                                                                        <i class="fa-solid fa-scroll"></i>
                                                                    </button>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <button type="button" class="week-file-icon"
                                                                            data-lightbox="${archivo.url}"
                                                                            data-lightbox-alt="<c:out value='${archivo.nombre}'/>">
                                                                        <i class="fa-solid fa-terminal"></i>
                                                                    </button>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                        <h3 class="week-file-name"><c:out value="${archivo.nombre}"/></h3>
                                                        <div class="card-actions">
                                                            <button type="button" class="cyber-btn"
                                                                    data-lightbox="${archivo.url}"
                                                                    data-lightbox-alt="<c:out value='${archivo.nombre}'/>">
                                                                <i class="fa-solid fa-eye"></i> VER
                                                            </button>
                                                            <a class="cyber-btn is-ghost"
                                                               href="${archivo.url}"
                                                               target="_blank"
                                                               rel="noopener noreferrer"
                                                               download>
                                                                <i class="fa-solid fa-download"></i> DESCARGAR
                                                            </a>
                                                        </div>
                                                    </article>
                                                </c:forEach>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </article>
                            </c:forEach>
                            </div>
                        </c:otherwise>
                    </c:choose>

                    <article class="cyber-glass mt-4">
                        <span class="cyber-frame" aria-hidden="true"></span>
                        <p class="cyber-kicker">Bitácora</p>
                        <h2 class="cyber-heading h4">Contenido teórico de la semana</h2>
                        <p class="cyber-copy"><c:out value="${questWeekLore}"/></p>
                        <p class="cyber-copy mb-0"><c:out value="${semana.contenido}"/></p>
                    </article>

                    <p class="cyber-kicker mt-4">Contenido teórico</p>
                    <h2 class="cyber-heading mb-4">Temas de la semana</h2>
                    <div class="week-info-grid mb-5">
                        <article class="cyber-glass">
                            <span class="cyber-frame" aria-hidden="true"></span>
                            <span class="cyber-icon"><i class="fa-solid fa-bullseye"></i></span>
                            <h3 class="cyber-heading h5">Objetivos</h3>
                            <p class="cyber-copy mb-0">
                                Comprender el alcance de la semana, preparar el entorno de trabajo
                                y dejar evidencias claras para la revisión académica.
                            </p>
                        </article>
                        <article class="cyber-glass">
                            <span class="cyber-frame" aria-hidden="true"></span>
                            <span class="cyber-icon"><i class="fa-solid fa-code"></i></span>
                            <h3 class="cyber-heading h5">Práctica</h3>
                            <p class="cyber-copy mb-0">
                                Implementar o documentar el entregable de la semana, organizar
                                capturas y adjuntar los archivos de evidencia.
                            </p>
                        </article>
                    </div>
            </div>
        </section>
    </main>

    <jsp:include page="/WEB-INF/views/includes/footer.jsp"/>
</body>
</html>
