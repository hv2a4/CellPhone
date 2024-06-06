package com.vn.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;

import com.vn.DAO.categoryDao;
import com.vn.DAO.phoneDao;
import com.vn.DAO.variantDao;
import com.vn.entity.category;
import com.vn.entity.phone;
import com.vn.entity.user;
import com.vn.entity.variant;

@Controller
@RequestMapping("shop")
public class UserController {
	@Autowired
	HttpServletRequest req;
	@Autowired
	phoneDao phonedao;
	@Autowired
	categoryDao categorydao;
	@Autowired
	variantDao variantdao;

	@ModelAttribute("list_category")
	public List<category> getList() {
		return categorydao.findAll();
	} 
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

	// Đỗ tất cả sản phẩm đưa lên store
//	@RequestMapping("store")
//	public String getStore(Model model) {
//		String page = "store.jsp";
//		model.addAttribute("page", page);
//		return "index";
//	}
	@RequestMapping("store")
	public String getStore(Model model) {
	    List<phone> phones = phonedao.findAll();
	    model.addAttribute("phones", phones);
	    model.addAttribute("page", "store.jsp");
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
	
	//
	@GetMapping("ajax/getGia/{id}")
	@ResponseBody
	public Optional<Double> getGia(Model model, @PathVariable("id") Integer id) {
		Optional<variant> varia = variantdao.findById(id);
		
		return Optional.of(varia.get().getPRICE());
	}

}
