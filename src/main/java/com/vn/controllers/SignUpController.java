package com.vn.controllers;

import java.util.List;
import java.util.Optional;

import javax.sound.midi.Soundbank;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.eclipse.tags.shaded.org.apache.bcel.generic.NEW;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.vn.DAO.rankDao;
import com.vn.DAO.userDao;
import com.vn.entity.ReCaptChaResponse;
import com.vn.entity.rank;
import com.vn.entity.user;
import com.vn.utils.ParamService;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.RequestBody;


@Controller
@RequestMapping("shop")
public class SignUpController {
	
	@Autowired
	ParamService paramService;
	@Autowired
	userDao userDao;
	@Autowired
	rankDao rankDao;
	
	@Autowired
	private RestTemplate restTemplate;
	
	@RequestMapping("register")
	public String getSignUp(Model model) {
		   user item = new user();
		   rank defaultRank = rankDao.findById(1).orElse(null); // Assuming rankDao.findById() returns an Optional
	        item.setRank(defaultRank);
	        model.addAttribute("item", item);
	        return "/views/signup";
	}
	
	@PostMapping("register")
	public String postSignUp(@Validated @ModelAttribute("item") user item,BindingResult bindingResult , Model model,@RequestParam(name="g-recaptcha-response") String captchaResponse) {
		 if (bindingResult.hasErrors()) {
	            return "/views/signup";
	        }
		String url="https://www.google.com/recaptcha/api/siteverify";
		String secret = "6Ldic9opAAAAAN2WSa-LXYrk6xvBItowDdT_R5Da";
	    String param = "?secret=" + secret + "&response=" + captchaResponse;
	    String renterPassWord=paramService.getString("renterPassWord", "");
		ReCaptChaResponse  reCaptChaResponse=restTemplate.exchange(url+param,HttpMethod.POST, null, ReCaptChaResponse.class).getBody();

		if(reCaptChaResponse.isSuccess()) {
			
			
			if (userDao.existsById(item.getUSERNAME())) {
	            rank defaultRank = rankDao.findById(1).orElse(null); // Assuming rankDao.findById() returns an Optional
	            item.setRank(defaultRank);
	            model.addAttribute("item", new user());
	            model.addAttribute("messages", "Tên tài khoản đã tồn tại");
	            return "/views/signup";
	        } else if (!item.getPASSWORD().equals(renterPassWord)) {
	            model.addAttribute("item", new user());
	            rank defaultRank = rankDao.findById(1).orElse(null); // Assuming rankDao.findById() returns an Optional
	            item.setRank(defaultRank);
	            model.addAttribute("message", "Mật khẩu không trùng khớp");
	            return "/views/signup";
	        } else {
	            item.setROLE(false);
	            item.setSTATUS(true);
	            item.setGENDER("KHAC");
	            userDao.save(item);
	            return "redirect:/shop/login";
	        }
			 
		}else {
			
			 rank defaultRank = rankDao.findById(1).orElse(null); // Assuming rankDao.findById() returns an Optional
		        item.setRank(defaultRank);
		        model.addAttribute("item", item);
			model.addAttribute("name", "Bạn chưa xác thực");
			return "/views/signup";
		}
		
		
	}
	
	
}
