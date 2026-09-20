<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Inicio | Portafolio Académico");
    String ctx = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/WEB-INF/views/includes/head.jsp"/>
    <link rel="stylesheet" href="<%= ctx %>/assets/css/cyber-glass.css?v=20260919u">
</head>
<body class="cyber-home-body">
    <jsp:include page="/WEB-INF/views/includes/navbar.jsp"/>

    <main class="cyber-home">
        <section class="hero">
            <div class="hero-glow"></div>
            <div class="container">
                <div class="row align-items-center g-5">
                    <div class="col-lg-7">
                        <span class="cyber-badge">
                            <i class="fa-solid fa-gamepad" aria-hidden="true"></i>
                            STAGE 1 · PORTAFOLIO 2026
                        </span>
                        <h1 class="hero-title">
                            Hola, soy
                            <span class="hero-name">Rogger Palma</span>
                        </h1>
                        <p class="hero-career">Estudiante de Ingeniería de Sistemas | Especialista en Redes, Software y Arquitectura</p>
                        <p class="hero-lead">
                            Compilo mi proceso de aprendizaje en un espacio claro: unidades, semanas,
                            tareas y evidencias, con una arquitectura MVC en Java, JSP y Tomcat.
                        </p>
                        <div class="hero-actions">
                            <a class="cyber-btn" href="<%= ctx %>/unidades">
                                <i class="fa-solid fa-book-open"></i> VER UNIDADES
                            </a>
                            <a class="cyber-btn is-ghost" href="#sobre-mi">
                                <i class="fa-solid fa-user"></i> CONOCERME
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="cyber-glass">
                            <span class="cyber-frame" aria-hidden="true"></span>
                            <p class="cyber-kicker">Stats del jugador</p>
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
                            <div class="cyber-stats-grid">
                                <div class="cyber-stat"><strong>04</strong><span>Unidades</span></div>
                                <div class="cyber-stat"><strong>15</strong><span>Semanas</span></div>
                                <div class="cyber-stat"><strong>MVC</strong><span>Arquitectura</span></div>
                                <div class="cyber-stat"><strong>JSP</strong><span>Interfaz</span></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="sobre-mi" class="section">
            <div class="container">
                <div class="cyber-about-grid">
                    <div class="about-photo-frame">
                        <img src="<%= ctx %>/assets/img/perfil.jpg" alt="Foto de perfil de Rogger Palma" class="about-photo">
                    </div>
                    <article class="cyber-glass">
                        <span class="cyber-frame" aria-hidden="true"></span>
                        <p class="cyber-kicker">Presentación</p>
                        <h2 class="cyber-heading h3">Sobre mí</h2>
                        <p class="cyber-copy">
                            Soy estudiante de Ingeniería de Sistemas. Este portafolio reúne el trabajo
                            académico del curso: análisis, diseño, implementación y evidencias de cada unidad.
                        </p>
                        <p class="cyber-copy">
                            El objetivo es mostrar no solo el resultado final, sino el recorrido:
                            planificación, código, documentación y mejora continua. Cada sección está
                            pensada para navegar de lo general a lo específico, de la unidad al archivo.
                        </p>
                        <ul class="cyber-about-list">
                            <li><i class="fa-solid fa-check"></i> Enfoque en Java, SQL y diseño web</li>
                            <li><i class="fa-solid fa-check"></i> Organización por unidades y semanas</li>
                            <li><i class="fa-solid fa-check"></i> Evidencias listas para revisión académica</li>
                        </ul>
                    </article>
                </div>
            </div>
        </section>

        <section id="proyectos" class="section pt-0">
            <div class="container">
                <div class="text-center mb-5">
                    <p class="cyber-kicker">Lab log</p>
                    <h2 class="cyber-heading">Proyectos destacados</h2>
                    <p class="cyber-copy mx-auto" style="max-width:42rem;">Evidencias de ingeniería aplicadas: red, servidores, modelado y bajo nivel.</p>
                </div>
                <div class="cyber-project-grid">
                    <article class="cyber-glass cyber-project cyber-lift">
                        <span class="cyber-frame" aria-hidden="true"></span>
                        <span class="cyber-icon"><i class="fa-solid fa-network-wired"></i></span>
                        <p class="cyber-kicker">NODE // NET</p>
                        <h3 class="cyber-heading h5">Infraestructura y Redes</h3>
                        <p class="cyber-copy mb-0">Ingeniería de red simulada en Cisco Packet Tracer: Laboratorio de 21 equipos con topologías físicas e integración de sensores IoT para monitoreo climático.</p>
                    </article>
                    <article class="cyber-glass cyber-project cyber-lift">
                        <span class="cyber-frame" aria-hidden="true"></span>
                        <span class="cyber-icon"><i class="fa-brands fa-linux"></i></span>
                        <p class="cyber-kicker">NODE // SRV</p>
                        <h3 class="cyber-heading h5">Administración de Servidores</h3>
                        <p class="cyber-copy mb-0">Despliegue de servidor local en Linux. Configuración de Samba para uso compartido de archivos y servidor de impresión CUPS entre sistemas Windows y Linux.</p>
                    </article>
                    <article class="cyber-glass cyber-project cyber-lift">
                        <span class="cyber-frame" aria-hidden="true"></span>
                        <span class="cyber-icon"><i class="fa-solid fa-diagram-project"></i></span>
                        <p class="cyber-kicker">NODE // UML</p>
                        <h3 class="cyber-heading h5">Ingeniería de Software</h3>
                        <p class="cyber-copy mb-0">Diseño arquitectónico y modelado UML (actividad, secuencia y componentes) en Enterprise Architect para un sistema de gestión de citas médicas.</p>
                    </article>
                    <article class="cyber-glass cyber-project cyber-lift">
                        <span class="cyber-frame" aria-hidden="true"></span>
                        <span class="cyber-icon"><i class="fa-solid fa-microchip"></i></span>
                        <p class="cyber-kicker">NODE // ASM</p>
                        <h3 class="cyber-heading h5">Desarrollo a Bajo Nivel</h3>
                        <p class="cyber-copy mb-0">Programación de interrupciones de microprocesador (INT 00H para división por cero) utilizando Assembly (TASM) en entorno DOS.</p>
                    </article>
                </div>
            </div>
        </section>

        <section id="habilidades" class="section section-alt">
            <div class="container">
                <div class="text-center mb-4">
                    <p class="cyber-kicker">Runtime</p>
                    <h2 class="cyber-heading">Tech Stack</h2>
                </div>
                <div class="cyber-stack" aria-label="Stack tecnológico">
                    <span class="cyber-stack-item"><i class="fa-brands fa-java"></i> Java</span>
                    <span class="cyber-stack-item"><i class="fa-solid fa-database"></i> PostgreSQL</span>
                    <span class="cyber-stack-item"><i class="fa-brands fa-linux"></i> Linux</span>
                    <span class="cyber-stack-item"><i class="fa-brands fa-docker"></i> Docker</span>
                    <span class="cyber-stack-item"><i class="fa-brands fa-html5"></i> HTML/CSS</span>
                </div>
            </div>
        </section>

        <section id="unidades-destacadas" class="section">
            <div class="container">
                <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-end gap-3 mb-5">
                    <div>
                        <p class="cyber-kicker">Recorrido académico</p>
                        <h2 class="cyber-heading mb-2">Unidades destacadas</h2>
                        <p class="cyber-copy mb-0">Cuatro bloques formativos. Cada unidad agrupa semanas, tareas y evidencias.</p>
                    </div>
                    <a class="cyber-btn is-ghost" href="<%= ctx %>/unidades">
                        VER TODAS <i class="fa-solid fa-arrow-right"></i>
                    </a>
                </div>
                <div class="cyber-unit-grid">
                    <article class="cyber-glass cyber-lift">
                        <span class="cyber-frame" aria-hidden="true"></span>
                        <span class="cyber-kicker">Unidad 01</span>
                        <h3 class="cyber-heading h5">Fundamentos</h3>
                        <p class="cyber-copy">Introducción al curso, entorno de trabajo y primeros entregables.</p>
                        <p class="cyber-kicker"><i class="fa-regular fa-calendar me-1"></i> 4 semanas</p>
                        <a class="cyber-btn" href="<%= ctx %>/unidad/detalle?id=1">VER UNIDAD</a>
                    </article>
                    <article class="cyber-glass cyber-lift">
                        <span class="cyber-frame" aria-hidden="true"></span>
                        <span class="cyber-kicker">Unidad 02</span>
                        <h3 class="cyber-heading h5">Análisis y diseño</h3>
                        <p class="cyber-copy">Requerimientos, modelado UML y arquitectura de la solución.</p>
                        <p class="cyber-kicker"><i class="fa-regular fa-calendar me-1"></i> 4 semanas</p>
                        <a class="cyber-btn" href="<%= ctx %>/unidad/detalle?id=2">VER UNIDAD</a>
                    </article>
                    <article class="cyber-glass cyber-lift">
                        <span class="cyber-frame" aria-hidden="true"></span>
                        <span class="cyber-kicker">Unidad 03</span>
                        <h3 class="cyber-heading h5">Implementación</h3>
                        <p class="cyber-copy">Desarrollo en Java, JSP y persistencia. Construcción del sistema.</p>
                        <p class="cyber-kicker"><i class="fa-regular fa-calendar me-1"></i> 4 semanas</p>
                        <a class="cyber-btn" href="<%= ctx %>/unidad/detalle?id=3">VER UNIDAD</a>
                    </article>
                    <article class="cyber-glass cyber-lift">
                        <span class="cyber-frame" aria-hidden="true"></span>
                        <span class="cyber-kicker">Unidad 04</span>
                        <h3 class="cyber-heading h5">Proyecto final</h3>
                        <p class="cyber-copy">Integración, pruebas, despliegue y presentación del portafolio.</p>
                        <p class="cyber-kicker"><i class="fa-regular fa-calendar me-1"></i> 4 semanas</p>
                        <a class="cyber-btn" href="<%= ctx %>/unidad/detalle?id=4">VER UNIDAD</a>
                    </article>
                </div>
            </div>
        </section>

        <section class="section pt-0">
            <div class="container">
                <div class="cyber-glass d-flex flex-column flex-lg-row align-items-lg-center justify-content-between gap-4">
                    <span class="cyber-frame" aria-hidden="true"></span>
                    <div>
                        <h2 class="cyber-heading mb-2">Explora el trabajo por unidades</h2>
                        <p class="cyber-copy mb-0">Semanas, tareas y archivos organizados para una revisión clara.</p>
                    </div>
                    <a class="cyber-btn" href="<%= ctx %>/unidades">
                        <i class="fa-solid fa-arrow-right"></i> IR A UNIDADES
                    </a>
                </div>
            </div>
        </section>

        <section id="contacto" class="contacto-section section">
            <div class="container">
                <div class="text-center mb-5">
                    <p class="cyber-kicker">Canal cifrado // ID-CARD</p>
                    <h2 class="cyber-heading">Contacto y Acreditación Digital</h2>
                    <p class="cyber-copy mx-auto" style="max-width:42rem;">Identidad académica verificada y canales oficiales de comunicación.</p>
                </div>
                <div class="contacto-grid">
                    <article class="contacto-id-card cyber-glass cyber-lift">
                        <span class="cyber-frame" aria-hidden="true"></span>
                        <p class="cyber-kicker id-card-org">UNIVERSIDAD PERUANA LOS ANDES / FACULTAD DE INGENIERÍA - EPISC</p>

                        <div class="id-card-profile">
                            <div class="id-card-photo-wrap">
                                <img src="<%= ctx %>/assets/img/perfil.jpg" alt="Perfil de Rogger Josue Palma Baldeón">
                                <span class="id-card-badge">ESTUDIANTE</span>
                            </div>
                            <div class="id-card-meta">
                                <h3 class="cyber-heading h4 id-card-name">Rogger Josue Palma Baldeón</h3>
                                <p class="id-card-career">Ingeniería de Sistemas y Computación</p>
                                <div class="id-card-pills">
                                    <span class="id-card-pill">m00482f@ms.upla.edu.pe</span>
                                    <span class="id-card-pill">m00482f</span>
                                </div>
                            </div>
                        </div>

                        <div class="id-log-block">
                            <p class="id-inner-text">
                                <i class="fa-solid fa-location-dot" aria-hidden="true"></i>
                                Campus Chorrillos: Av. Giráldez 230 / Av. Ferrocarril, Huancayo - Perú
                            </p>
                            <p class="id-inner-text">
                                <i class="fa-solid fa-building-columns" aria-hidden="true"></i>
                                Facultad de Ingeniería · EPISC
                            </p>
                        </div>

                        <div class="id-log-block">
                            <p class="id-secure-title">ACREDITACIÓN DIGITAL UNIVERSITARIA // EPISC UPLA</p>
                        </div>
                    </article>
                    <div class="contacto-canales">
                        <article class="contacto-channel cyber-glass cyber-lift">
                            <span class="cyber-frame" aria-hidden="true"></span>
                            <span class="cyber-icon"><i class="fa-solid fa-envelope"></i></span>
                            <p class="cyber-kicker">Buzón UPLA</p>
                            <h3 class="cyber-heading h5">Correo institucional</h3>
                            <p class="cyber-copy">Escríbeme a m00482f@ms.upla.edu.pe</p>
                            <a class="cyber-btn" href="mailto:m00482f@ms.upla.edu.pe">
                                <i class="fa-solid fa-paper-plane"></i> ENVIAR MENSAJE
                            </a>
                        </article>
                        <article class="contacto-channel cyber-glass cyber-lift">
                            <span class="cyber-frame" aria-hidden="true"></span>
                            <span class="cyber-icon"><i class="fa-brands fa-github"></i></span>
                            <p class="cyber-kicker">GitHub</p>
                            <h3 class="cyber-heading h5">Repositorio oficial</h3>
                            <p class="cyber-copy">Código, evidencias y despliegue del portafolio académico.</p>
                            <a class="cyber-btn is-ghost" href="https://github.com/lREDEYESl" target="_blank" rel="noopener noreferrer">
                                <i class="fa-brands fa-github"></i> VER GITHUB
                            </a>
                        </article>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <jsp:include page="/WEB-INF/views/includes/footer.jsp"/>
</body>
</html>
