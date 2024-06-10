package com.vn.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.antlr.v4.runtime.misc.Utils;
import org.eclipse.tags.shaded.org.apache.xpath.compiler.Keywords;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.Param;
import org.springframework.data.util.Pair;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.vn.DAO.*;
import com.vn.entity.*;
import com.vn.serviceimpl.MailerServiceImpl;
import com.vn.utils.*;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("shop")
public class UserController {
	@Autowired
	HttpServletRequest req;

	@Autowired
	MailerServiceImpl mailer;

	@Autowired
	SessionService sessionService;

	@Autowired
	userDao userDao;
	@Autowired
	status_orderDao status_orderDao;

	@Autowired
	systemDao systemDao;
	@Autowired
	categoryDao categoryDao;
	@Autowired
	cartDao cartdao;

	@Autowired
	cart_itemDao cart_itemdao;
	@Autowired
	variantDao variantDao;

	@Autowired
	brandDao brandDao;
	@Autowired
	orderDao orderDao;
	@Autowired
	order_itemDao order_itemDao;
	@Autowired
	payment_methodDao payment_methodDao;
	@Autowired
	addressDao addressDao;
	@Autowired
	discount_codeDao discount_codeDao;

	@GetMapping("forgotpass1")
	public String getForgotpass(Model model) {
		return "/views/forgotpass1";
	}

	@PostMapping("forgotpass2")
	public String postForgotpass2(Model model, @RequestParam("emailUser") String email) {
		List<user> listUser = userDao.findByEMAILLike(email);
		if (listUser == null || listUser.isEmpty()) {
			model.addAttribute("emailNotFound", "Email này chưa được đăng ký!");
			return "/views/forgotpass1";
		}
		String otp = mailer.gererateOtp(email); // Corrected the method name
		System.out.println(otp);
		sessionService.set("listUserSession", listUser);
		mailer.send(email, "Mã OTP xác nhận mật khẩu", "Mã OTP của bạn là: " + otp);
		sessionService.set("email", email);
		model.addAttribute("email", email);
		return "/views/forgotpass2";
	}

	@PostMapping("forgotpass3")
	public String postForgotpass3(Model model, @RequestParam(name = "emailUser") String email,
			@RequestParam(name = "otpEmail") String otp) {
		System.out.println(email);
		System.out.println(otp);
		Boolean statusEmailOtp = mailer.validateOtp(email, otp);
		System.out.println(statusEmailOtp);

		if (!statusEmailOtp) {
			model.addAttribute("error", "Mã OTP không hợp lệ");
			model.addAttribute("email", email);
			return "/views/forgotpass2";
		}

		return "redirect:/shop/changePassword?emailUser=" + email + "&otpEmail=" + otp;
	}

	@GetMapping("changePassword")
	public String getChangePasswordPage(Model model, @RequestParam(name = "emailUser") String email,
			@RequestParam(name = "otpEmail") String otp) {
		model.addAttribute("email", email);
		model.addAttribute("otp", otp);
		return "/views/forgotpass3";
	}

	@PostMapping("changePassword")
	public String postChangePassword(Model model, @RequestParam(name = "emailUser") String email,
			@RequestParam(name = "otpEmail") String otp, @RequestParam(name = "password") String password,
			@RequestParam(name = "config_password") String configPassword) {
		if (!password.equals(configPassword)) {
			model.addAttribute("error", "Mật khẩu và mật khẩu xác nhận không khớp");
			model.addAttribute("email", email);
			model.addAttribute("otp", otp);
			return "/views/forgotpass3";
		}

		List<user> listUser = sessionService.get("listUserSession");

		if (listUser == null || listUser.isEmpty()) {
			model.addAttribute("error", "Không tìm thấy người dùng. Vui lòng thử lại");
			return "/views/forgotpass1";
		}

		user userToUpdate = listUser.get(0);
		userToUpdate.setPASSWORD(password);
		userDao.save(userToUpdate);

		sessionService.remove("listUserSession");
		sessionService.remove("email");

		return "redirect:/shop/login";
	}

//	private void loadCart(Model model) {
//	    user currentUser = (user) sessionService.get("currentUser");
//	    if (currentUser != null) {
//	        cart userCart = (cart) cartdao.findByUser(currentUser);
//	        if (userCart != null) {
//	            List<cart_item> cartItems = cart_itemdao.findByCart(userCart);
//	            model.addAttribute("cartItems", cartItems);
//
//	            int totalItems = 0;
//	            double totalPrice = 0.0;
//	            for (cart_item cartItem : cartItems) {
//	                totalItems += cartItem.getQUANTITY();
//	                totalPrice += cartItem.getQUANTITY() * cartItem.getVariant().getPRICE();
//	            }
//
//	            model.addAttribute("totalItems", totalItems);
//	            model.addAttribute("totalPrice", totalPrice);
//	        }
//	    }
//	}

