<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx = request.getContextPath();
    String[] labels = (String[]) request.getAttribute("breadcrumbLabels");
    String[] hrefs = (String[]) request.getAttribute("breadcrumbHrefs");
    if (labels == null || labels.length == 0) {
        labels = new String[]{"Inicio"};
        hrefs = new String[]{ctx + "/"};
    }
%>
<nav aria-label="Miga de pan" class="breadcrumb-wrap">
    <ol class="breadcrumb breadcrumb-app mb-0">
        <%
            for (int i = 0; i < labels.length; i++) {
                boolean last = (i == labels.length - 1);
                String href = (hrefs != null && i < hrefs.length) ? hrefs[i] : null;
        %>
        <li class="breadcrumb-item<%= last ? " active" : "" %>"<%= last ? " aria-current=\"page\"" : "" %>>
            <% if (!last && href != null && !href.trim().isEmpty()) { %>
            <a href="<%= href %>"><%= labels[i] %></a>
            <% } else { %>
            <%= labels[i] %>
            <% } %>
        </li>
        <% } %>
    </ol>
</nav>
