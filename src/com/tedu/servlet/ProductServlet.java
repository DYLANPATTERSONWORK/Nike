package com.tedu.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tedu.model.Product;
import com.tedu.service.IProductService;
import com.tedu.service.impl.ProductService;

/**
 * Servlet implementation class ProductServlet
 */
public class ProductServlet extends BaseServlet {
	private static IProductService productService = new ProductService();
	private static final long serialVersionUID = 1L;
	//查看商品的详细信息
	public String item(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		Product product = productService.load(id);
		req.setAttribute("product", product);
		return "product_item_n";
	}
}
