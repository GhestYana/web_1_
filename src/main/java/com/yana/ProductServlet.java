package com.yana;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        ProductRepository repo = (ProductRepository) getServletContext().getAttribute("productRepo");

        req.setAttribute("products", repo.getAll());
        req.getRequestDispatcher("/webapp/products.jsp").forward(req, resp);    }
}
