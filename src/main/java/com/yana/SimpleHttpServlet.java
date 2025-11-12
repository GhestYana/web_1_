package com.yana;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/info")
public class SimpleHttpServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();

        HttpSession session = req.getSession(true);
        Integer counter = (Integer) session.getAttribute("counter");
        if (counter == null) counter = 0;
        session.setAttribute("counter", ++counter);

        out.println("<html><head><meta charset='UTF-8'><title>Request Info</title></head><body>");
        out.println("<h2>Інформація про запит</h2>");
        out.println("<ul>");
        out.println("<li>Context Path: " + req.getContextPath() + "</li>");
        out.println("<li>Servlet Path: " + req.getServletPath() + "</li>");
        out.println("<li>Path Info: " + req.getPathInfo() + "</li>");
        out.println("<li>Query String: " + req.getQueryString() + "</li>");
        out.println("<li>param1: " + req.getParameter("param1") + "</li>");
        out.println("<li>param2: " + req.getParameter("param2") + "</li>");
        out.println("<li>User-Agent: " + req.getHeader("User-Agent") + "</li>");
        out.println("<li>Session counter: " + counter + "</li>");
        out.println("</ul>");
        out.println("</body></html>");
    }
}
