<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String ctx = request.getContextPath();
%>
<footer class="footer-app cyber-footer">
    <div class="container">
        <div class="row g-4">
            <div class="col-lg-4">
                <h3 class="footer-title">Portafolio 8-BIT</h3>
                <p class="footer-text">
                    Espacio para presentar unidades, semanas, tareas y evidencias de aprendizaje
                    con una arquitectura MVC en Java.
                </p>
                <div class="mt-3 footer-social">
                    <a class="social-link" href="https://github.com/lREDEYESl" target="_blank" rel="noopener noreferrer" aria-label="GitHub"><i class="fa-brands fa-github"></i></a>
                    <a class="social-link" href="#" aria-label="LinkedIn"><i class="fa-brands fa-linkedin-in"></i></a>
                    <a class="social-link" href="#" aria-label="Correo"><i class="fa-solid fa-envelope"></i></a>
                </div>
            </div>

            <div class="col-6 col-lg-2">
                <h4 class="h6 footer-kicker mb-3">Navegación</h4>
                <ul class="footer-links">
                    <li><a href="<%= ctx %>/">Inicio</a></li>
                    <li><a href="<%= ctx %>/#sobre-mi">Sobre mí</a></li>
                    <li><a href="<%= ctx %>/unidades">Unidades</a></li>
                    <li><a href="<%= ctx %>/#contacto">Contacto</a></li>
                    <li><a href="<%= ctx %>/login">Login</a></li>
                </ul>
            </div>

            <div class="col-6 col-lg-3">
                <h4 class="h6 footer-kicker mb-3">Información académica</h4>
                <p class="footer-meta mb-1">Ingeniería de Sistemas</p>
                <p class="footer-meta mb-1">Java 21 · Tomcat 10.1</p>
                <p class="footer-meta mb-0">Maven · JSP · Bootstrap 5.3</p>
            </div>

            <div class="col-lg-3">
                <h4 class="h6 footer-kicker mb-3">Contacto</h4>
                <p class="footer-meta mb-1"><i class="fa-solid fa-location-dot me-2"></i>Perú</p>
                <p class="footer-meta mb-0"><i class="fa-solid fa-graduation-cap me-2"></i>Portafolio universitario</p>
            </div>
        </div>

        <div class="footer-bottom d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-2">
            <span>&copy; 2026 Portafolio Académico. INSERT COIN TO CONTINUE.</span>
            <button type="button" id="retroSfxToggle" aria-pressed="true" aria-label="Activar o silenciar efectos de sonido">SFX ON</button>
        </div>
    </div>
</footer>

<div id="npcGuide" class="npc-guide" data-ctx="<%= ctx %>">
    <div id="npcPanel" class="npc-panel" role="dialog" aria-labelledby="npcGuideTitle" aria-hidden="true" hidden>
        <div class="npc-panel-head">
            <span id="npcGuideTitle">NPC // GUIA-01</span>
            <span class="npc-panel-status">ONLINE</span>
        </div>
        <div id="npcSpeech" class="npc-speech" aria-live="polite"></div>
        <div id="npcMenuMain" class="npc-options">
            <button type="button" class="npc-opt" data-npc-action="unidades">Ver Unidades</button>
            <button type="button" class="npc-opt" data-npc-action="archivos">Administrar Archivos</button>
            <button type="button" class="npc-opt" data-npc-action="sobre">Sobre Rogger</button>
            <button type="button" class="npc-opt" data-npc-action="curioso">🎲 Dato Curioso</button>
            <button type="button" class="npc-opt" data-npc-action="escanear">⚡ Escanear Sistema</button>
            <button type="button" class="npc-opt" data-npc-action="contacto">✉️ Contacto</button>
            <button type="button" class="npc-opt is-close" data-npc-action="cerrar">Cerrar</button>
        </div>
        <div id="npcMenuBack" class="npc-options" hidden>
            <button type="button" class="npc-opt" data-npc-action="volver" style="grid-column: 1 / -1;">↩️ Volver</button>
        </div>
    </div>
    <button type="button" id="npcAvatar" class="npc-avatar" aria-expanded="false" aria-controls="npcPanel" aria-label="Abrir guía virtual">
        <span class="npc-avatar-face" aria-hidden="true">👾</span>
    </button>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://unpkg.com/aos@2.3.4/dist/aos.js"></script>
<script src="<%= ctx %>/assets/js/app.js"></script>
<script src="<%= ctx %>/assets/js/retro-effects.js"></script>
<script src="<%= ctx %>/assets/js/cyber-deck.js"></script>
<script src="<%= ctx %>/assets/js/npc-guide.js?v=20260919p"></script>
