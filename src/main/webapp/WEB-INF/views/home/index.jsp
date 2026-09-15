<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Inicio | Portafolio Académico");
    String ctx = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/WEB-INF/views/includes/head.jsp"/>
</head>
<body>
    <jsp:include page="/WEB-INF/views/includes/navbar.jsp"/>

    <main>
        <section class="hero">
            <div class="hero-glow"></div>
            <div class="container">
                <div class="row align-items-center g-5">
                    <div class="col-lg-7">
                        <span class="hero-badge">
                            <i class="fa-solid fa-gamepad" aria-hidden="true"></i>
                            STAGE 1 · PORTAFOLIO 2026
                        </span>
                        <h1 class="hero-title">
                            Hola, soy
                            <span class="hero-name">Rogger Palma</span>
                        </h1>
                        <p class="hero-career">Ingeniería de Sistemas</p>
                        <p class="hero-lead">
                            Compilo mi proceso de aprendizaje en un espacio claro: unidades, semanas,
                            tareas y evidencias, con una arquitectura MVC en Java, JSP y Tomcat.
                        </p>
                        <div class="d-flex flex-wrap gap-3">
                            <a class="btn btn-primary-app btn-insert-coin" href="<%= ctx %>/unidades">
                                <i class="fa-solid fa-book-open"></i> Ver unidades
                            </a>
                            <a class="btn btn-outline-app" href="#sobre-mi">
                                <i class="fa-solid fa-user"></i> Conocerme
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="hero-panel card-app player-card">
                            <p class="section-kicker mb-3">Stats del jugador</p>
                            <div class="player-stat">
                                <span>HP // Persistencia</span>
                                <div class="xp-bar" aria-hidden="true"><i style="width:92%"></i></div>
                            </div>
                            <div class="player-stat">
                                <span>XP // Arquitectura</span>
                                <div class="xp-bar" aria-hidden="true"><i style="width:78%"></i></div>
                            </div>
                            <div class="player-stat">
                                <span>MP // Redes y SO</span>
                                <div class="xp-bar" aria-hidden="true"><i style="width:84%"></i></div>
                            </div>
                            <div class="row g-3 mt-1">
                                <div class="col-6">
                                    <div class="stat-item">
                                        <span class="stat-value">04</span>
                                        <span class="stat-label">Unidades</span>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="stat-item">
                                        <span class="stat-value">15</span>
                                        <span class="stat-label">Semanas</span>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="stat-item">
                                        <span class="stat-value">MVC</span>
                                        <span class="stat-label">Arquitectura</span>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="stat-item">
                                        <span class="stat-value">JSP</span>
                                        <span class="stat-label">Interfaz</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="sobre-mi" class="section">
            <div class="container">
                <div class="row align-items-center g-5">
                    <div class="col-lg-5">
                        <div class="about-photo-frame">
                            <img src="<%= ctx %>/assets/img/perfil.jpg" alt="Foto de perfil de Rogger Palma" class="about-photo">
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <p class="section-kicker">Presentación</p>
                        <h2 class="section-title">Sobre mí</h2>
                        <p class="section-subtitle mb-4">
                            Soy estudiante de Ingeniería de Sistemas. Este portafolio reúne el trabajo
                            académico del curso: análisis, diseño, implementación y evidencias de cada unidad.
                        </p>
                        <p class="text-muted-app mb-4">
                            El objetivo es mostrar no solo el resultado final, sino el recorrido:
                            planificación, código, documentación y mejora continua. Cada sección está
                            pensada para navegar de lo general a lo específico, de la unidad al archivo.
                        </p>
                        <ul class="about-list">
                            <li><i class="fa-solid fa-check"></i> Enfoque en Java, SQL y diseño web</li>
                            <li><i class="fa-solid fa-check"></i> Organización por unidades y semanas</li>
                            <li><i class="fa-solid fa-check"></i> Evidencias listas para revisión académica</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <section id="logros" class="section pt-0">
            <div class="container">
                <div class="text-center mb-5">
                    <p class="section-kicker">Logros 8-BIT</p>
                    <h2 class="section-title">Laboratorio de Ingeniería</h2>
                    <p class="section-subtitle mx-auto">Insignias de práctica real: redes, modelado, servidores y bajo nivel.</p>
                </div>
                <div class="row g-4">
                    <div class="col-md-6 col-xl-3">
                        <article class="card-app badge-8bit h-100">
                            <span class="skill-icon"><i class="fa-solid fa-network-wired"></i></span>
                            <h3 class="skill-title">Packet Tracer</h3>
                            <p class="skill-text">Simulación de Redes LAN en Cisco Packet Tracer: VLANs, DHCP y ruteo básico.</p>
                        </article>
                    </div>
                    <div class="col-md-6 col-xl-3">
                        <article class="card-app badge-8bit h-100">
                            <span class="skill-icon"><i class="fa-solid fa-diagram-project"></i></span>
                            <h3 class="skill-title">UML</h3>
                            <p class="skill-text">UML en Enterprise Architect: casos de uso, clases, secuencia y componentes.</p>
                        </article>
                    </div>
                    <div class="col-md-6 col-xl-3">
                        <article class="card-app badge-8bit h-100">
                            <span class="skill-icon"><i class="fa-brands fa-linux"></i></span>
                            <h3 class="skill-title">Linux</h3>
                            <p class="skill-text">Servidores Linux: Apache/Tomcat, systemd, permisos y despliegue de WAR.</p>
                        </article>
                    </div>
                    <div class="col-md-6 col-xl-3">
                        <article class="card-app badge-8bit h-100">
                            <span class="skill-icon"><i class="fa-solid fa-microchip"></i></span>
                            <h3 class="skill-title">TASM</h3>
                            <p class="skill-text">TASM Assembly: registros, interrupciones y lógica a bajo nivel.</p>
                        </article>
                    </div>
                </div>
            </div>
        </section>

        <section id="habilidades" class="section section-alt">
            <div class="container">
                <div class="text-center mb-5">
                    <p class="section-kicker">Competencias</p>
                    <h2 class="section-title">Habilidades</h2>
                    <p class="section-subtitle mx-auto">Herramientas y lenguajes que utilizo en el desarrollo del portafolio y de los trabajos del curso.</p>
                </div>
                <div class="row g-4">
                    <div class="col-6 col-md-4 col-xl-2">
                        <article class="card-app skill-card text-center h-100">
                            <span class="skill-icon"><i class="fa-brands fa-java"></i></span>
                            <h3 class="skill-title">Java</h3>
                            <p class="skill-text">Servlets y MVC</p>
                        </article>
                    </div>
                    <div class="col-6 col-md-4 col-xl-2">
                        <article class="card-app skill-card text-center h-100">
                            <span class="skill-icon"><i class="fa-solid fa-database"></i></span>
                            <h3 class="skill-title">SQL</h3>
                            <p class="skill-text">Modelado de datos</p>
                        </article>
                    </div>
                    <div class="col-6 col-md-4 col-xl-2">
                        <article class="card-app skill-card text-center h-100">
                            <span class="skill-icon"><i class="fa-brands fa-html5"></i></span>
                            <h3 class="skill-title">HTML/CSS</h3>
                            <p class="skill-text">Interfaz y layout</p>
                        </article>
                    </div>
                    <div class="col-6 col-md-4 col-xl-2">
                        <article class="card-app skill-card text-center h-100">
                            <span class="skill-icon"><i class="fa-brands fa-js"></i></span>
                            <h3 class="skill-title">JavaScript</h3>
                            <p class="skill-text">Interacción visual</p>
                        </article>
                    </div>
                    <div class="col-6 col-md-4 col-xl-2">
                        <article class="card-app skill-card text-center h-100">
                            <span class="skill-icon"><i class="fa-brands fa-git-alt"></i></span>
                            <h3 class="skill-title">Git</h3>
                            <p class="skill-text">Control de versiones</p>
                        </article>
                    </div>
                    <div class="col-6 col-md-4 col-xl-2">
                        <article class="card-app skill-card text-center h-100">
                            <span class="skill-icon"><i class="fa-solid fa-diagram-project"></i></span>
                            <h3 class="skill-title">UML</h3>
                            <p class="skill-text">Diseño de software</p>
                        </article>
                    </div>
                </div>
            </div>
        </section>

        <section id="unidades-destacadas" class="section">
            <div class="container">
                <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-end gap-3 mb-5">
                    <div>
                        <p class="section-kicker">Recorrido académico</p>
                        <h2 class="section-title mb-2">Unidades destacadas</h2>
                        <p class="section-subtitle mb-0">Cuatro bloques formativos. Cada unidad agrupa semanas, tareas y evidencias.</p>
                    </div>
                    <a class="btn btn-outline-app" href="<%= ctx %>/unidades">
                        Ver todas <i class="fa-solid fa-arrow-right"></i>
                    </a>
                </div>
                <div class="row g-4">
                    <div class="col-md-6 col-xl-3">
                        <article class="card-app unit-card h-100">
                            <span class="unit-index">Unidad 01</span>
                            <h3 class="unit-title">Fundamentos</h3>
                            <p class="unit-text">Introducción al curso, entorno de trabajo y primeros entregables.</p>
                            <p class="unit-meta"><i class="fa-regular fa-calendar me-1"></i> 4 semanas</p>
                            <a class="btn btn-outline-app mt-auto" href="<%= ctx %>/unidad/detalle?id=1">Ver unidad</a>
                        </article>
                    </div>
                    <div class="col-md-6 col-xl-3">
                        <article class="card-app unit-card h-100">
                            <span class="unit-index">Unidad 02</span>
                            <h3 class="unit-title">Análisis y diseño</h3>
                            <p class="unit-text">Requerimientos, modelado UML y arquitectura de la solución.</p>
                            <p class="unit-meta"><i class="fa-regular fa-calendar me-1"></i> 4 semanas</p>
                            <a class="btn btn-outline-app mt-auto" href="<%= ctx %>/unidad/detalle?id=2">Ver unidad</a>
                        </article>
                    </div>
                    <div class="col-md-6 col-xl-3">
                        <article class="card-app unit-card h-100">
                            <span class="unit-index">Unidad 03</span>
                            <h3 class="unit-title">Implementación</h3>
                            <p class="unit-text">Desarrollo en Java, JSP y persistencia. Construcción del sistema.</p>
                            <p class="unit-meta"><i class="fa-regular fa-calendar me-1"></i> 4 semanas</p>
                            <a class="btn btn-outline-app mt-auto" href="<%= ctx %>/unidad/detalle?id=3">Ver unidad</a>
                        </article>
                    </div>
                    <div class="col-md-6 col-xl-3">
                        <article class="card-app unit-card h-100">
                            <span class="unit-index">Unidad 04</span>
                            <h3 class="unit-title">Proyecto final</h3>
                            <p class="unit-text">Integración, pruebas, despliegue y presentación del portafolio.</p>
                            <p class="unit-meta"><i class="fa-regular fa-calendar me-1"></i> 4 semanas</p>
                            <a class="btn btn-outline-app mt-auto" href="<%= ctx %>/unidad/detalle?id=4">Ver unidad</a>
                        </article>
                    </div>
                </div>
            </div>
        </section>

        <section class="section pt-0">
            <div class="container">
                <div class="cta-band card-app d-flex flex-column flex-lg-row align-items-lg-center justify-content-between gap-4">
                    <div>
                        <h2 class="section-title mb-2">Explora el trabajo por unidades</h2>
                        <p class="section-subtitle mb-0">Semanas, tareas y archivos organizados para una revisión clara.</p>
                    </div>
                    <a class="btn btn-primary-app btn-insert-coin" href="<%= ctx %>/unidades">
                        <i class="fa-solid fa-arrow-right"></i> Ir a unidades
                    </a>
                </div>
            </div>
        </section>
    </main>

    <jsp:include page="/WEB-INF/views/includes/footer.jsp"/>
</body>
</html>
