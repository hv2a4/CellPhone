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

import com.vn.DAO.addressDao;
import com.vn.DAO.userDao;
import com.vn.entity.address;
import com.vn.entity.rank;
import com.vn.entity.user;
import com.vn.utils.ParamService;
import com.vn.utils.SessionService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestBody;



@Controller
@RequestMapping("/shop")
public class addressController {
   @Autowired
   ParamService paramService;
	@Autowired
	SessionService sessionService;
	@Autowired
	userDao userDao;
	@Autowired
	addressDao addressDao;
	@GetMapping("address")
	public String getAddress(Model model,address item) {
		user userSession=sessionService.get("list");
		
		Optional<user> defaultUser=userDao.findById(userSession.getUSERNAME());
		item.setUser(defaultUser.get());
		model.addAttribute("item",  item);
		String page = "address.jsp";
		model.addAttribute("page", page);
		
		return "index";
	}
	
//	@PostMapping("address")
//	public String postAddress(Model model) {
//	 rank defaultRank = rankDao.findById(1).orElse(null); // Assuming rankDao.findById() returns an Optional
//    item.setRank(defaultRank);
//    model.addAttribute("item", item);
//		String page = "address.jsp";
//		model.addAttribute("page", page);
//		return "index";
//	}
	@PostMapping("create")
	public String createAddress(Model model,address item) {
	    String noteAddress = paramService.getString("noteAddress", "");
	    String cityName = paramService.getString("cityName", "");
	    String districtName = paramService.getString("districtName", "");
	    String wardName = paramService.getString("wardName", "");
	    if(noteAddress.isEmpty()||cityName.isEmpty()||districtName.isEmpty()||wardName.isEmpty()) {
	         String page = "address.jsp";
	         model.addAttribute("errors", "Bạn Chưa Nhập");
	 	    model.addAttribute("page", page);
	 	   user userSession=sessionService.get("list");
			Optional<user> defaultUser=userDao.findById(userSession.getUSERNAME());
			item.setUser(defaultUser.get());
			model.addAttribute("item",  item);
			model.addAttribute("page", page);
			
			return "index";
	    } else {
	    	String addres=noteAddress+", "+wardName+", "+districtName+", "+cityName;
	        item.setADDRESS(addres);
	        addressDao.save(item);
		    String page = "address.jsp";
		    model.addAttribute("page", page);
		    return "redirect:/shop/address";
	    }
	    
	}
	
	@RequestMapping("/delete/{id}")
	public String deleteAddress(Model model,address item ,@PathVariable("id") Integer id) {
		addressDao.deleteById(id);
		 user userSession=sessionService.get("list");
			
			Optional<user> defaultUser=userDao.findById(userSession.getUSERNAME());
			item.setUser(defaultUser.get());
			model.addAttribute("item",  item);
			String page = "address.jsp";
			model.addAttribute("page", page);
			
			return "redirect:/shop/address";
	}
	@PostMapping("update/{id}")
	public String postUpdate(address item,Model model,@PathVariable("id") Integer id) {
		System.out.println(id);
		String noteAddress = paramService.getString("noteAddress", "");
	    String cityName = paramService.getString("cityName", "");
	    String districtName = paramService.getString("districtName", "");
	    String wardName = paramService.getString("wardName", "");
         String addres=noteAddress+", "+wardName+", "+districtName+", "+cityName;
        item.setADDRESS(addres);
        addressDao.save(item);
		return "redirect:/shop/address";
	}
	
	@RequestMapping("/edit/{id}")
	public String editRequest(@PathVariable("id") Integer id,address item,Model model) {
		
		address list=addressDao.findById(id).get();
        model.addAttribute("item", list);
		 String sub =  list.getADDRESS().substring(0,  list.getADDRESS().indexOf(',')).trim();
	      
	        model.addAttribute("sub", sub);
	        String page = "address.jsp";
			model.addAttribute("page", page);
			
			return "index";
	}
	@ModelAttribute("listAddress")
	public List<address> getAddresses(Model model,address item){
		model.addAttribute("item", item);
		List<address> listAddresses=addressDao.findAll();
		return listAddresses;
	}
}
