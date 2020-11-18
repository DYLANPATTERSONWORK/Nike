package com.tedu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tedu.exception.UserException;
import com.tedu.model.User;
import com.tedu.service.ICartService;
import com.tedu.service.IUserService;
import com.tedu.service.impl.CartService;
import com.tedu.service.impl.UserService;

public class UserServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private static IUserService userService = new UserService();
	private static ICartService cartService = new CartService();
	
	//跳转到注册页面
	public String registerInput(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		return "register_n";
	}
	
	//用户注册
	public String register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		User user = new User(username, password, phone, email, 0);
		userService.add(user);
		return "redirect:user?method=loginInput";
	}
	
	//验证用户名
	public void rejUsername(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		String username = req.getParameter("username");
		int count = userService.loadByUsername(username);
		if(count > 0) {
			out.write("yes");
			return;
		}
	}
	//验证手机号
	public void rejPhone(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		String phone = req.getParameter("phone");
		int count = userService.loadByUsername(phone);
		if(count > 0) {
			out.write("yes");
			return;
		}
	}
	//验证邮箱
	public void rejEmail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		String email = req.getParameter("email");
		int count = userService.loadByUsername(email);
		if(count > 0) {
			out.write("yes");
			return;
		}
	}
	
	//跳转到登录页面
	public String loginInput(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		return "login_n";
	}
	
	//用户登录
	public String login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		User user = null;
		try {
			user = userService.login(username, password);
		} catch (UserException e) {
			req.setAttribute("message", e.getMessage());
			return "login_n";
		}
		HttpSession session = req.getSession();
		session.setAttribute("loginUser", user);
		//获取购物车中商品的种类数
		int cartSize = cartService.count(user.getId());
		session.setAttribute("cartSize", cartSize);
		return "redirect:index.html";
	}
	
	//跳转到修改页面
	public String updateInput(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//获取参数ID值
		int id = Integer.parseInt(req.getParameter("id"));
		//根据ID获取对象
		User user = userService.load(id);
		//存入请求对象中
		req.setAttribute("user", user);
		//请求转发
		//req.getRequestDispatcher("WEB-INF/jsp/user/update.jsp").forward(req, resp);
		return "user/update";
	}
	
	//修改用户
	public String update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		String password = req.getParameter("password");
		//获取准备修改的用户对象
		User user = userService.load(id);
		//修改用户的密码和昵称
		user.setPassword(password);
		//执行修改操作
		userService.update(user);
		return "redirect:user?method=list";
	}
	
	
	//退出登录
	public String logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		//让session失效
		session.invalidate();
		//目标重定向到登录页面
		return "redirect:user?method=loginInput";
	}
	
	//个人中心myShop
	public String myShop(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		return "user/my_shop";
	}
}
