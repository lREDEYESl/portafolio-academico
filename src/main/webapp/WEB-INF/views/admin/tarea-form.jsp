<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
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
        <div class="row justify-content-center">
            <div class="col-lg-7">
                <article class="card bg-dark border-secondary shadow-sm text-light">
                    <div class="card-body">
                        <p class="section-kicker">Tarea</p>
                        <h1 class="section-title">
                            <c:choose>
                                <c:when test="${empty tarea}">Crear Nueva Tarea</c:when>
                                <c:otherwise>Editar Tarea</c:otherwise>
                            </c:choose>
                        </h1>

                        <form method="post" action="${pageContext.request.contextPath}/admin/tareas" class="js-visual-validate">
                            <c:if test="${not empty tarea}">
                                <input type="hidden" name="id" value="${tarea.id}">
                                <input type="hidden" name="action" value="actualizar">
                            </c:if>
                            <c:if test="${empty tarea}">
                                <input type="hidden" name="action" value="insertar">
                            </c:if>

                            <div class="mb-3">
                                <label class="form-label" for="semana_id">Semana</label>
                                <select class="form-select" id="semana_id" name="semana_id" required>
                                    <c:forEach var="s" items="${semanas}">
                                        <option value="${s.id}"
                                                <c:if test="${tarea.semanaId == s.id}">selected</c:if>>
                                            ${s.titulo} (Unidad ${s.unidadId})
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="titulo">Título</label>
                                <input class="form-control" type="text" id="titulo" name="titulo" required maxlength="150"
                                       value="<c:out value='${tarea.titulo}'/>">
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="descripcion">Descripción</label>
                                <textarea class="form-control" id="descripcion" name="descripcion" rows="4" required><c:out value="${tarea.descripcion}"/></textarea>
                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="fecha_limite">Fecha Límite</label>
                                <input class="form-control" type="date" id="fecha_limite" name="fecha_limite" required
                                       value="${tarea.fechaLimite}">
                            </div>
                            <div class="d-flex gap-2">
                                <button class="btn btn-info text-dark fw-semibold" type="submit">
                                    <i class="fa-solid fa-floppy-disk"></i> Guardar
                                </button>
                                <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/admin/tareas">Cancelar</a>
                            </div>
                        </form>
                    </div>
                </article>
            </div>
        </div>
    </div>
</main>

<jsp:include page="../includes/footer.jsp"/>
</body>
</html>
