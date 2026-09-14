<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="es" data-bs-theme="dark">
<head>
    <jsp:include page="../includes/head.jsp"/>
</head>
<body data-bs-theme="dark">
<jsp:include page="includes/header.jsp"/>

<main>
    <div class="container mt-5 mb-5">
        <div class="row g-4">
            <div class="col-lg-4">
                <jsp:include page="archivo-form.jsp"/>
            </div>
            <div class="col-lg-8">
                <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-end gap-3 mb-4">
                    <div>
                        <p class="section-kicker">CRUD</p>
                        <h1 class="section-title mb-0">Archivos</h1>
                    </div>
                </div>
                <div class="card bg-dark border-secondary shadow-sm text-light">
                    <div class="table-responsive">
                        <table class="table table-dark table-hover align-middle mb-0">
                            <thead>
                            <tr>
                                <th>Vista previa</th>
                                <th>ID</th>
                                <th>Tarea</th>
                                <th>Nombre</th>
                                <th>Ruta</th>
                                <th class="text-end">Acciones</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                                <c:when test="${empty archivos}">
                                    <tr>
                                        <td colspan="6" class="text-secondary">No hay archivos registrados.</td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="archivo" items="${archivos}">
                                        <c:set var="ruta" value="${fn:toLowerCase(archivo.url)}"/>
                                        <tr>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${fn:endsWith(ruta, '.png') or fn:endsWith(ruta, '.jpg') or fn:endsWith(ruta, '.jpeg')}">
                                                        <img src="${archivo.url}"
                                                             alt="<c:out value='${archivo.nombre}'/>"
                                                             width="50" height="50"
                                                             class="rounded"
                                                             style="object-fit: cover;">
                                                    </c:when>
                                                    <c:when test="${fn:endsWith(ruta, '.pdf')}">
                                                        <i class="fa-solid fa-file-pdf fa-2x text-danger"></i>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <i class="fa-solid fa-file-lines fa-2x text-info"></i>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td><c:out value="${archivo.id}"/></td>
                                            <td><c:out value="${archivo.tareaTitulo}"/></td>
                                            <td><c:out value="${archivo.nombre}"/></td>
                                            <td>
                                                <a class="link-info"
                                                   href="${archivo.url}"
                                                   target="_blank" rel="noopener noreferrer">
                                                    <c:out value="${archivo.url}"/>
                                                </a>
                                            </td>
                                            <td class="text-end">
                                                <a class="btn btn-sm btn-outline-info rounded-pill"
                                                   href="${archivo.url}"
                                                   target="_blank">
                                                    <i class="fa-solid fa-eye"></i> Vista previa
                                                </a>
                                                <form method="post" action="${pageContext.request.contextPath}/admin/archivos"
                                                      class="d-inline"
                                                      onsubmit="return confirm('¿Eliminar este archivo?');">
                                                    <input type="hidden" name="action" value="eliminar">
                                                    <input type="hidden" name="id" value="${archivo.id}">
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
        </div>
    </div>
</main>

<jsp:include page="../includes/footer.jsp"/>
</body>
</html>
