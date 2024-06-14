package com.vn.controllers;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vn.DAO.userDao;
import com.vn.entity.user;
import com.vn.utils.CookieService;
import com.vn.utils.ParamService;
import com.vn.utils.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/shop")
public class LoginController {
    @Autowired
	ParamService paramService;
    @Autowired 
	SessionService sessionService;
    @Autowired
    userDao userDao;
    @Autowired
	HttpServletRequest request;
    @Autowired
    HttpServletResponse response;
     @Autowired
     CookieService cookieService;
	@RequestMapping("login")
	public String homeLogin(Model model) {
		 String userCookie=cookieService.getValue("userCookie");
		 if(userCookie!=null) {
			 model.addAttribute("userCookie", userCookie);
		 }
		return "/views/login";
	}
	
	@PostMapping("login")
	public String postLogin(Model model) {
		 String userName=paramService.getString("userName", "");
		 String password=paramService.getString("password", "");
		 String rememberMeParam=paramService.getString("rememberMe", "");
		 boolean remember = rememberMeParam != null && rememberMeParam.equals("on");
		
		Optional<user> list=userDao.findById(userName);	
		
	   if(list.isPresent()) {
		   if(list.get().getPASSWORD().equals(password)) {
			   
			   // trạng thái là false, cột CLOCKDOWN_PERIOD khác null, nếu hết thời gian khóa thì tự động đăng nhập được
		        if (!list.get().getSTATUS()) {
		            Date currentDate = list.get().getCLOCKDOWN_PERIOD();
		            if (currentDate != null) {
		                if (currentDate.before(new Date())) {
		                    list.get().setSTATUS(true);
		                    list.get().setINCORRECT_PASSWORD(0);
		                    list.get().setCLOCKDOWN_PERIOD(null);
		                
		                    userDao.save(list.get());
		                }
		            }
		        }
		        
		        // Now, check the updated STATUS after potential unlocking
		         if (list.get().getSTATUS()) {
		            sessionService.set("list", list.get());
		             if(remember) {
		            	 cookieService.add("userCookie",userName,30,response);
		             }
		            if (list.get().getROLE()) {
		                list.get().setINCORRECT_PASSWORD(0);
		                userDao.save(list.get());
		                sessionService.set("list", list.get());
		                model.addAttribute("messagesCheckRole", "true");
		                return "/views/login";
		            } else {
		                list.get().setINCORRECT_PASSWORD(0);
		                userDao.save(list.get());
		                sessionService.set("list", list.get());
		                model.addAttribute("messagesCheck", "true");
		                return "/views/login";
		            }
		        } else {
		            model.addAttribute("messages", "true");   //not
		            return "/views/login";
		        }

		   }else {
			   list.get().setINCORRECT_PASSWORD(list.get().getINCORRECT_PASSWORD()+1);
			   userDao.save(list.get());
			   Calendar cal= Calendar.getInstance();
			   if(list.get().getINCORRECT_PASSWORD()>=5&&list.get().getROLE()==false) {   // set thời gian khóa trong bao lâu
				   list.get().setSTATUS(false);
				   cal.add(Calendar.MINUTE, 30);
				   list.get().setCLOCKDOWN_PERIOD(cal.getTime());
				   userDao.save(list.get());
				   model.addAttribute("messages", "true"); //not
				   return "/views/login";
			   }
			  
			   model.addAttribute("message", "true");
			   return "/views/login";
		   }
		  // 
	   }else {
		   model.addAttribute("message", "true");
		   return "/views/login";
	   }
		
		
//		user sessionUser = (user) sessionService.get("list");
//		System.out.println("Dữ liệu lấy từ session: "+sessionUser.getFULLNAME());
	//   return "redirect:/shop";
	}
	@RequestMapping("logout")
	public String logOut() {
		sessionService.remove("list");
		 return "redirect:/shop";
	}
	@GetMapping("/404")
	public String getError() {
		 return "/views/404notfound";
	}
}
