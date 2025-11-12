<%@ page import="com.yana.Product" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>

<h2>Список продуктів</h2>
<ul class="list-group">
<%
    java.util.List<com.yana.Product> products = (java.util.List<com.yana.Product>) request.getAttribute("products");
    if (products != null) {
        for (com.yana.Product p : products) {
%>
    <li class="list-group-item"><%= p.getId() %>. <%= p.getTitle() %> — <%= p.getCost() %> грн</li>
<%
        }
    } else {
%>
    <li class="list-group-item">Немає продуктів</li>
<%
    }
%>
</ul>

<%@ include file="footer.jsp" %>




