package com.tedu.filter;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tedu.model.User;

public class AdminCheckFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//把ServletRequest强制转换成HttpServletRequest
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		//获取session
		HttpSession session = req.getSession();
		//从session中获取登录用户
		User user = (User) session.getAttribute("loginUser");
		//用户没有登录
		if(user == null) {
			resp.sendRedirect("login.html");
			return;
		}
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {

	}

}
