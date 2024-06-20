package com.vn.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collector;
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
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.vn.service.VNPayService;
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
	ParamService paramService;
	@Autowired
	CookieService cookieService;
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
	@Autowired
	phoneDao phonedao;
	@Autowired
	variantDao variantdao;
	@Autowired
	status_invoiceDao status_invoiceDao;
	@Autowired
	invoiceDao invoiceDao;
	@Autowired
	HttpServletRequest request;
	@Autowired
	VNPayService vnPayService;

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

	@RequestMapping("")
	public String getHome(Model model) {
		String page = "home.jsp";
		model.addAttribute("page", page);
		return "index";
	}

	@ModelAttribute("cartItems")
	public List<cart_item> getListCartItem(Model model) {
		user userss = sessionService.get("list");

		if (userss != null) {
			user user = userDao.getById(userss.getUSERNAME());
			List<cart_item> cartItems = (List<cart_item>) user.getCarts().getFirst().getCart_items();
			Double totalCart = 0.0;
			int totalquantity = 0;
			for (cart_item cart_item : cartItems) {
				totalCart += getGiaKhuyenMai(cart_item.getVariant()) * cart_item.getQUANTITY();
				totalquantity += cart_item.getQUANTITY();
			}
			model.addAttribute("totalquantity", totalquantity);
			model.addAttribute("totalCart", totalCart);
			return cartItems;
		} else {
			List<cart_item> list = new ArrayList<cart_item>();
			return list;
		}

	}

	public Double getGiaKhuyenMai(variant variant) {
		if (variant.getDiscount_product().getEXPIRY_DATE().after(new Date())) {
			return variant.getPRICE() * (100 - variant.getDiscount_product().getDISCOUNT_PERCENTAGE()) / 100;
		} else {
			return variant.getPRICE();
		}
	}

	public user getUser() {
		user userss = sessionService.get("list");
		user user = userDao.getById(userss.getUSERNAME());
		return user;
	}

	@RequestMapping("cart/add/{id}")
	@ResponseBody
	public String addCart(Model model, @PathVariable("id") Integer id) {
		Optional<variant> variant = variantdao.findById(id);
		user userss = sessionService.get("list");
		user user = userDao.getById(userss.getUSERNAME());
		if (user.getCarts().get(0) != null) {
			cart_item cart_item = new cart_item();
			cart_item.setCart(user.getCarts().get(0));

			cart_item.setQUANTITY(1);
			cart_item.setVariant(variant.get());

			List<cart_item> list_cart_item = user.getCarts().get(0).getCart_items();
			for (cart_item item : list_cart_item) {
				if (variant.get().getID() == item.getVariant().getID()) {
					cart_item = item;
					if (cart_item.getQUANTITY() <= variant.get().getQUANTITY()) {
						if (cart_item.getQUANTITY() >= variant.get().getQUANTITY()) {
							cart_item.setQUANTITY(variant.get().getQUANTITY());
						} else {
							cart_item.setQUANTITY(cart_item.getQUANTITY() + 1);
						}
					}
					break;
				}
			}
			cart_itemdao.save(cart_item);
			return "redirect:/shop/cart";
		} else {
			cart cart = new cart();
			cart.setUser(user);
			cartdao.save(cart);
			cart_item cart_item = new cart_item();
			cart_item.setCart(user.getCarts().get(0));

			cart_item.setQUANTITY(1);
			cart_item.setVariant(variant.get());

			List<cart_item> list_cart_item = user.getCarts().get(0).getCart_items();
			for (cart_item item : list_cart_item) {
				if (variant.get().getID() == item.getVariant().getID()) {
					cart_item = item;
					if (cart_item.getQUANTITY() <= variant.get().getQUANTITY()) {
						if (cart_item.getQUANTITY() >= variant.get().getQUANTITY()) {
							cart_item.setQUANTITY(variant.get().getQUANTITY());
						} else {
							cart_item.setQUANTITY(cart_item.getQUANTITY() + 1);
						}
					}
					break;
				}
			}
			cart_itemdao.save(cart_item);
			return "redirect:/shop/cart";
		}

	}

	@RequestMapping("cart")
	public String cart(Model model, @RequestParam("id_cart") Optional<Integer> id) {
		user us = sessionService.get("list");
		if (us != null) {
			user user = userDao.findById(us.getUSERNAME()).get();
			List<cart_item> cart_items = user.getCarts().getFirst().getCart_items();
			double totalPrice = 0;
			for (cart_item item : cart_items) {
				totalPrice += getGiaKhuyenMai(item.getVariant()) * item.getQUANTITY();
			}

			String page = "cart.jsp";
			model.addAttribute("totalPrice", totalPrice);
			model.addAttribute("page", page);
			return "index";
		} else {
			return "redirect:/shop/login";
		}

	}

	@RequestMapping("updateQuantity")
	public String updateQuantity(Model model, @RequestParam("id") Integer id, @RequestParam("quantity") int quantity) {
		cart_item cart_item = cart_itemdao.findById(id).get();
		cart_item.setQUANTITY(quantity);
		cart_itemdao.save(cart_item);
		return "redirect:/shop/cart";
	}

	@RequestMapping("addcart/{id}")
	public String addCartProduct(Model model, @PathVariable("id") Integer id,
			@RequestParam(name = "quantity", defaultValue = "1") int quantity) {
		user us = sessionService.get("list");
		if (us != null) {
			Optional<variant> variant = variantdao.findById(id);
			user userss = sessionService.get("list");
			user user = userDao.getById(userss.getUSERNAME());
			cart_item cart_item = new cart_item();
			cart_item.setCart(user.getCarts().get(0));
			cart_item.setQUANTITY(quantity);
			cart_item.setVariant(variant.get());

			List<cart_item> list_cart_item = user.getCarts().get(0).getCart_items();
			for (cart_item item : list_cart_item) {
				if (variant.get().getID() == item.getVariant().getID()) {
					cart_item = item;
					cart_item.setQUANTITY(cart_item.getQUANTITY() + quantity);
					break;
				}
			}
			cart_itemdao.save(cart_item);
			return "redirect:/shop/cart";
		} else {
			return "redirect:/shop/login";
		}
	}

	@RequestMapping("cart/delete/{id}")
	public String deleteCart(Model model, @PathVariable("id") Integer id) {
		cart_item cart_item = cart_itemdao.findById(id).get();
		cart_itemdao.delete(cart_item);
		return "redirect:/shop/cart";
	}

	@RequestMapping("store")
	public String getStore(Model model, @RequestParam("q") Optional<String> q,
			@RequestParam(name = "brand") Optional<List<String>> brand,
			@RequestParam(name = "system") Optional<List<String>> systems,
			@RequestParam(name = "min") Optional<Double> min, @RequestParam(name = "max") Optional<Double> max,
			@RequestParam(name = "sorts") Optional<String> sorts, @RequestParam(value = "dirs") Optional<String> dirs,
			@RequestParam(name = "sizes") Optional<Integer> sizes,
			@RequestParam(name = "pages", defaultValue = "1") Optional<Integer> pages) {

		List<variant> listvariant = variantdao.findAll();
		Double maxPrice = 0.0;
		for (variant variant : listvariant) {
			if (variant.getPRICE() > maxPrice) {
				maxPrice = variant.getPRICE();
			}
		}
		Sort.Direction direction = Sort.Direction.fromString(dirs.orElse("DESC"));
		Sort sort = Sort.by(direction, sorts.orElse("NAME"));
		Pageable pageable = PageRequest.of(pages.orElse(1) - 1, sizes.orElse(12), sort);
		Page<phone> allProductPage = phonedao.findAll(pageable);

		// LOC THEO 1 DK
		if (!q.orElse("").isEmpty()) {
			allProductPage = phonedao.findAllByNAMELike("%" + q.get() + "%", pageable);
		}
		if (min.orElse(0.0) != 0 || maxPrice != max.orElse(maxPrice)) {
			allProductPage = phonedao.findByPRICEBetween(min.get(), max.get(), pageable);
		}
		if (brand.isPresent() && !brand.get().isEmpty()) {
			allProductPage = phonedao.findBybrandNAMEIn(brand.get(), pageable);
		}
		if (systems.isPresent() && !systems.get().isEmpty()) {
			allProductPage = phonedao.findBysystemSYSTEMIn(systems.get(), pageable);
		}
		if (brand.isPresent() && !brand.get().isEmpty()) {
			allProductPage = phonedao.findBybrandNAMEIn(brand.get(), pageable);
		}
		// LOC THEO 2 DK
		// TEN VA GIA
		// TEN VA HANG
		// TEN VA HE THONG
		// GIA VA HANG
		if ((min.orElse(0.0) != 0 || maxPrice != max.orElse(maxPrice))
				&& (brand.isPresent() && !brand.get().isEmpty())) {
			allProductPage = phonedao.findByPRICEBetweenAndBrandIn(min.get(), max.get(), brand.get(), pageable);
		}
		// GIA VA HE THONG
		if ((min.orElse(0.0) != 0 || maxPrice != max.orElse(maxPrice))
				&& (systems.isPresent() && !systems.get().isEmpty())) {
			allProductPage = phonedao.findByPRICEBetweenAndsystemIn(min.get(), max.get(), systems.get(), pageable);
		}
		// HANG VA HE THONG
		if ((brand.isPresent() && !brand.get().isEmpty()) && (systems.isPresent() && !systems.get().isEmpty())) {
			allProductPage = phonedao.findBybrandInAndsystemIn(brand.get(), systems.get(), pageable);
		}

		// LOC THEO 3 DK
		if ((min.orElse(0.0) != 0 || maxPrice != max.orElse(maxPrice)) && (brand.isPresent() && !brand.get().isEmpty())
				&& (systems.isPresent() && !systems.get().isEmpty())) {
			allProductPage = phonedao.findByPriceSystemBrand(min.get(), max.get(), systems.get(), brand.get(),
					pageable);
		}
		// LOC THEO 4 DK
		if ((!q.orElse("").isEmpty()) && (min.orElse(0.0) != 0 || maxPrice != max.orElse(maxPrice))
				&& (brand.isPresent() && !brand.get().isEmpty()) && (systems.isPresent() && !systems.get().isEmpty())) {
			allProductPage = phonedao.findByNamePriceSystemBrand(min.get(), max.get(), systems.get(), brand.get(),
					q.get(), pageable);
		}

		List<phone> listphone = allProductPage.getContent();

		model.addAttribute("productPage", allProductPage);
		model.addAttribute("listphone", listphone);
		model.addAttribute("maxPrice", maxPrice);
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
	public String getCheckout(
			@RequestParam(value = "selectedItems", required = false) Optional<List<Integer>> selectedItems,
			Model model) {
		// code này thu được tiền ship
		user us = sessionService.get("list");
		if (us != null) {
			order order = orderDao.getOrderMoi();
			double totalAmount = 0;
			double totalDiscount = 0;
			List<order_item> listItem = order.getOrder_items();
			for (order_item oi : listItem) {
				totalAmount += oi.getPRICE() * oi.getQUANTITY();
				totalDiscount += oi.getPRICE() * (oi.getVariant().getDiscount_product().getDISCOUNT_PERCENTAGE() / 100);
			}
			order.setTOTAL_AMOUNT(totalAmount);
			order.setTOTAL_DISCOUNT(totalDiscount);
			orderDao.save(order);
			user user = userDao.findById(us.getUSERNAME()).get();
			List<payment_method> listPay = payment_methodDao.findAll();
			model.addAttribute("pays", listPay);

			model.addAttribute("user", user);
			model.addAttribute("order", order);
			model.addAttribute("totalOrder", totalAmount);

			String selectedItemsQueryParam = "";
			if (selectedItems.isPresent()) {
				List<String> selectedItemStrings = new ArrayList<>();
				for (Integer selectedItem : selectedItems.get()) {
					selectedItemStrings.add(String.valueOf(selectedItem));
				}
				selectedItemsQueryParam = String.join(",", selectedItemStrings);
			}
			model.addAttribute("selectedItems", selectedItemsQueryParam);

			String page = "checkout.jsp";
			model.addAttribute("page", page);

			return "index";
		} else {
			return "redirect:/shop/login";
		}
	}

	@RequestMapping("muangay/{id}")
	public String muaNgay(Model model, @PathVariable("id") Integer id,
			@RequestParam(name = "quantity", defaultValue = "1") int quantity) {
		user us = sessionService.get("list");
		if (us != null) {
			user user = userDao.findById(us.getUSERNAME()).get();
			order or = new order();
			or.setUser(user);
			or.setCREATE_AT(new Date());
			or.setUPDATE_AT(new Date());
			if (user.getAddresses() != null && !user.getAddresses().isEmpty()) {
				or.setADDRESS((user.getAddresses().get(0)).getADDRESS());
			} else {
				return "redirect:/shop/address";
			}

			orderDao.save(or);

			order order = orderDao.getOrderMoi();

			Optional<variant> variant = variantDao.findById(id);
			order_item order_item = new order_item();
			order_item.setOrder(order);
			order_item.setVariant(variant.get());
			order_item.setPRICE(getGiaKhuyenMai(variant.get()));
			order_item.setQUANTITY(quantity);

			order_itemDao.save(order_item);
			return "redirect:/shop/checkout";
		}
		return "redirect:/shop/login";
	}

	@GetMapping("getShippingFee")
	@ResponseBody
	public Map<String, Object> getShippingFee(@RequestParam(value = "address", required = false) String addressId) {
		Map<String, Object> response = new HashMap<>();
		if (addressId != null) {
			Optional<address> listAdrs = addressDao.findById(Integer.parseInt(addressId));
			if (listAdrs.isPresent()) {
				response.put("shippingFee", listAdrs.get().getSHIPPING_FEE());
				response.put("message", "Shipping fee updated");
			} else {
				response.put("shippingFee", 0);
				response.put("message", "Address not found");
			}
		} else {
			response.put("shippingFee", 0);
			response.put("message", "Address ID is null");
		}
		return response;
	}
//	@RequestMapping("mualai")
//	public String muaLai(Model model, @RequestParam("id_order") Integer id,
//			@RequestParam(name = "quantity", defaultValue = "1") int quantity) {
//		user us = sessionService.get("list");
//		if (us != null) {
//			user user = userDao.findById(us.getUSERNAME()).get();
//			order or = new order();
//			or.setUser(user);
//			or.setCREATE_AT(new Date());
//			or.setUPDATE_AT(new Date());
//			if (user.getAddresses() != null && !user.getAddresses().isEmpty()) {
//				or.setAddress(user.getAddresses().get(0));
//			} else {
//				return "redirect:/shop/address";
//			}
//			
//			orderDao.save(or);
//			
//			order order = orderDao.getOrderMoi();
//			
//			Optional<variant> variant = variantDao.findById(id);
//			order_item order_item = new order_item();
//			order_item.setOrder(order);
//			order_item.setVariant(variant.get());
//			order_item.setPRICE(getPriceVariant(variant.get()));
//			order_item.setQUANTITY(quantity);
//			
//			order_itemDao.save(order_item);
//			return "redirect:/shop/checkout";
//		}
//		return "redirect:/shop/login";
//	}
//
//	

	@RequestMapping("addorder")
	public String addorder(@RequestParam(value = "selectedItems", required = false) List<Integer> selectedItems,
			Model model) {
		user us = sessionService.get("list");
		if (us != null) {
			user user = userDao.findById(us.getUSERNAME()).get();
			cart cart = user.getCarts().get(0);
			order or = new order();
			or.setUser(user);
			or.setCREATE_AT(new Date());
			or.setUPDATE_AT(new Date());
			if (user.getAddresses() != null && !user.getAddresses().isEmpty()) {
				or.setADDRESS((user.getAddresses().get(0)).getADDRESS());
			} else {
				return "redirect:/shop/address";
			}
			orderDao.save(or);
			if (selectedItems == null || selectedItems.isEmpty()) {
				// If no items are selected, process all items in the cart
				selectedItems = cart.getCart_items().stream().map(cart_item::getID).collect(Collectors.toList());
			}

			for (cart_item citem : cart.getCart_items()) {
				if (selectedItems.contains(citem.getID())) {
					order_item order_item = new order_item();
					order_item.setOrder(or);
					order_item.setPRICE(getGiaKhuyenMai(citem.getVariant()));
					order_item.setQUANTITY(citem.getQUANTITY());
					order_item.setVariant(citem.getVariant());
					order_itemDao.save(order_item);
				}
			}
			String selectedItemsQueryParam = selectedItems.stream().map(String::valueOf)
					.collect(Collectors.joining(","));

			return "redirect:/shop/checkout?selectedItems=" + selectedItemsQueryParam;
		}
		return "redirect:/shop/login";
	}

	public Double getPriceVariant(variant variant) {
		if (variant.getDiscount_product().getEXPIRY_DATE().after(new Date())) {
			return variant.getPRICE() * ((100 - variant.getDiscount_product().getDISCOUNT_PERCENTAGE()) / 100);
		} else {
			return variant.getPRICE();
		}
	}

	@RequestMapping("ordersuccess")
	public String getOrderSuccess(Model model, @RequestParam("id_pay") Optional<Integer> idPay,
			@RequestParam("id_address") Optional<Integer> idAddress) {
		
		user user1 = getUser();
		order order = orderDao.getOrderMoi();
		address adr = addressDao.findById(idAddress.orElse(1)).get();
		payment_method pay = payment_methodDao.findById(idPay.orElse(2)).get();

		order.setADDRESS((user1.getAddresses().get(0)).getADDRESS());
		order.setTOTAL_AMOUNT(order.getTOTAL_AMOUNT() + adr.getSHIPPING_FEE());
		order.setPayment_method(pay);
		order.setStatus_order(status_orderDao.findById(2).get());

		orderDao.save(order);
		List<order_item> listOrderItem = order_itemDao.finByAllOrder(order.getID());
		for (order_item oi : listOrderItem) {
			variant v = variantdao.findById(oi.getVariant().getID()).get();
			v.setQUANTITY(v.getQUANTITY() - oi.getQUANTITY());
			variantDao.save(v);
		}
		user us = sessionService.get("list");
		user user = userDao.findById(us.getUSERNAME()).get();
		cart cart = user.getCarts().get(0);

		List<cart_item> cart_items = cart.getCart_items();
		List<order_item> order_items = order.getOrder_items();

		for (cart_item item : cart_items) {
			for (order_item order_item : order_items) {
				if (order_item.getVariant().getID() == item.getVariant().getID()) {
					cart_itemdao.delete(item);
					break;
				}
			}
		}

		invoice inv = new invoice();
		if (pay.getNAME().equalsIgnoreCase("Thanh toán khi nhận hàng")) {
			inv.setStatus_invoice(status_invoice(2));
			inv.setOrder(order);
			inv.setCREATE_AT(new Date());
			inv.setUPDATE_AT(new Date());
			inv.setTOTAL_AMOUNT(order.getTOTAL_AMOUNT());
			invoiceDao.save(inv);
			model.addAttribute("order", order);
			model.addAttribute("adr", adr.getADDRESS());
			model.addAttribute("pay", pay.getNAME());
			return "/views/ordersuccess";
		} else {
			inv.setStatus_invoice(status_invoice(1));
			inv.setOrder(order);
			inv.setCREATE_AT(new Date());
			inv.setUPDATE_AT(new Date());
			inv.setTOTAL_AMOUNT(order.getTOTAL_AMOUNT());
			invoiceDao.save(inv);

			invoice invm = getInvoiceMoi();

			model.addAttribute("order", order);
			model.addAttribute("adr", adr.getADDRESS());
			model.addAttribute("pay", pay.getNAME());
			request.setAttribute("id_oder", invm.getID());

			long totalAmountInt = invm.getTOTAL_AMOUNT().intValue();
			String baseUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
			String vnpayUrl = vnPayService.createOrder(totalAmountInt, invm.getID() + "", baseUrl);
			return "redirect:" + vnpayUrl;
		}

	}

	@GetMapping("/thanhtoanonline")
	public String GetMapping(HttpServletRequest request, Model model) {
		int paymentStatus = vnPayService.orderReturn(request);

		String orderInfo = request.getParameter("vnp_OrderInfo");
		String paymentTime = request.getParameter("vnp_PayDate");
		String transactionId = request.getParameter("vnp_TransactionNo");
		String totalPrice = request.getParameter("vnp_Amount");
		order order = orderDao.getOrderMoi();

		model.addAttribute("adr", order.getADDRESS());
		model.addAttribute("pay", "Thanh toán online");
		model.addAttribute("order", order);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("paymentTime", paymentTime);
		model.addAttribute("transactionId", transactionId);

		return paymentStatus == 1 ? "views/ordersuccess" : "views/orderfail";
	}

	public invoice getInvoiceMoi() {
		return invoiceDao.getInvoiceMoi();
	}

	public status_invoice status_invoice(Integer id) {
		return status_invoiceDao.findById(id).get();
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

	@ModelAttribute("listCartItems")
	public List<cart_item> getListCartItem() {
		user userss = sessionService.get("list");
		if (userss != null) {
			user user = userDao.getById(userss.getUSERNAME());
			List<cart_item> cartItems = (List<cart_item>) user.getCarts().getFirst().getCart_items();
			return cartItems;
		} else {
			List<cart_item> cartItems = new ArrayList<cart_item>();
			return cartItems;
		}

	}

	@RequestMapping("profile")
	public String getProfile(Model model, user item) {

		model.addAttribute("items", item);

		String page = "profile.jsp";
		model.addAttribute("page", page);
		return "index";
	}

	@PostMapping("profile")
	public String postProfile(@Validated @ModelAttribute("items") user item, BindingResult bindingResult, Model model,
			@RequestPart("photo_file") MultipartFile file) {
		if (bindingResult.hasErrors()) {
			System.out.println("hello");
			model.addAttribute("page", "profile.jsp");
			return "index";
		}
		String photo = paramService.save(file, "/images/");

		Optional<user> userS = userDao.findById(item.getUSERNAME());

		userS.get().setAVATAR(photo);
		userS.get().setFULLNAME(item.getFULLNAME());
		userS.get().setPHONE_NUMBER(item.getPHONE_NUMBER());
		userS.get().setGENDER(item.getGENDER());
		userS.get().setEMAIL(item.getEMAIL());
		System.out.println(userS.get().getFULLNAME());
		userDao.save(userS.get());
		sessionService.set("list", userS.get());
		model.addAttribute("profileSuccess", "true");
		model.addAttribute("items", item);

		String page = "profile.jsp";
		model.addAttribute("page", page);
		return "index";
	}

	@GetMapping("address")
	public String getAddress(Model model, address item) {
		user userSession = sessionService.get("list");

		Optional<user> defaultUser = userDao.findById(userSession.getUSERNAME());
		item.setUser(defaultUser.get());
		model.addAttribute("item", item);
		String page = "address.jsp";
		model.addAttribute("page", page);

		return "index";
	}

//		@PostMapping("address")
//		public String postAddress(Model model) {
//		 rank defaultRank = rankDao.findById(1).orElse(null); // Assuming rankDao.findById() returns an Optional
//	    item.setRank(defaultRank);
//	    model.addAttribute("item", item);
//			String page = "address.jsp";
//			model.addAttribute("page", page);
//			return "index";
//		}
//	@PostMapping("create")
//	public String createAddress(Model model, address item) {
//		String noteAddress = paramService.getString("noteAddress", "");
//		String cityName = paramService.getString("cityName", "");
//		String districtName = paramService.getString("districtName", "");
//		String wardName = paramService.getString("wardName", "");
//		if (noteAddress.isEmpty() || cityName.isEmpty() || districtName.isEmpty() || wardName.isEmpty()) {
//			String page = "address.jsp";
//			model.addAttribute("errors", "Bạn Chưa Nhập");
//			model.addAttribute("page", page);
//			user userSession = sessionService.get("list");
//			Optional<user> defaultUser = userDao.findById(userSession.getUSERNAME());
//			item.setUser(defaultUser.get());
//			model.addAttribute("item", item);
//			model.addAttribute("page", page);
//
//			return "index";
//		} else {
//			String addres = noteAddress + ", " + wardName + ", " + districtName + ", " + cityName;
//			item.setADDRESS(addres);
//			addressDao.save(item);
//			String page = "address.jsp";
//			model.addAttribute("page", page);
//			return "redirect:/shop/address";
//		}
//
//	}
	@PostMapping("create")
	public String createAddress(Model model, address item) {
		String noteAddress = paramService.getString("noteAddress", "");
		String provinceID = paramService.getString("province", "");
		String districtID = paramService.getString("district", "");
		String wardID = paramService.getString("ward", "");
		String provinceName = paramService.getString("provinceName", "");
		String districtName = paramService.getString("districtName", "");
		String wardName = paramService.getString("wardName", "");
		Double shippingFee = Double.parseDouble(paramService.getString("moneyShip", ""));
		user us = sessionService.get("list");
		String addreses = noteAddress + ", " + wardName + ", " + districtName + ", " + provinceName;
		item.setADDRESS(addreses);
		item.setUser(us);
		item.setPROVINCE(Integer.parseInt(provinceID));
		item.setDISTRICT(Integer.parseInt(districtID));
		item.setWARD(wardID);
		item.setSHIPPING_FEE(shippingFee);
		addressDao.save(item);
		String page = "address.jsp";
		model.addAttribute("page", page);
		model.addAttribute("messageAdd", "true");
		return "index";

	}

	@GetMapping("newAddress")
	public String newAddress(Model model, address item) {

		return "redirect:/shop/address";
	}

	@RequestMapping("/delete/{id}")
	public String deleteAddress(Model model, address item, @PathVariable("id") Integer id) {
		addressDao.deleteById(id);
		user userSession = sessionService.get("list");

		Optional<user> defaultUser = userDao.findById(userSession.getUSERNAME());
		item.setUser(defaultUser.get());
		model.addAttribute("item", item);
		String page = "address.jsp";
		model.addAttribute("page", page);
		model.addAttribute("messageDelete", "true");
		return "index";
	}

	@PostMapping("update/{id}")
	public String postUpdate(address item, Model model, @PathVariable("id") Integer id) {
		System.out.println(id);
		user us = sessionService.get("list");

		String provinceID = paramService.getString("province", "");
		String districtID = paramService.getString("district", "");
		String wardID = paramService.getString("ward", "");
		String noteAddress = paramService.getString("noteAddress", "");
		String provinceName = paramService.getString("provinceName", "");
		String districtName = paramService.getString("districtName", "");
		String wardName = paramService.getString("wardName", "");
		Double shippingFee = Double.parseDouble(paramService.getString("moneyShip", ""));
		String addres = noteAddress + ", " + wardName + ", " + districtName + ", " + provinceName;
		item.setID(id);
		item.setADDRESS(addres);
		item.setUser(us);
		item.setPROVINCE(Integer.parseInt(provinceID));
		item.setDISTRICT(Integer.parseInt(districtID));
		item.setWARD(wardID);
		item.setSHIPPING_FEE(shippingFee);
		addressDao.save(item);
		String page = "address.jsp";
		model.addAttribute("page", page);
		model.addAttribute("messageUpdate", "true");
		return "index";
	}

	@RequestMapping("/edit/{id}")
	public String editRequest(@PathVariable("id") Integer id, address item, Model model) {
		System.out.println(id);
		address list = addressDao.findById(id).get();
		model.addAttribute("id", list.getID());
		model.addAttribute("item", list);
		System.out.println(list.getADDRESS());
		// tên đường
		String sub = list.getADDRESS().substring(0, list.getADDRESS().indexOf(',')).trim();

		model.addAttribute("sub", sub);

		String page = "address.jsp";
		model.addAttribute("page", page);

		return "index";
	}

	@ModelAttribute("listAddress")
	public List<address> getAddresses(Model model, address item) {
		model.addAttribute("item", item);
		List<address> listAddresses = addressDao.findAll();
		return listAddresses;
	}

}
