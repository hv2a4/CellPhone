package com.vn.controllers;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vn.DAO.categoryDao;
import com.vn.DAO.phoneDao;
import com.vn.DAO.storageDao;
import com.vn.DAO.systemDao;
import com.vn.entity.ProductStore;
import com.vn.entity.category;
import com.vn.entity.storage;
import com.vn.entity.system;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/shop")
public class UserController {
	@Autowired
	HttpServletRequest req;
	@Autowired
	categoryDao categoryDao;
	@Autowired
	systemDao systemDao;
	@Autowired
	storageDao storageDao;
	
	@GetMapping("changepass")
	public String getchangepass(Model model) {
		return "/views/changepassword";
	}
	@GetMapping("forgotpass1")
	public String getForgotpass(Model model) {
		return "/views/forgotpass1";
	}
	@GetMapping("forgotpass2")
	public String getForgotpass2(Model model) {
		return "/views/forgotpass2";
	}
	@GetMapping("forgotpass3")
	public String getForgotpass3(Model model) {
		return "/views/forgotpass3";
	}
	

	@RequestMapping("")
	public String getHome(Model model) {
		String page = "home.jsp";
		model.addAttribute("page", page);
		return "index";
	}
	@RequestMapping("store")
	public String getStore(Model model) {
		List<category> finByAllCategories = categoryDao.findAll();
		model.addAttribute("finByAllCategories", finByAllCategories);
		String page = "store.jsp";
		model.addAttribute("page", page);
		return "index";
	}
	@RequestMapping("profile")
	public String getProfile(Model model) {
		String page = "profile.jsp";
		model.addAttribute("page", page);
		return "index";
	}
	@RequestMapping("cart")
	public String getCart(Model model) {
		String page = "cart.jsp";
		model.addAttribute("page", page);
		return "index";
	}
	@RequestMapping("checkout")
	public String getCheckout(Model model) {
		String page = "checkout.jsp";
		model.addAttribute("page", page);
		return "index";
	}
	@RequestMapping("address")
	public String getAddress(Model model) {
		String page = "address.jsp";
		model.addAttribute("page", page);
		return "index";
	}
	@RequestMapping("invoice")
	public String getInvoice(Model model) {
		String page = "invoice.jsp";
		model.addAttribute("page", page);
		return "index";
	}
	@RequestMapping("order")
	public String getOrder(Model model) {
		String page = "order.jsp";
		model.addAttribute("page", page);
		return "index";
	}
	@RequestMapping("product")
	public String getProduct(Model model) {
		String page = "product.jsp";
		model.addAttribute("page", page);
		return "index";
	}


}
