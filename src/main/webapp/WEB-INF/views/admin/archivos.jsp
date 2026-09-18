<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="es" data-bs-theme="dark">
<head>
    <jsp:include page="../includes/head.jsp"/>
    <style>
        .archivo-inventory {
            display: flex;
            flex-direction: column;
            gap: 1.25rem;
        }
        .neon-title {
            font-family: "Press Start 2P", "VT323", monospace;
            font-size: clamp(0.55rem, 1.6vw, 0.72rem);
            color: #2de2e6;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            margin: 0.35rem 0 0.15rem;
            text-shadow: 0 0 10px rgba(45, 226, 230, 0.45);
        }
        .archivo-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
        }
        .archivo-card {
            display: flex;
            flex-direction: column;
            min-width: 0;
            background: rgba(12, 14, 34, 0.92);
            border: 2px solid rgba(45, 226, 230, 0.4);
            box-shadow: 0 0 14px rgba(45, 226, 230, 0.14);
        }
        .archivo-card-head {
            display: flex;
            gap: 0.75rem;
            padding: 0.85rem 0.85rem 0.65rem;
            align-items: flex-start;
        }
        .archivo-thumb,
        .archivo-thumb-fallback {
            width: 3.4rem;
            height: 3.4rem;
            flex: 0 0 3.4rem;
            border-radius: 0.4rem;
            border: 1px solid rgba(45, 226, 230, 0.45);
        }
        .archivo-thumb {
            object-fit: cover;
            display: block;
        }
        .archivo-thumb-fallback {
            display: grid;
            place-items: center;
            background: rgba(21, 21, 47, 0.9);
            font-family: "Press Start 2P", "VT323", monospace;
            font-size: 0.38rem;
            color: #2de2e6;
            letter-spacing: 0.04em;
        }
        .archivo-copy {
            min-width: 0;
            flex: 1;
        }
        .archivo-nombre {
            display: block;
            font-family: "IBM Plex Sans", "Segoe UI", sans-serif;
            font-size: 1rem;
            font-weight: 600;
            color: #2de2e6;
            line-height: 1.3;
            word-break: break-word;
        }
        .archivo-badges {
            display: flex;
            flex-wrap: wrap;
            gap: 0.3rem;
            margin-top: 0.4rem;
        }
        .archivo-badge {
            display: inline-flex;
            align-items: center;
            max-width: 100%;
            padding: 0.12rem 0.42rem;
            font-family: "IBM Plex Sans", "Segoe UI", sans-serif;
            font-size: 0.72rem;
            line-height: 1.3;
            color: #c9cbe8;
            background: rgba(255, 46, 196, 0.1);
            border: 1px solid rgba(255, 46, 196, 0.4);
        }
        .archivo-badge.is-unidad {
            color: #2de2e6;
            background: rgba(45, 226, 230, 0.08);
            border-color: rgba(45, 226, 230, 0.45);
        }
        .archivo-badge.is-semana {
            color: #ffd23f;
            background: rgba(255, 210, 63, 0.08);
            border-color: rgba(255, 210, 63, 0.4);
        }
        .archivo-acciones {
            display: flex;
            flex-wrap: wrap;
            gap: 5px;
            padding: 0.55rem 0.75rem 0.75rem;
            border-top: 1px solid rgba(45, 226, 230, 0.2);
        }
        .archivo-acciones form {
            display: inline-flex;
            margin: 0;
        }
        .archivo-btn {
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
            padding: 6px 10px;
            font-family: "Press Start 2P", "VT323", monospace;
            font-size: 0.42rem;
            letter-spacing: 0.06em;
            line-height: 1.2;
            color: #e6ffff;
            text-decoration: none;
            background: transparent;
            border: 2px solid #0ff;
            box-shadow: 0 0 5px #0ff, inset 0 0 8px rgba(0, 255, 255, 0.18);
            cursor: pointer;
            white-space: nowrap;
            width: auto;
            transition: box-shadow 0.2s ease, background 0.2s ease, transform 0.15s ease;
        }
        .archivo-btn .retro-icon {
            color: #fff;
            font-size: 0.78rem;
            line-height: 1;
            text-shadow: 0 0 5px #0ff, 0 0 10px #0ff, 0 0 20px #0ff;
        }
        .archivo-btn.is-preview,
        .archivo-btn.is-edit {
            color: #e6ffff;
            border-color: #0ff;
            box-shadow: 0 0 5px #0ff, inset 0 0 8px rgba(0, 255, 255, 0.18);
        }
        .archivo-btn.is-delete {
            color: #ffe6ee;
            border-color: #ff0055;
            box-shadow: 0 0 5px #f00, inset 0 0 8px rgba(255, 0, 85, 0.2);
        }
        .archivo-btn.is-delete .retro-icon {
            text-shadow: 0 0 5px #ff0055, 0 0 10px #ff0055, 0 0 20px #ff0055;
        }
        .archivo-btn:hover {
            transform: translateY(-1px);
            background: rgba(0, 255, 255, 0.12);
            color: #fff;
        }
        .archivo-btn.is-preview:hover,
        .archivo-btn.is-edit:hover {
            box-shadow: 0 0 8px #0ff, 0 0 16px rgba(0, 255, 255, 0.55), inset 0 0 12px rgba(0, 255, 255, 0.28);
        }
        .archivo-btn.is-preview:hover .retro-icon,
        .archivo-btn.is-edit:hover .retro-icon {
            text-shadow: 0 0 8px #0ff, 0 0 16px #0ff, 0 0 32px #0ff, 0 0 48px #0ff;
        }
        .archivo-btn.is-delete:hover {
            background: rgba(255, 0, 85, 0.14);
            color: #fff;
            box-shadow: 0 0 8px #f00, 0 0 16px rgba(255, 0, 85, 0.55), inset 0 0 12px rgba(255, 0, 85, 0.28);
        }
        .archivo-btn.is-delete:hover .retro-icon {
            text-shadow: 0 0 8px #ff0055, 0 0 16px #ff0055, 0 0 32px #ff0055, 0 0 48px #ff0055;
        }
        .archivo-empty {
            padding: 1.2rem;
            color: #9c9fce;
            border: 1px dashed rgba(45, 226, 230, 0.35);
        }
        @media (max-width: 575.98px) {
            .archivo-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
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
                <div id="archivoInventory" class="archivo-inventory">
                    <c:choose>
                        <c:when test="${empty archivos}">
                            <p class="archivo-empty mb-0">No hay archivos registrados.</p>
                        </c:when>
                        <c:otherwise>
                            <div class="archivo-grid" id="archivoGrid">
                                <c:forEach var="archivo" items="${archivos}">
                                    <c:set var="ruta" value="${fn:toLowerCase(archivo.url)}"/>
                                    <c:set var="ctxTarea" value="${null}"/>
                                    <c:forEach var="tareaItem" items="${tareas}">
                                        <c:if test="${archivo.entidadTipo == 'TAREA' && archivo.entidadId == tareaItem.id}">
                                            <c:set var="ctxTarea" value="${tareaItem}"/>
                                        </c:if>
                                    </c:forEach>
                                    <c:set var="unidadLabel" value="Sin unidad"/>
                                    <c:if test="${not empty ctxTarea}">
                                        <c:choose>
                                            <c:when test="${ctxTarea.semanaId >= 1 && ctxTarea.semanaId <= 4}">
                                                <c:set var="unidadLabel" value="Unidad I · Fundamentos"/>
                                            </c:when>
                                            <c:when test="${ctxTarea.semanaId >= 5 && ctxTarea.semanaId <= 8}">
                                                <c:set var="unidadLabel" value="Unidad II · Modelado POO"/>
                                            </c:when>
                                            <c:when test="${ctxTarea.semanaId >= 9 && ctxTarea.semanaId <= 12}">
                                                <c:set var="unidadLabel" value="Unidad III · Comunicación"/>
                                            </c:when>
                                            <c:otherwise>
                                                <c:set var="unidadLabel" value="Unidad IV · Frameworks"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                    <div class="archivo-card"
                                         data-id="<c:out value='${archivo.id}'/>"
                                         data-unidad="<c:out value='${unidadLabel}'/>"
                                         data-semana="<c:out value='${ctxTarea.semanaId}'/>"
                                         data-tarea="<c:out value='${ctxTarea.id}'/>"
                                         data-nombre="<c:out value='${archivo.nombre}'/>">
                                        <div class="archivo-card-head">
                                            <c:choose>
                                                <c:when test="${fn:endsWith(ruta, '.png') or fn:endsWith(ruta, '.jpg') or fn:endsWith(ruta, '.jpeg')}">
                                                    <img src="${archivo.url}"
                                                         alt="<c:out value='${archivo.nombre}'/>"
                                                         class="archivo-thumb">
                                                </c:when>
                                                <c:when test="${fn:endsWith(ruta, '.pdf')}">
                                                    <span class="archivo-thumb-fallback" aria-hidden="true">[PDF]</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="archivo-thumb-fallback" aria-hidden="true">[FILE]</span>
                                                </c:otherwise>
                                            </c:choose>
                                            <div class="archivo-copy">
                                                <span class="archivo-nombre"><c:out value="${archivo.nombre}"/></span>
                                                <div class="archivo-badges">
                                                    <span class="archivo-badge is-unidad">
                                                        <c:out value="${unidadLabel}"/>
                                                    </span>
                                                    <c:if test="${not empty ctxTarea}">
                                                        <span class="archivo-badge is-semana">
                                                            Semana <c:out value="${ctxTarea.semanaId}"/>
                                                        </span>
                                                        <span class="archivo-badge">
                                                            <c:out value="${ctxTarea.titulo}"/>
                                                        </span>
                                                    </c:if>
                                                    <c:if test="${empty ctxTarea && not empty archivo.tareaTitulo}">
                                                        <span class="archivo-badge">
                                                            <c:out value="${archivo.tareaTitulo}"/>
                                                        </span>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="archivo-acciones">
                                            <a class="archivo-btn is-preview"
                                               href="${archivo.url}"
                                               target="_blank" rel="noopener noreferrer">
                                                <i class="fa-solid fa-eye retro-icon" aria-hidden="true"></i> VER
                                            </a>
                                            <button type="button" class="archivo-btn is-edit js-archivo-modificar">
                                                <i class="fa-solid fa-pen retro-icon" aria-hidden="true"></i> EDITAR
                                            </button>
                                            <form method="post" action="${pageContext.request.contextPath}/admin/archivos"
                                                  onsubmit="return confirm('¿Eliminar este archivo?');">
                                                <input type="hidden" name="action" value="eliminar">
                                                <input type="hidden" name="id" value="${archivo.id}">
                                                <button class="archivo-btn is-delete" type="submit">
                                                    <i class="fa-solid fa-trash retro-icon" aria-hidden="true"></i> ELIMINAR
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</main>

<jsp:include page="../includes/footer.jsp"/>
<script>
    (function () {
        const inventory = document.getElementById("archivoInventory");
        const grid = document.getElementById("archivoGrid");
        if (!inventory || !grid) {
            return;
        }

        const cards = Array.from(grid.querySelectorAll(".archivo-card"));
        const groups = new Map();
        cards.forEach(function (card) {
            const semana = (card.getAttribute("data-semana") || "").trim() || "0";
            if (!groups.has(semana)) {
                groups.set(semana, []);
            }
            groups.get(semana).push(card);
        });

        const keys = Array.from(groups.keys()).sort(function (a, b) {
            return Number(a) - Number(b);
        });

        inventory.innerHTML = "";
        keys.forEach(function (semana) {
            const title = document.createElement("h2");
            title.className = "neon-title";
            title.textContent = "SEMANA " + semana;
            inventory.appendChild(title);

            const weekGrid = document.createElement("div");
            weekGrid.className = "archivo-grid";
            groups.get(semana).forEach(function (card) {
                weekGrid.appendChild(card);
            });
            inventory.appendChild(weekGrid);
        });

        inventory.addEventListener("click", function (event) {
            const button = event.target.closest(".js-archivo-modificar");
            if (!button) {
                return;
            }
            const card = button.closest(".archivo-card");
            if (!card || typeof window.entrarEdicionArchivo !== "function") {
                return;
            }
            window.entrarEdicionArchivo({
                id: card.getAttribute("data-id") || "",
                nombre: card.getAttribute("data-nombre") || "",
                tarea: card.getAttribute("data-tarea") || ""
            });
        });
    }());
</script>
</body>
</html>
