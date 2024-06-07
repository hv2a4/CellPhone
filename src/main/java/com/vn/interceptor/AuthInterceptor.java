package com.vn.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.vn.entity.user;
import com.vn.utils.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Service
public class AuthInterceptor implements HandlerInterceptor {
	@Autowired
	SessionService session;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getRequestURI();
		user user = session.get("list"); // lấy từ session
		String error = "";
		
		if (user == null) { // chưa đăng nhập
			error = "Please login!";
		}
		// không đúng vai trò
		else if (!user.getROLE() && uri.startsWith("/admin/")|| !user.getROLE() && uri.startsWith("/admin")) {
			error = "Access denied!";
		}
		if (error.length() > 0) { // có lỗi
			response.sendRedirect("/shop/404");
			return false;
		}
		return true;
	}
}