	@RequestMapping("")
	public String getHome(Model model) {
		Optional<user> users = userDao.findById("user1");
		List<cart_item> cartItems = (List<cart_item>) users.get().getCarts().getFirst().getCart_items();
		String page = "home.jsp";
		model.addAttribute("page", page);
		model.addAttribute("cartItems", cartItems);
		return "index";
	}

	@RequestMapping("store")
	public String getStore(Model model, @RequestParam("q") Optional<String> q,
			@RequestParam(name = "brand") Optional<List<String>> brands,
			@RequestParam(name = "system") Optional<List<String>> systems,
			@RequestParam(name = "min", defaultValue = "0") Optional<Double> min,
			@RequestParam(name = "max", defaultValue = "50000000") Optional<Double> max,
			@RequestParam(name = "sorts") Optional<String> sorts, @RequestParam(value = "dirs") Optional<String> dirs,
			@RequestParam(name = "sizes") Optional<Integer> sizes,
			@RequestParam(name = "pages") Optional<Integer> pages) {

		Sort.Direction direction = Sort.Direction.fromString(dirs.orElse("DESC"));

		Sort sort = Sort.by(direction, sorts.orElse("NAME"));

		Pageable pageable = PageRequest.of(pages.orElse(1) - 1, sizes.orElse(15), sort);
		Page<phone> productPage = phonedao.findAll(pageable);

		List<phone> listphone = productPage.getContent();
		listphone = listphone.stream()
				.filter(phone -> (phone.getVariants().get(0).getPRICE() >= min.orElse(0.0)
						&& phone.getVariants().get(0).getPRICE() <= max.orElse(50000000.0)))
				.collect(Collectors.toList());
		if (!q.isEmpty()) {
			listphone = listphone.stream().filter(phone -> phone.getNAME().contains(q.orElse("")))
					.collect(Collectors.toList());
		}
		if (brands != null && !brands.isEmpty()) {
			listphone = listphone.stream().filter(phone -> brands.orElse(null).contains(phone.getBrand().getNAME()))
					.collect(Collectors.toList());
		}
		if (systems != null && !systems.isEmpty()) {
			listphone = listphone.stream().filter(phone -> systems.orElse(null).contains(phone.getSystem().getSYSTEM()))
					.collect(Collectors.toList());
		}

		model.addAttribute("productPage", productPage);
		model.addAttribute("listphone", listphone);
		String page = "store.jsp";
		model.addAttribute("page", page);
		return "index";
	}

	@ModelAttribute("list_brand")
	public List<brand> getListBrand() {
		return brandDao.findAll();
	}

	@ModelAttribute("list_system")
	public List<system> getListSystem() {
		return systemDao.findAll();
	}

	@Autowired
	phoneDao phonedao;
	@Autowired
	variantDao variantdao;

	@ModelAttribute("list_category")
	public List<category> getList() {
		return categoryDao.findAll();
	}

	@GetMapping("changepass")
	public String getchangepass(Model model) {
		return "/views/changepassword";
	}

	@GetMapping("forgotpass2")
	public String getForgotpass2(Model model) {
		return "/views/forgotpass2";
	}

	@GetMapping("forgotpass3")
	public String getForgotpass3(Model model) {
		return "/views/forgotpass3";
	}

	@RequestMapping("checkout")
	public String getCheckout(Model model) {
		
		order order = orderDao.getOrderMoi();
		double totalAmount = 0;
		double totalDiscount = 0;
		List<order_item> listItem = order.getOrder_items();
		for (order_item oi : listItem) {
			totalAmount += oi.getPRICE() * oi.getQUANTITY();
			totalDiscount += oi.getPRICE() * ((oi.getVariant().getDiscount_product().getDISCOUNT_PERCENTAGE()) / 100);
		}
		order.setTOTAL_AMOUNT(totalAmount);
		order.setTOTAL_DISCOUNT(totalDiscount);
		orderDao.save(order);
		user us = sessionService.get("list");
		user user = userDao.findById(us.getUSERNAME()).get();
		List<payment_method> listPay = payment_methodDao.findAll();
		model.addAttribute("pays", listPay);
		
		model.addAttribute("user", user);
		model.addAttribute("order", order);
		model.addAttribute("totalOrder", totalAmount);
		
		String page = "checkout.jsp";
		model.addAttribute("page", page);
		return "index";
	}

