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
        <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-end gap-3 mb-4">
            <div>
                <p class="section-kicker">CRUD</p>
                <h1 class="section-title mb-0">Tareas</h1>
            </div>
            <a class="btn btn-info text-dark fw-semibold" href="${pageContext.request.contextPath}/admin/tareas?action=crear">
                <i class="fa-solid fa-plus"></i> Crear Nueva Tarea
            </a>
        </div>

        <div class="card bg-dark border-secondary shadow-sm text-light">
            <div class="table-responsive">
                <table class="table table-dark table-hover align-middle mb-0">
                    <thead>
                    <tr>
                        <th>Título</th>
                        <th>Descripción</th>
                        <th>Fecha límite</th>
                        <th class="text-end">Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${empty tareas}">
                            <tr>
                                <td colspan="4" class="text-secondary">No hay tareas registradas.</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="tarea" items="${tareas}">
                                <tr>
                                    <td><c:out value="${tarea.titulo}"/></td>
                                    <td><c:out value="${tarea.descripcion}"/></td>
                                    <td><span class="badge rounded-pill text-bg-info text-dark"><c:out value="${tarea.fechaLimite}"/></span></td>
                                    <td class="text-end">
                                        <a class="btn btn-sm btn-outline-info rounded-pill"
                                           href="${pageContext.request.contextPath}/admin/tareas?action=editar&id=${tarea.id}">
                                            <i class="fa-solid fa-pen"></i> Editar
                                        </a>
                                        <form method="post" action="${pageContext.request.contextPath}/admin/tareas" class="d-inline"
                                              onsubmit="return confirm('¿Eliminar esta tarea?');">
                                            <input type="hidden" name="action" value="eliminar">
                                            <input type="hidden" name="id" value="${tarea.id}">
                                            <button class="btn btn-sm btn-outline-danger rounded-pill" type="submit">
                                                <i class="fa-solid fa-trash"></i> Eliminar
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>

<jsp:include page="../includes/footer.jsp"/>
</body>
</html>
