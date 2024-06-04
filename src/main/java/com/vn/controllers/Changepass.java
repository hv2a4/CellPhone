package com.vn.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vn.entity.user;

@Controller
@RequestMapping("/shop")
public class Changepass {

	
	@GetMapping("changepass")
	public String getchangepass(Model model) {
		 user item=new user();
		
		return "/views/changepassword";
	}
}
