package com.tedu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tedu.model.Address;
import com.tedu.model.Cart;
import com.tedu.model.Product;
import com.tedu.model.User;
import com.tedu.service.IAddressService;
import com.tedu.service.ICartService;
import com.tedu.service.impl.AddressService;
import com.tedu.service.impl.CartService;

/**
 * Servlet implementation class CartServlet
 */
public class CartServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private static ICartService cartService = new CartService();
	private static IAddressService addressService = new AddressService();
	//加入商品到购物车
	public void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//获取登录用户
		HttpSession session = req.getSession();
		User user  = (User) session.getAttribute("loginUser");
		//判断用户是否登录
		if(user == null) {
			return;
		}
		else {
			//获取商品ID
			int pid = Integer.parseInt(req.getParameter("id"));
			//创建商品
			Product product = new Product();
			product.setId(pid);
			//获取商品购买数量
			int quantity = Integer.parseInt(req.getParameter("quantity"));
			//创建购物车
			Cart cart = new Cart();
			cart.setProduct(product);
			cart.setQuantity(quantity);
			cart.setUser(user);
			//保存购物车
			cartService.add(cart);
			//获取登录用户购物车中的商品种类数
			int cartSize = cartService.count(user.getId());
			session.setAttribute("cartSize", cartSize);
			resp.setContentType("text/html");
			PrintWriter out = resp.getWriter();
			out.write("yes");
		}
	}
	//用户查看购物车
	public String myCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("loginUser");
		if(user == null) {
			return "redirect:user?method=loginInput";
		}
		else {
			List<Cart> carts = cartService.listByUser(user.getId());
			req.setAttribute("carts", carts);
			return "user/my_cart";
		}
	}
	
	//修改购物车中商品数量
	public void updateQuantity(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int cid = Integer.parseInt(req.getParameter("cid"));
		String option = req.getParameter("option");
		Cart cart = cartService.load(cid);
		if(option.equals("plus")) {
			cart.setQuantity(cart.getQuantity() + 1);
		}
		else if(option.equals("minus")) {
			cart.setQuantity(cart.getQuantity() - 1);
		}
		cartService.updateQuantity(cart);
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		out.write("yes");
	}
	
	//删除一条购物车记录
	public String deleteOne(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int cid = Integer.parseInt(req.getParameter("cid"));
		cartService.delete(cid);
		return "redirect:cart?method=myCart";
	}
	//批量删除购物车记录
	public String deleteMore(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cartids[] = req.getParameterValues("cartids");
		for(String cartid:cartids) {
			int cid = Integer.parseInt(cartid);
			cartService.delete(cid);
		}
		return "redirect:cart?method=myCart";
	}
	
	//购物车结算
	public String settlement(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cartids[] = req.getParameterValues("cartids");
		List<Cart> carts = new ArrayList<>();
		for(String cartid:cartids) {
			int cid = Integer.parseInt(cartid);
			Cart cart = cartService.load(cid);
			carts.add(cart);
		}
		req.setAttribute("carts", carts);
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("loginUser");
		List<Address> addresses = addressService.list(user.getId());
		req.setAttribute("addresses", addresses);
		return "user/buy_now";
	}
}
