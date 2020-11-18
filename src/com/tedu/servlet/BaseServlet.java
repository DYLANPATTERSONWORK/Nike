package com.tedu.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getParameter("method");
		//获取相应的方法
		try {
			Class<?> cla = this.getClass();//获取子类的运行时类对象
			//获取方法
			Method m = cla.getMethod(method, HttpServletRequest.class, HttpServletResponse.class);
			//调用方法
			String relpath = (String) m.invoke(this, req, resp);
			if(relpath != null) {
				//目标重定向
				if(relpath.startsWith("redirect:")) {
					resp.sendRedirect(relpath.substring("redirect:".length()));;
				}
				else {
					//请求转发
					req.getRequestDispatcher("WEB-INF/jsp/" + relpath + ".jsp").forward(req, resp);
				}
			}
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
