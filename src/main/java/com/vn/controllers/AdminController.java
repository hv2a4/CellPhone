package com.vn.controllers;

import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vn.DAO.ColorDao;
import com.vn.DAO.invoiceDao;
import com.vn.DAO.orderDao;
import com.vn.DAO.order_itemDao;
import com.vn.DAO.userDao;
import com.vn.DAO.variantDao;
import com.vn.entity.color;
import com.vn.entity.phone;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	HttpServletRequest req;
	@Autowired
	ColorDao colorDao;
	@Autowired
	userDao UserDao;
	@Autowired
	invoiceDao invoiceDao;
	@Autowired
	orderDao orderDao;
	@Autowired
	variantDao variantDao;
	
	@GetMapping({"login","logout"})
	public String getlogin(Model model) {
		return "/Admin/production/login";
	}

	@GetMapping("")
	public String getMethodName(Model model) {
		 
        LocalDate now = LocalDate.now();

       
        int numDays = now.lengthOfMonth();

        int currentYear = now.getYear();
        int currentMonth = now.getMonthValue();
        List<Integer> daysList = new ArrayList<>();
        for (int i = 1; i <= numDays; i++) {
            daysList.add(i);
        }
        List<Double> getTotalPricePerDay = invoiceDao.getTotalPricePerDay(currentYear, currentMonth);
        int countUser = UserDao.countUser(false);
        long sumRevenue = invoiceDao.sumRevenue();
        long countOrder = orderDao.countOrder();
        model.addAttribute("sumRevenue",sumRevenue);
        model.addAttribute("getTotalPricePerDay",getTotalPricePerDay);
        model.addAttribute("countOrder",countOrder);
        model.addAttribute("countUser",countUser);
        model.addAttribute("daysList",daysList);
		String page = "tongquan.jsp";
		model.addAttribute("page", page);
		return "/Admin/production/homeadmin";
	}

	@GetMapping("user")
	public String getQLNguoiDung(Model model) {
		String page = "qlnguoidung.jsp";
		model.addAttribute("page", page);
		return "/Admin/production/homeadmin";
	}
	@GetMapping("profile")
	public String getProfile(Model model) {
		String page = "profile.jsp";
		model.addAttribute("page", page);
		return "/Admin/production/homeadmin";
	}

	@GetMapping("product")
	public String getQLSanPham(Model model) {
		String page = "product.jsp";
		model.addAttribute("page", page);
		return "/Admin/production/homeadmin";
	}

	@GetMapping("order")
	public String getQLDonHang(Model model) {
		String page = "order.jsp";
		model.addAttribute("page", page);
		return "/Admin/production/homeadmin";
	}

	@GetMapping("discount")
	public String getQLMaGiamGia(Model model) {
		String page = "discount.jsp";
		model.addAttribute("page", page);
		return "/Admin/production/homeadmin";
	}

	@GetMapping("color")
	public String getQLMau(Model model) {
		String page = "color.jsp";
		model.addAttribute("page", page);
//		List<color> list = colorDao.findAll();
//		for (color color : list) {
//			System.out.println(color.getNAME());
//		}
		return "/Admin/production/homeadmin";
		
	}

	@GetMapping("storage")
	public String getQLstorage(Model model) {
		String page = "storage.jsp";
		model.addAttribute("page", page);
		return "/Admin/production/homeadmin";
	}

	@GetMapping("rank")
	public String getQLrank(Model model) {
		String page = "rank.jsp";
		model.addAttribute("page", page);
		return "/Admin/production/homeadmin";
	}

	@GetMapping("system")
	public String getQLsystem(Model model) {
		String page = "system.jsp";
		model.addAttribute("page", page);
		return "/Admin/production/homeadmin";
	}

	@GetMapping("brand")
	public String getQLbrand(Model model) {
		String page = "brand.jsp";
		model.addAttribute("page", page);
		return "/Admin/production/homeadmin";
	}

	@GetMapping("battery_type")
	public String getQLbattery_type(Model model) {
		String page = "battery_type.jsp";
		model.addAttribute("page", page);
		return "/Admin/production/homeadmin";
	}

	@GetMapping("headphone_jack")
	public String getQLheadphone_jack(Model model) {
		String page = "headphone_jack.jsp";
		model.addAttribute("page", page);
		return "/Admin/production/homeadmin";
	}

	@GetMapping("charging_port")
	public String getQLcharging_port(Model model) {
		String page = "charging_port.jsp";
		model.addAttribute("page", page);
		return "/Admin/production/homeadmin";
	}

	@GetMapping("charging_technology")
	public String getQLcharging_technology(Model model) {
		String page = "charging_technology.jsp";
		model.addAttribute("page", page);
		return "/Admin/production/homeadmin";
	}
	
	@GetMapping("statistical")
	public String getStatistical(Model model) {
		  // Lấy ngày hiện tại
        LocalDate now = LocalDate.now();

        // Số ngày của tháng hiện tại
        int numDays = now.lengthOfMonth();
        int currentYear = now.getYear();
        int currentMonth = now.getMonthValue();
        // Tạo list chứa các số ngày
        List<Integer> daysList = new ArrayList<>();
        for (int i = 1; i <= numDays; i++) {
            daysList.add(i);
        }
        List<Integer> hoursList = new ArrayList<>();
        for (int i = 1; i <= 24; i++) {
			hoursList.add(i);
		}
        List<Integer> monthsList = new ArrayList<>();
        for (int i = 1; i <= 12; i++) {
            monthsList.add(i);
        }
        List<Double> getTotalPricePerDay = invoiceDao.getTotalPricePerDay(currentYear, currentMonth);
        int countUsers = UserDao.countUsers();
        long totalSumProducts = variantDao.totalSumProduct();
        long sumRevenue = invoiceDao.sumRevenue();
        long countOrder = orderDao.countOrder();
        model.addAttribute("getTotalPricePerDay",getTotalPricePerDay);
        model.addAttribute("totalSumProducts",totalSumProducts);
        model.addAttribute("sumRevenue",sumRevenue);
        model.addAttribute("countOrder",countOrder);
        model.addAttribute("countUsers",countUsers);
        model.addAttribute("monthsList", monthsList);
        model.addAttribute("daysList",daysList);
        model.addAttribute("hoursList",hoursList);
		String page = "statistical.jsp";
		model.addAttribute("page", page);
		return "/Admin/production/homeadmin";
	}
	
	@GetMapping("screen_resolution")
	public String getDoPhanGiai(Model model) {
		String page = "screen_resolution.jsp";
		model.addAttribute("page", page);
		return "/Admin/production/homeadmin";
	}
	
	@GetMapping("graphics_chip")
	public String getQLChipDoHoa(Model model) {
		String page = "graphics_chip.jsp";
		model.addAttribute("page", page);
		return "/Admin/production/homeadmin";
	}
	
	@GetMapping("status_order")
	public String getQLTTDonHang(Model model) {
		String page = "status_order.jsp";
		model.addAttribute("page", page);
		return "/Admin/production/homeadmin";
	}
	
	@GetMapping("payment_method")
	public String getQLPTThanhToan(Model model) {
		String page = "payment_method.jsp";
		model.addAttribute("page", page);
		return "/Admin/production/homeadmin";
	}

}
