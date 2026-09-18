<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<article class="card bg-dark border-secondary shadow-sm text-light h-100">
    <div class="card-body">
        <p class="section-kicker" id="archivoFormKicker">Nuevo</p>
        <h2 class="h4 mb-2" id="archivoFormTitulo">Registrar archivo</h2>
        <p class="text-secondary small mb-4">Sube un PDF, imagen o documento y asócialo a una tarea.</p>

        <form id="archivoForm" method="post" action="${pageContext.request.contextPath}/admin/archivos"
              enctype="multipart/form-data">
            <input type="hidden" name="action" value="guardar">
            <input type="hidden" name="idArchivo" id="idArchivo" value="">

            <div class="mb-3">
                <label class="form-label" for="nombre">Nombre</label>
                <input class="form-control" type="text" id="nombre" name="nombre" required maxlength="255">
            </div>
            <div class="mb-3">
                <label class="form-label" for="archivo">Archivo</label>
                <p id="archivoActualWrap" class="archivo-actual" hidden>
                    Archivo actual: <span id="archivoActualNombre"></span>
                </p>
                <label class="file-dropzone" for="archivo">
                    <input class="d-none" type="file" id="archivo" name="archivo"
                           accept=".pdf,.png,.jpg,.jpeg,.doc,.docx">
                    <div id="filePreview" class="file-dropzone-preview">
                        <p class="mb-1 archivo-upload-mark">[ UPLOAD DATA ]</p>
                        <p class="mb-0">Selecciona un archivo</p>
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
            <div class="d-flex flex-wrap gap-2">
                <button class="btn-neon btn-guardar" type="submit">
                    <i class="fa-solid fa-floppy-disk retro-icon" aria-hidden="true"></i> GUARDAR
                </button>
                <button type="button" class="btn-neon btn-cancelar is-hidden" id="btnCancelarArchivo">
                    <i class="fa-solid fa-xmark retro-icon" aria-hidden="true"></i> CANCELAR
                </button>
            </div>
        </form>
    </div>
</article>
<style>
    .archivo-upload-mark {
        font-family: "Press Start 2P", "VT323", monospace;
        font-size: 0.52rem;
        color: #2de2e6;
        letter-spacing: 0.08em;
    }
    .archivo-actual {
        font-family: "IBM Plex Sans", "Segoe UI", sans-serif;
        font-size: 0.85rem;
        color: #ffd23f;
        margin-bottom: 0.45rem;
    }
    .btn-neon {
        display: inline-flex;
        align-items: center;
        gap: 0.45rem;
        font-family: "Press Start 2P", "VT323", monospace;
        font-size: 0.42rem;
        letter-spacing: 0.06em;
        padding: 0.55rem 0.75rem;
        color: #eafff6;
        background: transparent;
        border: 2px solid #00ffaa;
        box-shadow: 0 0 5px #00ffaa, inset 0 0 8px rgba(0, 255, 170, 0.18);
        cursor: pointer;
        transition: box-shadow 0.2s ease, background 0.2s ease, transform 0.15s ease;
    }
    .btn-neon .retro-icon {
        color: #fff;
        font-size: 0.8rem;
        line-height: 1;
    }
    .btn-guardar .retro-icon {
        text-shadow: 0 0 5px #00ffaa, 0 0 10px #00ffaa, 0 0 20px #00ffaa;
    }
    .btn-guardar:hover {
        transform: translateY(-1px);
        color: #fff;
        background: rgba(0, 255, 170, 0.12);
        box-shadow: 0 0 8px #00ffaa, 0 0 16px rgba(0, 255, 170, 0.55), inset 0 0 12px rgba(0, 255, 170, 0.28);
    }
    .btn-guardar:hover .retro-icon {
        text-shadow: 0 0 8px #00ffaa, 0 0 16px #00ffaa, 0 0 32px #00ffaa, 0 0 48px #00ffaa;
    }
    .btn-cancelar {
        color: #ffe6ee;
        border-color: #ff0055;
        box-shadow: 0 0 5px #f00, inset 0 0 8px rgba(255, 0, 85, 0.2);
    }
    .btn-cancelar .retro-icon {
        text-shadow: 0 0 5px #ff0055, 0 0 10px #ff0055, 0 0 20px #ff0055;
    }
    .btn-cancelar:hover {
        transform: translateY(-1px);
        color: #fff;
        background: rgba(255, 0, 85, 0.14);
        box-shadow: 0 0 8px #f00, 0 0 16px rgba(255, 0, 85, 0.55), inset 0 0 12px rgba(255, 0, 85, 0.28);
    }
    .btn-cancelar:hover .retro-icon {
        text-shadow: 0 0 8px #ff0055, 0 0 16px #ff0055, 0 0 32px #ff0055, 0 0 48px #ff0055;
    }
    .btn-cancelar.is-hidden {
        display: none;
    }
