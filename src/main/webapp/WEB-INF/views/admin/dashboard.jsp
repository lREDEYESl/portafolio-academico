<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es" data-bs-theme="dark">
<head>
    <jsp:include page="../includes/head.jsp"/>
</head>
<body data-bs-theme="dark">
<jsp:include page="includes/header.jsp"/>

<main>
    <div class="container mt-5 mb-5">
        <c:if test="${param.error == 'permisos'}">
            <div class="alert alert-danger" role="alert">
                <span class="alert-hud">ACCESS DENIED</span>
                No tienes permisos para gestionar usuarios. Solo un ADMIN puede acceder a esa sección.
            </div>
        </c:if>

        <article class="card bg-dark border-secondary shadow-sm text-light mb-4">
            <div class="card-body">
                <p class="section-kicker">PLAYER STATUS</p>
                <h1 class="section-title">Bienvenido, <c:out value="${usuario.nombre}"/></h1>
                <p class="section-subtitle mb-0">
                    Sesión activa como <strong><c:out value="${usuario.rol}"/></strong>.
                    Las tareas y archivos están disponibles para cualquier usuario autenticado.
                </p>
            </div>
        </article>

        <div class="row g-4">
            <div class="col-md-4">
                <a class="text-decoration-none" href="${pageContext.request.contextPath}/admin/tareas">
                    <article class="card bg-dark border-secondary shadow-sm text-light h-100">
                        <div class="card-body">
                            <p class="section-kicker">Módulo</p>
                            <h2 class="h4">Tareas</h2>
                            <p class="text-secondary mb-0">CRUD de entregables disponible para ADMIN y USUARIO.</p>
                        </div>
                    </article>
                </a>
            </div>
            <div class="col-md-4">
                <a class="text-decoration-none" href="${pageContext.request.contextPath}/admin/archivos">
                    <article class="card bg-dark border-secondary shadow-sm text-light h-100">
                        <div class="card-body">
                            <p class="section-kicker">Módulo</p>
                            <h2 class="h4">Archivos</h2>
                            <p class="text-secondary mb-0">Evidencias y gestión de archivos para cualquier sesión autenticada.</p>
                        </div>
                    </article>
                </a>
            </div>
            <c:if test="${usuario.rol == 'ADMIN'}">
            <div class="col-md-4">
                <a class="text-decoration-none" href="${pageContext.request.contextPath}/admin/usuarios">
                    <article class="card bg-dark border-secondary shadow-sm text-light h-100">
                        <div class="card-body">
                            <p class="section-kicker">Módulo</p>
                            <h2 class="h4">Usuarios / Solicitudes</h2>
                            <p class="text-secondary mb-0">Aprobación de cuentas. Visible solo para ADMIN.</p>
                        </div>
                    </article>
                </a>
            </div>
            </c:if>
        </div>
    </div>
</main>

<jsp:include page="../includes/footer.jsp"/>
</body>
</html>
