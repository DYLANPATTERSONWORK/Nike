package com.tedu.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter {
	private static String character;
	@Override
	public void init(FilterConfig config) throws ServletException {
		//获取初始化参数
		character = config.getInitParameter("character");
		if(character == null || character.equals("")) {
			character = "utf-8";
		}
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//设置请求编码
		request.setCharacterEncoding(character);
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {

	}

}
