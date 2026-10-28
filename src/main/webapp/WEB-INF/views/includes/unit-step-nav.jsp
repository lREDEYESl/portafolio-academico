<nav class="week-step-nav unit-step-nav" aria-label="Unidad anterior y siguiente">
    <c:choose>
        <c:when test="${not empty unidadAnterior}">
            <a class="${stepBtnClass} ${stepGhostClass} week-step-btn"
               href="${pageContext.request.contextPath}/unidad/detalle?id=${unidadAnterior.id}">
                <i class="fa-solid fa-chevron-left" aria-hidden="true"></i>
                Unidad anterior
            </a>
        </c:when>
        <c:otherwise>
            <span class="${stepBtnClass} ${stepGhostClass} week-step-btn is-disabled" aria-disabled="true">
                <i class="fa-solid fa-chevron-left" aria-hidden="true"></i>
                Unidad anterior
            </span>
        </c:otherwise>
    </c:choose>
    <c:choose>
        <c:when test="${not empty unidadSiguiente}">
            <a class="${stepBtnClass} week-step-btn"
               href="${pageContext.request.contextPath}/unidad/detalle?id=${unidadSiguiente.id}">
                Unidad siguiente
                <i class="fa-solid fa-chevron-right" aria-hidden="true"></i>
            </a>
        </c:when>
        <c:otherwise>
            <span class="${stepBtnClass} week-step-btn is-disabled" aria-disabled="true">
                Unidad siguiente
                <i class="fa-solid fa-chevron-right" aria-hidden="true"></i>
            </span>
        </c:otherwise>
    </c:choose>
</nav>
