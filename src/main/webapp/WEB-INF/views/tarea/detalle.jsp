<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx = request.getContextPath();
    int unidad = 1;
    int semana = 1;
    int tarea = 1;
    try { unidad = Integer.parseInt(request.getParameter("unidad")); } catch (Exception ignored) { unidad = 1; }
    try { semana = Integer.parseInt(request.getParameter("semana")); } catch (Exception ignored) { semana = 1; }
    try { tarea = Integer.parseInt(request.getParameter("id")); } catch (Exception ignored) { tarea = 1; }
    if (unidad < 1 || unidad > 4) unidad = 1;
    if (semana < 1 || semana > 4) semana = 1;
    if (tarea < 1 || tarea > 3) tarea = 1;

    String[] titulos = {
            "Lectura guiada",
            "Ejercicio práctico",
            "Evidencia de la semana"
    };
    String[] descripciones = {
            "Revisar el material teórico de la semana, identificar conceptos clave y registrar apuntes para la siguiente actividad.",
            "Aplicar el contenido en un entregable corto del portafolio: estructura, capturas y explicación breve del procedimiento.",
            "Adjuntar capturas, código o PDF como respaldo. La evidencia debe mostrar el resultado y el proceso de la semana."
    };
    String[] estados = {"Completada", "En curso", "Pendiente"};
    String[] fechas = {"Semana " + semana + " · Día 2", "Semana " + semana + " · Día 4", "Cierre de semana " + semana};

    request.setAttribute("pageTitle", "Tarea | Portafolio Académico");
    request.setAttribute("breadcrumbLabels", new String[]{
            "Inicio", "Unidades", "Unidad " + unidad, "Semana " + semana, "Tarea"
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
                <span class="hero-badge mb-3" data-aos="fade-up">
                    <i class="fa-solid fa-list-check"></i>
                    T<%= unidad %>.<%= semana %>.<%= tarea %>
                </span>
                <h1 class="section-title" data-aos="fade-up"><%= titulos[tarea - 1] %></h1>
                <p class="section-subtitle mb-0" data-aos="fade-up">
                    Entregable de la unidad <%= unidad %>, semana <%= semana %>.
                </p>
            </div>
        </section>

        <section class="section pt-0">
            <div class="container">
                <div class="row g-4">
                    <div class="col-lg-8" data-aos="fade-up">
                        <article class="card-app h-100">
                            <p class="section-kicker">Descripción</p>
                            <h2 class="h4 mb-3"><%= titulos[tarea - 1] %></h2>
                            <p class="text-muted-app mb-4"><%= descripciones[tarea - 1] %></p>
                            <ul class="about-list">
                                <li><i class="fa-solid fa-check"></i> Entrega en el portafolio académico</li>
                                <li><i class="fa-solid fa-check"></i> Evidencias en PDF, imagen o documento</li>
                                <li><i class="fa-solid fa-check"></i> Relacionada con la semana <%= semana %></li>
                            </ul>
                        </article>
                    </div>
                    <div class="col-lg-4" data-aos="fade-up" data-aos-delay="80">
                        <article class="card-app mb-4">
                            <p class="section-kicker">Fecha</p>
                            <p class="mb-2"><i class="fa-regular fa-calendar me-2"></i><%= fechas[tarea - 1] %></p>
                            <p class="unit-meta mb-0">
                                Estado:
                                <% if (tarea == 1) { %><span class="badge-status badge-done"><%= estados[0] %></span>
                                <% } else if (tarea == 2) { %><span class="badge-status badge-progress"><%= estados[1] %></span>
                                <% } else { %><span class="badge-status badge-pending"><%= estados[2] %></span><% } %>
                            </p>
                        </article>
                        <a class="btn btn-primary-app w-100 js-download"
                           href="<%= ctx %>/archivo/visualizar?unidad=<%= unidad %>&semana=<%= semana %>&archivo=1">
                            <i class="fa-solid fa-download"></i> Descargar evidencias
                        </a>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <jsp:include page="/WEB-INF/views/includes/footer.jsp"/>
</body>
</html>
