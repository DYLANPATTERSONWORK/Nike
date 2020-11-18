package com.tedu.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tedu.model.Product;
import com.tedu.service.IProductService;
import com.tedu.service.impl.ProductService;

/**
 * Servlet implementation class IndexServlet
 */
public class IndexServlet extends HttpServlet {
	private static IProductService productService = new ProductService();
	private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	List<Product> products = productService.list();
    	req.setAttribute("products", products);
    	req.getRequestDispatcher("WEB-INF/jsp/index_n.jsp").forward(req, resp);
    }
}
