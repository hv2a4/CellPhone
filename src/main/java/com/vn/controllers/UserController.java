package com.vn.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.vn.DAO.categoryDao;
import com.vn.DAO.phoneDao;
import com.vn.DAO.systemDao;
import com.vn.DAO.userDao;
import com.vn.DAO.variantDao;
import com.vn.entity.category;
import com.vn.entity.phone;
import com.vn.entity.user;
import com.vn.entity.variant;
import com.vn.serviceimpl.MailerServiceImpl;
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
    public String postForgotpass3(Model model,
                                  @RequestParam(name = "emailUser") String email,
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
    public String getChangePasswordPage(Model model,
                                        @RequestParam(name = "emailUser") String email,
                                        @RequestParam(name = "otpEmail") String otp) {
        model.addAttribute("email", email);
        model.addAttribute("otp", otp);
        return "/views/forgotpass3";
    }

    @PostMapping("changePassword")
    public String postChangePassword(Model model,
                                     @RequestParam(name = "emailUser") String email,
                                     @RequestParam(name = "otpEmail") String otp,
                                     @RequestParam(name = "password") String password,
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

    @RequestMapping("store")
    public String getStore(Model model) {
    	List<phone> finByAllPhone = phonedao.findAll();
		model.addAttribute("finByAllPhone", finByAllPhone);
        String page = "store.jsp";
        model.addAttribute("page", page);
        return "index";
    }

    @RequestMapping("cart")
    public String getCart(Model model) {
        String page = "cart.jsp";
        model.addAttribute("page", page);
        return "index";
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


	@RequestMapping("profile")
	public String getProfile(Model model) {
		String page = "profile.jsp";
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

	@RequestMapping("product/{id}")
	public String getProduct(Model model, @PathVariable("id") Integer id) {
		phone finByIdPhone = phonedao.findById(id).get();
		model.addAttribute("finByIdPhone", finByIdPhone);
		String page = "product.jsp";
		model.addAttribute("page", page);
		return "index";
	}
	
	//
	@GetMapping("ajax/getGia/{id}")
	@ResponseBody
	public Optional<Double> getGia(@PathVariable("id") Integer id) {
		Optional<variant> variant = variantdao.findById(id);
	    return Optional.of(variant.get().getPRICE());
	}
	@GetMapping("ajax/getGia/{idvariant}/{idstorage}/{idcolor}")
	@ResponseBody
	public Optional<Double> getGiaProduct(@PathVariable("idvariant") Integer idvariant,@PathVariable("idstorage") Integer idstorage,@PathVariable("idcolor") Integer idcolor) {
		variant variant = variantdao.variantById(idvariant, idstorage, idcolor);
		System.out.println(variant.getPRICE());
		return Optional.of(variant.getPRICE());
	}
	

}