</style>
<script>
    (function () {
        const form = document.getElementById("archivoForm");
        const input = document.getElementById("archivo");
        const preview = document.getElementById("filePreview");
        const idArchivo = document.getElementById("idArchivo");
        const actualWrap = document.getElementById("archivoActualWrap");
        const actualNombre = document.getElementById("archivoActualNombre");
        const cancelar = document.getElementById("btnCancelarArchivo");
        const kicker = document.getElementById("archivoFormKicker");
        const titulo = document.getElementById("archivoFormTitulo");
        const previewDefault = preview ? preview.innerHTML : "";

        function formularioTieneDatos() {
            if (idArchivo && idArchivo.value.trim() !== "") {
                return true;
            }
            if (input && input.files && input.files.length > 0) {
                return true;
            }
            if (!form) {
                return false;
            }
            const campos = form.querySelectorAll("input[type='text'], input[type='search'], textarea, select");
            for (let i = 0; i < campos.length; i++) {
                if ((campos[i].value || "").trim() !== "") {
                    return true;
                }
            }
            return false;
        }

        function actualizarVisibilidadCancelar() {
            if (!cancelar) {
                return;
            }
            cancelar.classList.toggle("is-hidden", !formularioTieneDatos());
        }

        function modoNuevo() {
            if (idArchivo) idArchivo.value = "";
            if (input) input.required = true;
            if (actualWrap) actualWrap.hidden = true;
            if (actualNombre) actualNombre.textContent = "";
            if (kicker) kicker.textContent = "Nuevo";
            if (titulo) titulo.textContent = "Registrar archivo";
            if (preview && previewDefault) preview.innerHTML = previewDefault;
            actualizarVisibilidadCancelar();
        }

        window.resetArchivoForm = function () {
            if (form) form.reset();
            modoNuevo();
        };

        window.entrarEdicionArchivo = function (datos) {
            if (!datos) return;
            const nombre = document.getElementById("nombre");
            const tarea = document.getElementById("tarea_id");
            if (idArchivo) idArchivo.value = datos.id || "";
            if (nombre) nombre.value = datos.nombre || "";
            if (tarea) tarea.value = datos.tarea || "";
            if (input) {
                input.value = "";
                input.required = false;
            }
            if (actualNombre) actualNombre.textContent = datos.nombre || "";
            if (actualWrap) actualWrap.hidden = false;
            if (kicker) kicker.textContent = "Editar";
            if (titulo) titulo.textContent = "Modificar archivo";
            actualizarVisibilidadCancelar();
            if (nombre) {
                nombre.scrollIntoView({ behavior: "smooth", block: "center" });
                nombre.focus();
            }
        };

        if (input) input.required = true;
        actualizarVisibilidadCancelar();

        if (form) {
            form.addEventListener("input", actualizarVisibilidadCancelar);
            form.addEventListener("change", actualizarVisibilidadCancelar);
        }

        if (cancelar) {
            cancelar.addEventListener("click", function () {
                window.resetArchivoForm();
                actualizarVisibilidadCancelar();
            });
        }

        if (!input || !preview) return;
        input.addEventListener("change", function () {
            const file = input.files && input.files[0];
            actualizarVisibilidadCancelar();
            if (!file) {
                if (previewDefault) preview.innerHTML = previewDefault;
                return;
            }
            const nombre = file.name;
            if (file.type.startsWith("image/")) {
                const url = URL.createObjectURL(file);
                preview.innerHTML = '<img src="' + url + '" alt="Vista previa" class="file-dropzone-thumb rounded">' +
                    '<p class="mb-0 mt-2 small">' + nombre + '</p>';
                return;
            }
            if (file.type === "application/pdf" || nombre.toLowerCase().endsWith(".pdf")) {
                preview.innerHTML = '<p class="mb-1 archivo-upload-mark">PDF</p>' +
                    '<p class="mb-0 small">' + nombre + '</p>';
                return;
            }
            preview.innerHTML = '<p class="mb-1 archivo-upload-mark">DATA</p>' +
                '<p class="mb-0 small">' + nombre + '</p>';
        });
    })();
</script>
