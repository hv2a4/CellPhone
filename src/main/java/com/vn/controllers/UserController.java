package com.vn.controllers;

import com.vn.DAO.systemDao;
import com.vn.DAO.userDao;
import com.vn.entity.user;
import com.vn.serviceimpl.MailerServiceImpl;
import com.vn.utils.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletRequest;

import java.util.List;

@Controller
@RequestMapping("/shop")
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
    private com.vn.DAO.systemDao systemDao;

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
