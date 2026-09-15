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
        <article class="card bg-dark border-secondary shadow-sm text-light mb-4">
            <div class="card-body">
                <p class="section-kicker">Admin</p>
                <h1 class="section-title">Usuarios y solicitudes</h1>
                <p class="section-subtitle mb-0">Aprueba o rechaza cuentas. Solo visible para el rol ADMIN.</p>
            </div>
        </article>

        <div class="card bg-dark border-secondary shadow-sm text-light">
            <div class="table-responsive">
                <table class="table table-dark table-hover align-middle mb-0">
                    <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Email</th>
                        <th>Rol</th>
                        <th>Estado</th>
                        <th class="text-end">Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${usuarios}">
                        <tr>
                            <td><c:out value="${item.nombre}"/></td>
                            <td><c:out value="${item.email}"/></td>
                            <td><span class="badge rounded-pill text-bg-secondary"><c:out value="${item.rol}"/></span></td>
                            <td>
                                <c:choose>
                                    <c:when test="${item.estado == 'APROBADO'}">
                                        <span class="badge rounded-pill text-bg-success">APROBADO</span>
                                    </c:when>
                                    <c:when test="${item.estado == 'RECHAZADO'}">
                                        <span class="badge rounded-pill text-bg-danger">RECHAZADO</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge rounded-pill text-bg-warning text-dark">PENDIENTE</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="text-end">
                                <a class="btn btn-sm btn-outline-info rounded-pill"
                                   href="${pageContext.request.contextPath}/admin/usuarios?action=editar&id=${item.id}">
                                    <i class="fa-solid fa-pen"></i> Editar
                                </a>
                                <form method="post" action="${pageContext.request.contextPath}/admin/usuarios" class="d-inline">
                                    <input type="hidden" name="usuario_id" value="${item.id}">
                                    <input type="hidden" name="nuevo_estado" value="APROBADO">
                                    <button class="btn btn-sm btn-outline-success rounded-pill" type="submit">
                                        <i class="fa-solid fa-check"></i> Aprobar
                                    </button>
                                </form>
                                <form method="post" action="${pageContext.request.contextPath}/admin/usuarios" class="d-inline">
                                    <input type="hidden" name="usuario_id" value="${item.id}">
                                    <input type="hidden" name="nuevo_estado" value="RECHAZADO">
                                    <button class="btn btn-sm btn-outline-danger rounded-pill" type="submit">
                                        <i class="fa-solid fa-xmark"></i> Rechazar
                                    </button>
                                </form>
                                <form method="post" action="${pageContext.request.contextPath}/admin/usuarios" class="d-inline"
                                      onsubmit="return confirm('¿Eliminar este usuario?');">
                                    <input type="hidden" name="action" value="eliminar">
                                    <input type="hidden" name="id" value="${item.id}">
                                    <button class="btn btn-sm btn-outline-danger rounded-pill" type="submit">
                                        <i class="fa-solid fa-trash"></i> Eliminar
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>

<jsp:include page="../includes/footer.jsp"/>
</body>
</html>
