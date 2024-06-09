package com.vn.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.antlr.v4.runtime.misc.Utils;
import org.eclipse.tags.shaded.org.apache.xpath.compiler.Keywords;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.vn.DAO.cartDao;
import com.vn.DAO.cart_itemDao;
import com.vn.DAO.brandDao;
import com.vn.DAO.categoryDao;
import com.vn.DAO.phoneDao;
import com.vn.DAO.systemDao;
import com.vn.DAO.userDao;
import com.vn.DAO.variantDao;
import com.vn.entity.cart;
import com.vn.entity.cart_item;
import com.vn.entity.brand;
import com.vn.entity.category;
import com.vn.entity.phone;
import com.vn.entity.system;
import com.vn.entity.user;
import com.vn.entity.variant;
import com.vn.serviceimpl.MailerServiceImpl;
import com.vn.utils.CookieService;
import com.vn.utils.ParamService;
import com.vn.utils.SessionService;

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
	systemDao systemDao;
	@Autowired
	categoryDao categoryDao;
	@Autowired
	cartDao cartdao;

	@Autowired
	cart_itemDao cart_itemdao;
	
	@Autowired
	brandDao brandDao;

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
	public String getStore(
			Model model, 
			@RequestParam("q") Optional<String> q,
			@RequestParam(name = "brand") Optional<List<String>> brands,
			@RequestParam(name = "system") Optional<List<String>> systems,
			@RequestParam(name = "min", defaultValue = "0") Optional<Double> min,
			@RequestParam(name = "max", defaultValue = "50000000") Optional<Double> max,
			@RequestParam(name = "sorts") Optional<String> sorts,
			@RequestParam(value = "dirs") Optional<String> dirs,
			@RequestParam(name = "sizes") Optional<Integer> sizes,
			@RequestParam(name = "pages") Optional<Integer> pages) {

		Sort.Direction direction = Sort.Direction.fromString(dirs.orElse("DESC"));

		Sort sort = Sort.by(direction, sorts.orElse("NAME"));
		
		Pageable pageable = PageRequest.of(pages.orElse(1)-1, sizes.orElse(15), sort);
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

	@RequestMapping("product/{idphone}")
	public String getProduct(Model model, @PathVariable("idphone") Integer id, @RequestParam("id_variant") Integer idv, @RequestParam("id_storage") Integer idGB) {
		phone finByIdPhone = phonedao.findById(id).get();
		List<variant> finAllColor = variantdao.variantByGBId(id, idGB);
		List<phone> listPhone = phonedao.findAllBybrandIDEqual(finByIdPhone.getBrand().getID());
		variant variant = variantdao.findById(idv).get();
		model.addAttribute("finByIdPhone", finByIdPhone);
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
		}else {
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
		}else {
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
