package com.vn;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.vn.interceptor.AuthInterceptor;
import com.vn.interceptor.GlobalInterceptor;



@Configuration
public class InterConfig implements WebMvcConfigurer{
	@Autowired
	GlobalInterceptor global;

	@Autowired
	AuthInterceptor auth;

     public void addInterceptors(InterceptorRegistry registry) {
		//GlobalInterceptor
		registry.addInterceptor(global)
			.addPathPatterns("/**")
			.excludePathPatterns("/assets/**");
		
		
		//AuthInterceptor
		registry.addInterceptor(auth)
			.addPathPatterns("/account/**", "/admin", "/admin/**")
			.excludePathPatterns("/shop/**");
	}

}
