<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<c:set var="uri" value="${pageContext.request.requestURI}"/>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark border-bottom border-secondary sticky-top admin-navbar">
    <div class="container">
        <a class="navbar-brand navbar-brand-app" href="${pageContext.request.contextPath}/admin/dashboard">
            <span class="brand-mark"><i class="fa-solid fa-gamepad" aria-hidden="true"></i></span>
            <span class="brand-text">
                HQ ADMIN
                <small>ARCADE PORTFOLIO</small>
            </span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#adminNavbar"
                aria-controls="adminNavbar" aria-expanded="false" aria-label="Abrir menú">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="adminNavbar">
            <ul class="navbar-nav mx-lg-4 gap-lg-1">
                <li class="nav-item">
                    <a class="nav-link nav-link-app ${fn:contains(uri, '/admin/dashboard') ? 'active' : ''}"
                       href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-app ${fn:contains(uri, '/admin/tareas') ? 'active' : ''}"
                       href="${pageContext.request.contextPath}/admin/tareas">Tareas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-app ${fn:contains(uri, '/admin/archivos') ? 'active' : ''}"
                       href="${pageContext.request.contextPath}/admin/archivos">Archivos</a>
                </li>
                <c:if test="${usuario.rol == 'ADMIN'}">
                    <li class="nav-item">
                        <a class="nav-link nav-link-app ${fn:contains(uri, '/admin/usuarios') ? 'active' : ''}"
                           href="${pageContext.request.contextPath}/admin/usuarios">Usuarios</a>
                    </li>
                </c:if>
            </ul>
            <div class="ms-auto d-flex flex-column flex-lg-row align-items-lg-center gap-2 py-3 py-lg-0">
                <span class="badge rounded-pill text-bg-secondary px-3 py-2">
                    <i class="fa-solid fa-user-shield me-1"></i>
                    <c:out value="${usuario.rol}"/>
                </span>
                <a class="btn btn-outline-light btn-sm" href="${pageContext.request.contextPath}/">
                    <i class="fa-solid fa-globe me-1"></i> Volver al Sitio Público
                </a>
                <a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/logout">
                    <i class="fa-solid fa-right-from-bracket me-1"></i> Cerrar Sesión
                </a>
            </div>
        </div>
    </div>
</nav>
