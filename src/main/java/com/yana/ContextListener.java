package com.yana;

import com.yana.Product;
import com.yana.ProductRepository;

import javax.servlet.*;
import javax.servlet.annotation.WebListener;

@WebListener
public class ContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ProductRepository repo = new ProductRepository();

        // Створюємо 10 продуктів
        for (int i = 1; i <= 10; i++) {
            repo.addProduct(new Product(i, "Продукт №" + i, i * 100.0));
        }

        // Зберігаємо репозиторій у контексті
        ServletContext ctx = sce.getServletContext();
        ctx.setAttribute("productRepo", repo);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // нічого
    }
}
