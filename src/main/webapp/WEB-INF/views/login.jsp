<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
    request.setAttribute("pageTitle", "Login | Portafolio Académico");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/WEB-INF/views/includes/head.jsp"/>
</head>
<body class="arcade-boot">
    <jsp:include page="/WEB-INF/views/includes/navbar.jsp"/>

    <main>
        <section class="section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-7 col-lg-5">
                        <article class="crt-terminal">
                            <div class="crt-terminal-bar">
                                <span>SYS://AUTH</span>
                                <span class="crt-dots" aria-hidden="true"></span>
                            </div>
                            <p class="section-kicker">Player 1</p>
                            <p class="press-start blink">PRESS START</p>
                            <h1 class="section-title crt-title">Iniciar sesión</h1>
                            <div class="hud-bar" aria-hidden="true"><span></span></div>
                            <p class="section-subtitle mb-4">Ingresa con tu cuenta institucional para administrar el portafolio.</p>

                            <c:if test="${param.error == 'true'}">
                                <div class="alert alert-danger" role="alert">
                                    <span class="alert-hud">GAME OVER</span>
                                    Correo o contraseña incorrectos. Inténtalo de nuevo.
                                </div>
                            </c:if>
                            <c:if test="${param.error == 'pendiente'}">
                                <div class="alert alert-warning" role="alert">
                                    <span class="alert-hud">¡VIDAS RESTANTES!</span>
                                    Tu cuenta está pendiente de aprobación por el administrador.
                                </div>
                            </c:if>
                            <c:if test="${param.ok == 'registro'}">
                                <div class="alert alert-success" role="alert">
                                    <span class="alert-hud">MISSION COMPLETE</span>
                                    Solicitud enviada. Espera la aprobación del administrador.
                                </div>
                            </c:if>

                            <form method="post" action="${pageContext.request.contextPath}/login" class="js-visual-validate">
                                <div class="mb-3">
                                    <label class="form-label" for="email">Correo</label>
                                    <input class="form-control" type="email" id="email" name="email"
                                           required autocomplete="username" placeholder="admin@portafolio.edu">
                                </div>
                                <div class="mb-4">
                                    <label class="form-label" for="password">Contraseña</label>
                                    <input class="form-control" type="password" id="password" name="password"
                                           required autocomplete="current-password">
                                </div>
                                <button class="btn btn-primary-app btn-insert-coin w-100" type="submit" aria-label="Iniciar sesión">
                                    <i class="fa-solid fa-play" aria-hidden="true"></i> START
                                </button>
                            </form>
                            <p class="text-center mt-4 mb-0">
                                <a href="${pageContext.request.contextPath}/registro">Solicitar acceso al sistema</a>
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
