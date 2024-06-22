package com.vn.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vn.DAO.userDao;
import com.vn.entity.user;
import com.vn.utils.ParamService;
import com.vn.utils.SessionService;

@Controller
@RequestMapping("/shop")
public class Changepass {
	@Autowired
	ParamService paramService;
	@Autowired
	SessionService sessionService;
	@Autowired
	userDao userDao;

	@RequestMapping("changepass")
	public String getchangepass(Model model) {

		return "/views/changepassword";
	}

	@PostMapping("changepass")
	public String postChangePass(Model model, RedirectAttributes redirectAttributes) {
	    String userName = paramService.getString("userName", "");
	    String password = paramService.getString("password", "");
	    String newPassword = paramService.getString("newPassword", "");
	    String reterNewPassword = paramService.getString("reterNewPassword", "");
	    
	    Optional<user> userOptional = userDao.findById(userName);
	    
	    if (userOptional.isPresent()) {
	        user user = userOptional.get();
	        
	        if (password.equals(user.getPASSWORD())) {
	            if (!newPassword.isEmpty() && newPassword.length() >= 6 && newPassword.equals(reterNewPassword)) {
	                user.setPASSWORD(newPassword);
	                userDao.save(user);
	                redirectAttributes.addFlashAttribute("formSubmitted", "true");
	                return "redirect:/shop/changepass"; // Redirect to avoid duplicate form submissions
	            } else {
	                if (newPassword.isEmpty() || newPassword.length() < 6) {
	                    redirectAttributes.addFlashAttribute("message2", "Mật khẩu không được để trống và phải có ít nhất 6 kí tự");
	                } else {
	                    redirectAttributes.addFlashAttribute("message3", "Mật khẩu không trùng khớp");
	                }
	                return "redirect:/shop/changepass";
	            }
	        } else {
	            redirectAttributes.addFlashAttribute("message1", "Mật khẩu cũ không đúng");
	            return "redirect:/shop/changepass";
	        }
	    } else {
	        redirectAttributes.addFlashAttribute("message1", "Người dùng không tồn tại");
	        return "redirect:/shop/changepass";
	    }
	}
}
