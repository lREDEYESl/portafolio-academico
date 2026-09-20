<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="uri" value="${pageContext.request.requestURI}"/>
<nav class="navbar navbar-expand-lg navbar-dark navbar-app sticky-top cyber-nav">
    <div class="container">
        <a class="navbar-brand navbar-brand-app" href="${pageContext.request.contextPath}/">
            <span class="brand-mark" aria-hidden="true"><i class="fa-solid fa-gamepad"></i></span>
            <span class="brand-text">
                <span class="brand-title">Portafolio 8-BIT</span>
                <small class="brand-subtitle">INSERT COIN</small>
            </span>
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar"
                aria-controls="mainNavbar" aria-expanded="false" aria-label="Abrir menú">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="mainNavbar">
            <ul class="navbar-nav navbar-menu ms-auto">
                <li class="nav-item">
                    <a class="nav-link nav-link-app ${uri.endsWith('/') || uri.contains('/home') ? 'active' : ''}"
                       href="${pageContext.request.contextPath}/">
                        <i class="fa-solid fa-house me-1"></i> Inicio
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-app" href="${pageContext.request.contextPath}/#sobre-mi">
                        <i class="fa-solid fa-user me-1"></i> Sobre mí
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-app ${uri.contains('/unidad') ? 'active' : ''}"
                       href="${pageContext.request.contextPath}/unidades">
                        <i class="fa-solid fa-book me-1"></i> Unidades
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-app" href="${pageContext.request.contextPath}/#contacto">
                        <i class="fa-solid fa-envelope me-1"></i> CONTACTO
                    </a>
                </li>
                <c:choose>
                    <c:when test="${not empty usuario}">
                        <li class="nav-item ms-lg-2">
                            <a class="btn btn-primary-app" href="${pageContext.request.contextPath}/admin/dashboard">
                                <i class="fa-solid fa-gauge-high"></i> Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-outline-app" href="${pageContext.request.contextPath}/logout">
                                <i class="fa-solid fa-right-from-bracket"></i> Salir
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item ms-lg-2">
                            <a class="btn btn-primary-app btn-login" href="${pageContext.request.contextPath}/login">
                                <i class="fa-solid fa-right-to-bracket"></i> Login
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>
