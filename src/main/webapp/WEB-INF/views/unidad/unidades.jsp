<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
    request.setAttribute("pageTitle", "Unidades | Portafolio Académico");
    String ctx = request.getContextPath();
    request.setAttribute("breadcrumbLabels", new String[]{"Inicio", "Unidades"});
    request.setAttribute("breadcrumbHrefs", new String[]{ctx + "/", ""});
%>
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
                <p class="section-kicker">SELECT STAGE</p>
                <h1 class="section-title">Unidades académicas</h1>
                <p class="section-subtitle mb-0">
                    Cuatro bloques formativos. Cada unidad agrupa semanas, tareas y evidencias de aprendizaje.
                </p>
            </div>
        </section>

        <section class="section pt-0">
            <div class="container">
                <div class="row g-4">
                    <c:forEach var="unidad" items="${unidades}">
                    <c:choose>
                        <c:when test="${unidad.id == 1}">
                            <c:set var="unitIcon" value="fa-sitemap"/>
                            <c:set var="unitTone" value="unit-tone-1"/>
                            <c:set var="unitWeeks" value="4 semanas"/>
                        </c:when>
                        <c:when test="${unidad.id == 2}">
                            <c:set var="unitIcon" value="fa-diagram-project"/>
                            <c:set var="unitTone" value="unit-tone-2"/>
                            <c:set var="unitWeeks" value="4 semanas"/>
                        </c:when>
                        <c:when test="${unidad.id == 3}">
                            <c:set var="unitIcon" value="fa-network-wired"/>
                            <c:set var="unitTone" value="unit-tone-3"/>
                            <c:set var="unitWeeks" value="4 semanas"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="unitIcon" value="fa-cubes"/>
                            <c:set var="unitTone" value="unit-tone-4"/>
                            <c:set var="unitWeeks" value="3 semanas"/>
                        </c:otherwise>
                    </c:choose>
                    <div class="col-12 col-md-6">
                        <article class="card-app unit-card h-100 ${unitTone}">
                            <span class="unit-icon"><i class="fa-solid ${unitIcon}"></i></span>
                            <span class="unit-index">Unidad 0${unidad.id}</span>
                            <h2 class="unit-title"><c:out value="${unidad.titulo}"/></h2>
                            <p class="unit-text"><c:out value="${unidad.descripcion}"/></p>
                            <p class="unit-meta"><i class="fa-regular fa-calendar me-1"></i> ${unitWeeks}</p>
                            <a class="btn btn-primary-app mt-auto" href="${pageContext.request.contextPath}/unidad/detalle?id=${unidad.id}">
                                Ver detalle <i class="fa-solid fa-arrow-right"></i>
                            </a>
                        </article>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </section>
    </main>

    <jsp:include page="/WEB-INF/views/includes/footer.jsp"/>
</body>
</html>
