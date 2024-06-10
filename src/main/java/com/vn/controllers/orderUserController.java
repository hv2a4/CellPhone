package com.vn.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.vn.DAO.orderDao;
import com.vn.DAO.status_orderDao;
import com.vn.entity.order;
import com.vn.entity.status_order;
import com.vn.entity.user;
import com.vn.utils.ParamService;
import com.vn.utils.SessionService;
@Controller
@RequestMapping("/shop")
public class orderUserController {
     @Autowired
	  orderDao orderDao;
     @Autowired
     status_orderDao status_orderDao;
     @Autowired
     ParamService paramService;
     @Autowired
     SessionService sessionService;
	@RequestMapping("order")
	public String getOrder(Model model) {
	   
		String page = "order.jsp";
		model.addAttribute("page", page);
		return "index";
	}
	@PostMapping("deleteOrder/{id}")
	public String postDeleteOrder(Model model,@PathVariable("id") Integer id,@RequestParam("noteReason") String reason) {
		order ordes=orderDao.getById(id);
		status_order statusOrder =status_orderDao.getById(6);
		System.out.println(statusOrder.getSTATUS());
		System.out.println(ordes.getID());
		System.out.println(reason);
	    ordes.setStatus_order(statusOrder);
	    ordes.setREASON(reason);
	    orderDao.save(ordes);
		 return "redirect:/shop/order";
	}
	@PostMapping("returnItem/{id}")
	public String postReturnItem(Model model,@PathVariable("id") Integer id,@RequestParam("noteReason") String reason) {
		order ordes=orderDao.getById(id);
		status_order statusOrder =status_orderDao.getById(5);
		System.out.println(statusOrder.getSTATUS()+"  trạng thái");
		System.out.println(ordes.getID()+" mã");
		System.out.println(reason+" lý do");
	    
	   ordes.setStatus_order(statusOrder);
	   ordes.setREASON(reason);
	   orderDao.save(ordes); 
		 return "redirect:/shop/order";
	}
	
	@ModelAttribute("getAllOrders")
	public List<order> getListOrders(){
		user users=sessionService.get("list");
		List<order> orders=orderDao.findByUser(users);
		return orders;
	}
	
	
	
}
