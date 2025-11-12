<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.yana.Product" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Магазин продуктів</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>

<body class="container mt-5">
    <div class="bg-primary text-white p-3 mb-4">
        <h2>Магазин продуктів</h2>
    </div>

    <%
        String pageType = request.getParameter("page");

        // Головна
        if (pageType == null || pageType.equals("home")) {
    %>
            <h3>Вітаємо у магазині продуктів!</h3>
            <a href="index.jsp?page=products" class="btn btn-primary mt-3">Переглянути продукти</a>
            <a href="index.jsp?page=info&param1=test&param2=123" class="btn btn-secondary mt-3">Інформація про запит</a>
    <%
        }

        // Вивід продуктів
        else if (pageType.equals("products")) {
           com.yana.ProductRepository repo = (com.yana.ProductRepository) application.getAttribute("productRepo");

               List<Product> products = repo != null
                       ? repo.getAll()
                       : java.util.Collections.emptyList();
    %>
            <h3>Список продуктів</h3>
            <table class="table table-bordered mt-3">
                <thead>
                    <tr>
                        <th>ID</th><th>Назва</th><th>Ціна (грн)</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    for (Product p : products) {
                %>
                    <tr>
                        <td><%= p.getId() %></td>
                        <td><%= p.getTitle() %></td>
                        <td><%= p.getCost() %></td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            <a href="index.jsp?page=home" class="btn btn-outline-primary">Назад</a>
    <%
        }

        //  запит
        else if (pageType.equals("info")) {
            Integer counter = (Integer) session.getAttribute("counter");
            if (counter == null) counter = 0;
            session.setAttribute("counter", ++counter);
    %>
            <h3>Інформація про запит</h3>
            <ul>
                <li><b>Context Path:</b> <%= request.getContextPath() %></li>
                <li><b>Servlet Path:</b> <%= request.getServletPath() %></li>
                <li><b>Path Info:</b> <%= request.getPathInfo() %></li>
                <li><b>Query String:</b> <%= request.getQueryString() %></li>
                <li><b>param1:</b> <%= request.getParameter("param1") %></li>
                <li><b>param2:</b> <%= request.getParameter("param2") %></li>
                <li><b>User-Agent:</b> <%= request.getHeader("User-Agent") %></li>
                <li><b>Session counter:</b> <%= counter %></li>
            </ul>
            <a href="index.jsp?page=home" class="btn btn-outline-primary">Назад</a>
    <%
        }
    %>

    <div class="text-center text-muted mt-5">
        <p>© 2025 MyShop</p>
    </div>
</body>
</html>