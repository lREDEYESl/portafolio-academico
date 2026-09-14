<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <div class="col-lg-6">
                <article class="card bg-dark border-secondary shadow-sm text-light">
                    <div class="card-body">
                        <p class="section-kicker">Usuarios</p>
                        <h1 class="section-title">Editar usuario</h1>

                        <form method="post" action="${pageContext.request.contextPath}/admin/usuarios?action=actualizar">
                            <input type="hidden" name="id" value="${usuarioEditar.id}">

                            <div class="mb-3">
                                <label class="form-label" for="nombre">Nombre</label>
                                <input class="form-control" type="text" id="nombre" name="nombre" required maxlength="120"
                                       value="<c:out value='${usuarioEditar.nombre}'/>">
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="email">Email</label>
                                <input class="form-control" type="email" id="email" name="email" required maxlength="180"
                                       value="<c:out value='${usuarioEditar.email}'/>">
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="rol">Rol</label>
                                <select class="form-select" id="rol" name="rol" required>
                                    <option value="ADMIN" ${usuarioEditar.rol == 'ADMIN' ? 'selected' : ''}>ADMIN</option>
                                    <option value="EDITOR" ${usuarioEditar.rol == 'EDITOR' ? 'selected' : ''}>EDITOR</option>
                                    <option value="USUARIO" ${usuarioEditar.rol == 'USUARIO' ? 'selected' : ''}>USUARIO</option>
                                </select>
                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="nuevaPassword">Nueva Contraseña</label>
                                <input class="form-control" type="password" id="nuevaPassword" name="nuevaPassword"
                                       autocomplete="new-password">
                                <div class="form-text">Dejar en blanco para mantener la actual.</div>
                            </div>
                            <div class="d-flex gap-2">
                                <button class="btn btn-info text-dark fw-semibold" type="submit">
                                    <i class="fa-solid fa-floppy-disk"></i> Guardar cambios
                                </button>
                                <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/admin/usuarios">Cancelar</a>
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
