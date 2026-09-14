<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
                <span class="hero-badge mb-3">
                    <i class="fa-solid fa-book-open"></i> Unidad 0<c:out value="${unidad.id}"/>
                </span>
                <h1 class="section-title"><c:out value="${unidad.titulo}"/></h1>
                <p class="section-subtitle mb-0"><c:out value="${unidad.descripcion}"/></p>
            </div>
        </section>

        <section class="section pt-0">
            <div class="container">
                <div class="row g-4 mb-5">
                    <div class="col-lg-8">
                        <article class="card-app h-100">
                            <p class="section-kicker">Descripción</p>
                            <h2 class="h4 mb-3">Qué se trabaja en esta unidad</h2>
                            <p class="text-muted-app mb-4"><c:out value="${unidad.descripcion}"/></p>
                            <p class="section-kicker">Video de apoyo</p>
                            <div class="ratio ratio-16x9 unit-video">
                                <c:choose>
                                    <c:when test="${unidad.id == 1}">
                                        <iframe src="https://www.youtube.com/embed/ElMnHDSFaCw"
                                                title="Fundamentos de arquitectura de software"
                                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                                allowfullscreen></iframe>
                                    </c:when>
                                    <c:when test="${unidad.id == 2}">
                                        <iframe src="https://www.youtube.com/embed/UI6lqHOVHic"
                                                title="Modelado UML y POO"
                                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                                allowfullscreen></iframe>
                                    </c:when>
                                    <c:when test="${unidad.id == 3}">
                                        <iframe src="https://www.youtube.com/embed/-MTSQjw5DrM"
                                                title="APIs y comunicación entre arquitecturas"
                                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                                allowfullscreen></iframe>
                                    </c:when>
                                    <c:otherwise>
                                        <iframe src="https://www.youtube.com/embed/rFVYgb7vnP0"
                                                title="Frameworks y estándares de implementación"
                                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                                allowfullscreen></iframe>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </article>
                    </div>
                    <div class="col-lg-4">
                        <article class="card-app h-100">
                            <p class="section-kicker">Plan</p>
                            <h2 class="h4 mb-3">Resultado esperado</h2>
                            <p class="text-muted-app mb-0">
                                Recorrer las semanas de <c:out value="${unidad.titulo}"/> y dejar evidencias de cada entregable.
                            </p>
                        </article>
                    </div>
                </div>

                <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-end gap-3 mb-4">
                    <div>
                        <p class="section-kicker">Planificación</p>
                        <h2 class="section-title mb-0">Semanas</h2>
                    </div>
                    <span class="unit-meta mb-0">
                        <i class="fa-regular fa-calendar me-1"></i>
                        ${semanas.size()} semanas
                    </span>
                </div>

                <div class="row g-4">
                    <c:forEach var="semana" items="${semanas}" varStatus="status">
                    <div class="col-12 col-md-6">
                        <article class="card-app week-card h-100">
                            <span class="unit-index">Semana 0${status.count}</span>
                            <h3 class="unit-title"><c:out value="${semana.titulo}"/></h3>
                            <p class="unit-text"><c:out value="${semana.contenido}"/></p>
                            <a class="btn btn-outline-app mt-auto" href="${pageContext.request.contextPath}/semana/detalle?id=${semana.id}">
                                Ver semana <i class="fa-solid fa-arrow-right"></i>
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
