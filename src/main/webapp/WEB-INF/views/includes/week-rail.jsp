<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<nav class="week-rail" aria-label="Semanas de la unidad">
    <c:choose>
        <c:when test="${not empty semanas}">
            <c:forEach var="semItem" items="${semanas}">
                <a class="week-pill ${semana.id == semItem.id ? 'is-active' : ''}"
                   href="${ctx}/semana/detalle?id=${semItem.id}">
                    <c:out value="${semItem.titulo}"/>
                </a>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <a class="week-pill" href="${ctx}/unidad/detalle?id=${unidad.id}">
                Semanas de <c:out value="${unidad.titulo}"/>
            </a>
            <c:if test="${not empty semana}">
                <span class="week-pill is-active"><c:out value="${semana.titulo}"/></span>
            </c:if>
        </c:otherwise>
    </c:choose>
</nav>
