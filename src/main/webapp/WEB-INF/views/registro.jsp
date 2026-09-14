<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
    request.setAttribute("pageTitle", "Solicitar acceso | Portafolio Académico");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/WEB-INF/views/includes/head.jsp"/>
</head>
<body>
    <jsp:include page="/WEB-INF/views/includes/navbar.jsp"/>

    <main>
        <section class="section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-5">
                        <article class="card-app">
                            <p class="section-kicker">New player</p>
                            <p class="press-start blink">INSERT COIN</p>
                            <h1 class="section-title">Solicitar acceso</h1>
                            <div class="hud-bar" aria-hidden="true"><span></span></div>
                            <p class="section-subtitle mb-4">
                                Tu cuenta quedará como USUARIO en estado PENDIENTE hasta que un administrador la apruebe.
                            </p>

                            <c:if test="${param.error == 'existe'}">
                                <div class="alert alert-danger" role="alert">
                                    <span class="alert-hud">GAME OVER</span>
                                    Ese correo ya está registrado.
                                </div>
                            </c:if>
                            <c:if test="${param.error == 'datos'}">
                                <div class="alert alert-danger" role="alert">
                                    <span class="alert-hud">GAME OVER</span>
                                    Completa todos los campos correctamente.
                                </div>
                            </c:if>

                            <form method="post" action="${pageContext.request.contextPath}/registro" class="js-visual-validate">
                                <div class="mb-3">
                                    <label class="form-label" for="nombre">Nombre</label>
                                    <input class="form-control" type="text" id="nombre" name="nombre" required maxlength="120">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label" for="email">Email</label>
                                    <input class="form-control" type="email" id="email" name="email" required maxlength="180">
                                </div>
                                <div class="mb-4">
                                    <label class="form-label" for="password">Password</label>
                                    <input class="form-control" type="password" id="password" name="password" required minlength="6">
                                </div>
                                <button class="btn btn-primary-app w-100" type="submit">
                                    <i class="fa-solid fa-paper-plane"></i> Enviar solicitud
                                </button>
                            </form>
                            <p class="text-center mt-4 mb-0">
                                ¿Ya tienes cuenta?
                                <a href="${pageContext.request.contextPath}/login">Iniciar sesión</a>
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
