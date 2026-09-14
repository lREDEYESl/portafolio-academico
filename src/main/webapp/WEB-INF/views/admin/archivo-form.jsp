<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<article class="card bg-dark border-secondary shadow-sm text-light h-100">
    <div class="card-body">
        <p class="section-kicker">Nuevo</p>
        <h2 class="h4 mb-2">Registrar archivo</h2>
        <p class="text-secondary small mb-4">Sube un PDF, imagen o documento y asócialo a una tarea.</p>

        <form method="post" action="${pageContext.request.contextPath}/admin/archivos"
              enctype="multipart/form-data">
            <input type="hidden" name="action" value="insertar">

            <div class="mb-3">
                <label class="form-label" for="nombre">Nombre</label>
                <input class="form-control" type="text" id="nombre" name="nombre" required maxlength="255">
            </div>
            <div class="mb-3">
                <label class="form-label" for="archivo">Archivo</label>
                <label class="file-dropzone" for="archivo">
                    <input class="d-none" type="file" id="archivo" name="archivo"
                           accept=".pdf,.png,.jpg,.jpeg,.doc,.docx" required>
                    <div id="filePreview" class="file-dropzone-preview">
                        <i class="fa-solid fa-cloud-arrow-up fa-2x mb-2 text-info"></i>
                        <p class="mb-0">Arrastra o selecciona un archivo</p>
                        <small class="text-secondary">PDF, PNG, JPG, DOC · máx. 10 MB</small>
                    </div>
                </label>
            </div>
            <div class="mb-4">
                <label class="form-label" for="tarea_id">Tarea</label>
                <select class="form-select" id="tarea_id" name="tarea_id" required>
                    <option value="">Seleccione una tarea</option>
                    <c:forEach var="tarea" items="${tareas}">
                        <option value="${tarea.id}"><c:out value="${tarea.titulo}"/></option>
                    </c:forEach>
                </select>
            </div>
            <button class="btn btn-info text-dark fw-semibold" type="submit">
                <i class="fa-solid fa-plus me-1"></i> Guardar archivo
            </button>
        </form>
    </div>
</article>
<script>
    (function () {
        const input = document.getElementById("archivo");
        const preview = document.getElementById("filePreview");
        if (!input || !preview) return;
        input.addEventListener("change", function () {
            const file = input.files && input.files[0];
            if (!file) return;
            const nombre = file.name;
            if (file.type.startsWith("image/")) {
                const url = URL.createObjectURL(file);
                preview.innerHTML = '<img src="' + url + '" alt="Vista previa" class="file-dropzone-thumb rounded">' +
                    '<p class="mb-0 mt-2 small">' + nombre + '</p>';
                return;
            }
            if (file.type === "application/pdf" || nombre.toLowerCase().endsWith(".pdf")) {
                preview.innerHTML = '<i class="fa-solid fa-file-pdf fa-3x text-danger mb-2"></i>' +
                    '<p class="mb-0 small">' + nombre + '</p>';
                return;
            }
            preview.innerHTML = '<i class="fa-solid fa-file-lines fa-3x text-info mb-2"></i>' +
                '<p class="mb-0 small">' + nombre + '</p>';
        });
    })();
</script>
