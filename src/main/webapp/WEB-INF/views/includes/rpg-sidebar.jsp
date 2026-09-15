<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<nav class="stage-strip" aria-label="Menú rápido de unidades">
    <c:choose>
        <c:when test="${not empty unidades}">
            <c:forEach var="unitSlot" items="${unidades}">
                <a class="stage-dot stage-dot-${unitSlot.id} ${unidad.id == unitSlot.id ? 'is-active' : ''}"
                   href="${ctx}/unidad/detalle?id=${unitSlot.id}"
                   title="<c:out value='${unitSlot.titulo}'/>">
                    U<c:out value="${unitSlot.id}"/>
                </a>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <a class="stage-dot stage-dot-1 ${unidad.id == 1 ? 'is-active' : ''}" href="${ctx}/unidad/detalle?id=1" title="Unidad I">U1</a>
            <a class="stage-dot stage-dot-2 ${unidad.id == 2 ? 'is-active' : ''}" href="${ctx}/unidad/detalle?id=2" title="Unidad II">U2</a>
            <a class="stage-dot stage-dot-3 ${unidad.id == 3 ? 'is-active' : ''}" href="${ctx}/unidad/detalle?id=3" title="Unidad III">U3</a>
            <a class="stage-dot stage-dot-4 ${unidad.id == 4 ? 'is-active' : ''}" href="${ctx}/unidad/detalle?id=4" title="Unidad IV">U4</a>
        </c:otherwise>
    </c:choose>
</nav>
