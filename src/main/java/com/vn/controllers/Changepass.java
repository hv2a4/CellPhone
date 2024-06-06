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
		 user item=new user();
		 model.addAttribute("formSubmitted", false);
		 model.addAttribute("item", item);
		return "/views/changepassword";
	}
	
	@PostMapping("changepass")
	public String postChangePass(@ModelAttribute("item") user item,BindingResult bindingResult ,Model model) {
		 
		String userName=paramService.getString("userName", "");
		String password=paramService.getString("password", "");
		String newPassword=paramService.getString("newPassword", "");
		String reterNewPassword=paramService.getString("reterNewPassword", "");
		Optional<user> us=userDao.findById(userName);
		
	
			if(password.equals(us.get().getPASSWORD())) {
				if(newPassword.equals(reterNewPassword)) {
					us.get().setPASSWORD(newPassword);
					userDao.save(us.get());
					 model.addAttribute("formSubmitted", true);
					 model.addAttribute("messages", "Đổi Mật Khẩu Thành Công");
				}else {
					model.addAttribute("message3", "Mật khẩu không trùng khớp");
				}
			}else if(newPassword.isEmpty()||newPassword.length()<6) {
				model.addAttribute("message2", "Mật khẩu không trống và lớn hơn 6 kí tự");
			}else {
				model.addAttribute("message1", "Mật khẩu cũ không đúng");
			}
		
		
//		 model.addAttribute("formSubmitted", true);
//		 model.addAttribute("message", "thông báo này nè");
		
		return "/views/changepassword";
	}
}
