package com.vn.controllers;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.vn.DAO.cartDao;
import com.vn.DAO.cart_itemDao;
import com.vn.DAO.userDao;
import com.vn.entity.cart;
import com.vn.entity.cart_item;
import com.vn.entity.user;
import com.vn.utils.SessionService;

@Controller
@RequestMapping("cartItem")
public class CartController {
	@Autowired
	cart_itemDao cart_itemdao;
	
	@Autowired
	cartDao cartdao;
	
	@Autowired
	userDao userdao;
	
	@Autowired
	SessionService sessionService;
	
	@RequestMapping("item")
	public String getShopCartItem(Model model) {
//		model.addAttribute("item", cartItem);
//		List<cart_item> items = cart_itemdao.findAll();
//		model.addAttribute("items", items);
//		String username = sessionService.get("list.USERNAME");
		Optional<user> users = userdao.findById("user14");
		List<cart_item> items = users.get().getCarts().get(0).getCart_items();
		model.addAttribute("items", items);
		String page = "cart.jsp";
		model.addAttribute("page", page);
		return "index";
	}
	
	@RequestMapping("create")
	public String create(Model model,cart_item cartitem)
			throws IllegalStateException, IOException {
		cart_itemdao.save(cartitem);
		String page = "cart.jsp";
		model.addAttribute("page", page);
		return "redirect:/cartItem/item";
	}
	
//	@RequestMapping("create")
//	public String create(cart_item cartitem) {
//		cart_itemdao.save(cartitem);
//		return "redirect:/cartItem/item";
//	}

	// Cập nhật chưa xong nha để bố m code
//	@RequestMapping("update")
//	public String update(Model model, cart_item cartitem) {
////		System.out.println(order.getId() + "-|-" + order.getAccount().getUsername());
////		cart_itemdao.save(cartitem);
////		String page = "cart.jsp";
////		model.addAttribute("page", page);
////		return "redirect:/order/edit/" + order.getId();
//	}
	
	@RequestMapping("delete/{id}")
	public String delete(Model model, @PathVariable("id") Integer id) {
		cart_itemdao.deleteById(id);
		String page = "cart.jsp";
		model.addAttribute("page", page);
		return "redirect:/cartItem/item";
	}
}
