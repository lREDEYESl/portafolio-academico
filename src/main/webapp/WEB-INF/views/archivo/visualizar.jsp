<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String ctx = request.getContextPath();
    int unidad = 1;
    int semana = 1;
    int archivo = 1;
    try { unidad = Integer.parseInt(request.getParameter("unidad")); } catch (Exception ignored) { unidad = 1; }
    try { semana = Integer.parseInt(request.getParameter("semana")); } catch (Exception ignored) { semana = 1; }
    try { archivo = Integer.parseInt(request.getParameter("archivo")); } catch (Exception ignored) { archivo = 1; }
    if (unidad < 1 || unidad > 4) unidad = 1;
    if (semana < 1 || semana > 4) semana = 1;
    if (archivo < 1 || archivo > 3) archivo = 1;

    String[] nombres = {
            "Guia-semana-" + semana + ".pdf",
            "Apuntes-unidad-" + unidad + ".docx",
            "Captura-evidencia-" + semana + ".png"
    };
    String[] tipos = {"PDF", "Documento", "Imagen"};
    String[] pesos = {"1.2 MB", "840 KB", "640 KB"};
    String[] iconos = {"fa-file-pdf text-danger", "fa-file-word", "fa-file-image"};

    request.setAttribute("pageTitle", "Archivo | Portafolio Académico");
    request.setAttribute("breadcrumbLabels", new String[]{
            "Inicio", "Unidades", "Unidad " + unidad, "Semana " + semana, "Archivo"
    });
    request.setAttribute("breadcrumbHrefs", new String[]{
            ctx + "/",
            ctx + "/unidades",
            ctx + "/unidad/detalle?id=" + unidad,
            ctx + "/semana/detalle?unidad=" + unidad + "&semana=" + semana,
            ""
    });
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/WEB-INF/views/includes/head.jsp"/>
</head>
<body>
    <jsp:include page="/WEB-INF/views/includes/navbar.jsp"/>

    <main>
        <section class="page-header">
            <div class="container">
                <jsp:include page="/WEB-INF/views/includes/breadcrumb.jsp"/>
            </div>
        </section>

        <section class="section pt-0">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6" data-aos="zoom-in">
                        <article class="card-app text-center file-viewer">
                            <span class="file-viewer-icon">
                                <i class="fa-solid <%= iconos[archivo - 1] %>"></i>
                            </span>
                            <h1 class="h3 mt-3 mb-2"><%= nombres[archivo - 1] %></h1>
                            <p class="text-muted-app mb-4">
                                <%= tipos[archivo - 1] %> · <%= pesos[archivo - 1] %>
                            </p>
                            <div class="file-viewer-preview mb-4">
                                <i class="fa-solid fa-eye me-2"></i>
                                Vista previa no disponible en esta fase estática
                            </div>
                            <div class="d-flex flex-wrap justify-content-center gap-3">
                                <a class="btn btn-primary-app js-download" href="#">
                                    <i class="fa-solid fa-download"></i> Descargar
                                </a>
                                <a class="btn btn-outline-app"
                                   href="<%= ctx %>/semana/detalle?unidad=<%= unidad %>&semana=<%= semana %>">
                                    <i class="fa-solid fa-arrow-left"></i> Volver
                                </a>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <jsp:include page="/WEB-INF/views/includes/footer.jsp"/>
</body>
</html>
