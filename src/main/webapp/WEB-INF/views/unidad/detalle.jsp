<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/WEB-INF/views/includes/head.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/unit-detail-cyber.css?v=20260919u">
</head>
<body>
    <jsp:include page="/WEB-INF/views/includes/navbar.jsp"/>

    <main class="unit-detail-stage">
        <section class="page-header unit-detail-hero">
            <div class="container">
                <jsp:include page="/WEB-INF/views/includes/breadcrumb.jsp"/>
                <span class="unit-detail-badge">
                    <i class="fa-solid fa-book-open"></i> Unidad 0<c:out value="${unidad.id}"/>
                </span>
                <h1 class="unit-detail-title"><c:out value="${unidad.titulo}"/></h1>
                <p class="unit-detail-lead"><c:out value="${unidad.descripcion}"/></p>
                <div class="unit-detail-tabs">
                    <jsp:include page="/WEB-INF/views/includes/week-rail.jsp"/>
                </div>
            </div>
        </section>

        <section class="section pt-0">
            <div class="container">
                <div class="unit-detail-panels">
                    <article class="unit-detail-panel">
                        <span class="unit-detail-frame" aria-hidden="true"></span>
                        <p class="unit-detail-kicker">Descripción</p>
                        <h2 class="unit-detail-panel-title">Qué se trabaja en esta unidad</h2>
                        <%@ include file="/WEB-INF/views/includes/unit-quest.jsp" %>
                        <p class="unit-detail-copy"><c:out value="${questUnitLore}"/></p>
                        <p class="unit-detail-copy"><c:out value="${unidad.descripcion}"/></p>
                        <p class="unit-detail-kicker">Video de apoyo</p>
                        <div class="ratio ratio-16x9 unit-video cyber-video">
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
                    <article class="unit-detail-panel is-plan">
                        <span class="unit-detail-frame" aria-hidden="true"></span>
                        <p class="unit-detail-kicker">Plan</p>
                        <h2 class="unit-detail-panel-title">Resultado esperado</h2>
                        <p class="unit-detail-copy mb-0">
                            Recorrer las semanas de <c:out value="${unidad.titulo}"/> y dejar evidencias de cada entregable.
                        </p>
                    </article>
                </div>

                <div class="unit-detail-weeks-head">
                    <div>
                        <p class="unit-detail-kicker">Planificación</p>
                        <h2 class="unit-detail-section-title">Semanas</h2>
                    </div>
                    <span class="unit-detail-meta">
                        <i class="fa-regular fa-calendar"></i>
                        ${semanas.size()} semanas
                    </span>
                </div>

                <div class="unit-detail-weeks">
                    <c:forEach var="semana" items="${semanas}" varStatus="status">
                    <%@ include file="/WEB-INF/views/includes/week-quest.jsp" %>
                    <article class="unit-detail-week week-node">
                        <span class="unit-detail-frame" aria-hidden="true"></span>
                        <header class="week-node-head">
                            <span class="week-node-id">NODE 0${status.count}</span>
                            <span class="unit-detail-week-index"><c:out value="${semana.titulo}"/></span>
                        </header>
                        <h3 class="unit-detail-week-title"><c:out value="${questWeekTitle}"/></h3>
                        <p class="unit-detail-copy week-node-body"><c:out value="${questWeekLore}"/></p>
                        <a class="unit-detail-btn" href="${pageContext.request.contextPath}/semana/detalle?id=${semana.id}">
                            ABRIR NODO <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </article>
                    </c:forEach>
                </div>
            </div>
        </section>
    </main>

    <jsp:include page="/WEB-INF/views/includes/footer.jsp"/>
</body>
</html>
