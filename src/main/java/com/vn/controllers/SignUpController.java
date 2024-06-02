package com.vn.controllers;

import java.util.List;

import javax.sound.midi.Soundbank;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vn.DAO.rankDao;
import com.vn.DAO.userDao;
import com.vn.entity.rank;
import com.vn.entity.user;
import com.vn.utils.ParamService;

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
	
	@RequestMapping("register")
	public String getSignUp(Model model) {
		   user item = new user();
		   rank defaultRank = rankDao.findById(1).orElse(null); // Assuming rankDao.findById() returns an Optional
	        item.setRank(defaultRank);
	        model.addAttribute("item", item);
	        return "/views/signup";
	}
	
	@PostMapping("register")
	public String postSignUp(user item, Model model) {
		 item.setROLE(false);
		 item.setSTATUS(true);
		 userDao.save(item);
		return "redirect:/shop";
		
	}
	
	
}