	@RequestMapping("muangay/{id}")
	public String muaNgay(Model model, @PathVariable("id") Integer id,
			@RequestParam(name = "quantity", defaultValue = "1") int quantity) {
		user us = sessionService.get("list");
		user user = userDao.findById(us.getUSERNAME()).get();		
		order or = new order();
		or.setUser(user);
		or.setCREATE_AT(new Date());
		or.setUPDATE_AT(new Date());
		or.setAddress(user.getAddresses().get(0));	
		orderDao.save(or);

		order order = orderDao.findById(or.getID()).get();
		Optional<variant> variant = variantDao.findById(id);
		order_item order_item = new order_item();
		order_item.setOrder(order);
		order_item.setVariant(variant.get());
		order_item.setPRICE(getPriceVariant(variant.get()));
		order_item.setQUANTITY(quantity);
		
		order_itemDao.save(order_item);
		return "redirect:/shop/checkout";
	}


	public Double getPriceVariant(variant variant) {
		if (variant.getDiscount_product().getEXPIRY_DATE().after(new Date())) {
			return variant.getPRICE() * ((100 - variant.getDiscount_product().getDISCOUNT_PERCENTAGE()) / 100);
		} else {
			return variant.getPRICE();
		}
	}

	@RequestMapping("ordersuccess")
	public String getOrderSuccess(Model model,
			@RequestParam("id_order") Integer idOrder,
			@RequestParam("id_pay") Integer idPay,
			@RequestParam("id_address") Integer idAddress,
			@RequestParam("discount") Optional<Integer> discount) {
		order order = orderDao.findById(idOrder).get();
		address adr = addressDao.findById(idAddress).get();
		payment_method pay = payment_methodDao.findById(idPay).get();
		discount_code discount_code;
		if (discount.isPresent()) {
		    discount_code = discount_codeDao.findById(discount.get()).orElse(null);
		} else {
		    discount_code = null;
		}

		order.setAddress(adr);
		order.setPayment_method(pay);
		order.setStatus_order(status_orderDao.findById(2).get());
		order.setDiscount_code(discount_code);
		orderDao.save(order);
		List<order_item> listOrderItem = order_itemDao.finByAllOrder(order.getID());
		for (order_item oi : listOrderItem) {
			variant v = variantdao.findById(oi.getVariant().getID()).get();
			v.setQUANTITY(v.getQUANTITY() - oi.getQUANTITY());
			variantDao.save(v);
		}
		model.addAttribute("order", order);
		model.addAttribute("adr", adr.getADDRESS());
		model.addAttribute("pay", pay.getNAME());
		return "/views/ordersuccess";
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

	@RequestMapping("product/{idphone}")
	public String getProduct(Model model, @PathVariable("idphone") Integer id, @RequestParam("id_variant") Integer idv,
			@RequestParam("id_storage") Integer idGB) {
		phone finByIdPhone = phonedao.findById(id).get();
		List<variant> finAllColor = variantdao.variantByGBId(id, idGB);
		List<phone> listPhone = phonedao.findAllBybrandIDEqual(finByIdPhone.getBrand().getID());
		variant variant = variantdao.findById(idv).get();
		model.addAttribute("finByIdPhone", finByIdPhone);
		model.addAttribute("quantity", variant.getQUANTITY());
		model.addAttribute("variant2", variant);
		model.addAttribute("finAllColor", finAllColor);
		model.addAttribute("listPhone", listPhone);
		String page = "product.jsp";
		model.addAttribute("page", page);
		return "index";
	}

	@GetMapping("ajax/getGia/{id}")
	@ResponseBody
	public Optional<List<Double>> getGia(@PathVariable("id") Integer id) {
		Optional<variant> variant = variantdao.findById(id);
		List<Double> listDouble = new ArrayList<Double>();
		listDouble.add(variant.get().getPRICE());
		Date now = new Date();
		if (variant.get().getDiscount_product().getEXPIRY_DATE().compareTo(now) > 0) {
			listDouble.add(variant.get().getDiscount_product().getDISCOUNT_PERCENTAGE());
		} else {
			listDouble.add(0.0);
		}
		return Optional.of(listDouble);
	}

	@GetMapping("ajax/getGiaRelated/{id}")
	@ResponseBody
	public Optional<List<Double>> getGiaRelated(@PathVariable("id") Integer id) {
		Optional<variant> variant = variantdao.findById(id);
		List<Double> listDouble = new ArrayList<Double>();
		listDouble.add(variant.get().getPRICE());
		Date now = new Date();
		if (variant.get().getDiscount_product().getEXPIRY_DATE().compareTo(now) > 0) {
			listDouble.add(variant.get().getDiscount_product().getDISCOUNT_PERCENTAGE());
		} else {
			listDouble.add(0.0);
		}
		return Optional.of(listDouble);
	}

	@RequestMapping("cart")
	public String getShopCart(Model model) {
		String page = "cart.jsp";
		model.addAttribute("page", page);
		return "index";
	}

}
