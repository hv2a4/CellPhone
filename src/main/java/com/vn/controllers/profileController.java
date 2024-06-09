package com.vn.controllers;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.vn.DAO.addressDao;
import com.vn.DAO.userDao;
import com.vn.entity.address;
import com.vn.entity.user;
import com.vn.utils.ParamService;
import com.vn.utils.SessionService;

@Controller
@RequestMapping("/shop")
public class profileController {
    @Autowired
	addressDao addressDao;
    @Autowired
    SessionService sessionService;
	@Autowired
	userDao userDao;
	@Autowired
	ParamService paramService;
	@RequestMapping("profile")
	public String getProfile(Model model,user item) {
		 model.addAttribute("item", item);
		
		String page = "profile.jsp";
		model.addAttribute("page", page);
		return "index";
	}
	
	@PostMapping("profile")
	public String postProfile(@Validated @ModelAttribute("item") user item,BindingResult bindingResult ,Model model,@RequestPart("photo_file") MultipartFile file) {
		 if (bindingResult.hasErrors()) {
		      
		        model.addAttribute("page", "profile.jsp");
		        return "index";
		    }
		String photo=paramService.save(file,"/images/");
		Optional<user> userS=userDao.findById(item.getUSERNAME());
		if(userS.isPresent()) {
			userS.get().setAVATAR(photo);
			userS.get().setFULLNAME(item.getFULLNAME());
			userS.get().setPHONE_NUMBER(item.getPHONE_NUMBER());
			userS.get().setGENDER(item.getGENDER());
			userS.get().setEMAIL(item.getEMAIL());
			
			userDao.save(userS.get());
		    sessionService.set("list", userS.get());
		}
		 return "redirect:/shop/profile";
	}
	
	 
}
