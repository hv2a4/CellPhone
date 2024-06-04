package com.vn.controllers;

import java.text.ParseException;

import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import com.vn.DAO.rankDao;

import com.vn.entity.rank;
import com.vn.entity.user;
import jakarta.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vn.DAO.ColorDao;

import com.vn.DAO.battery_typeDao;
import com.vn.DAO.brandDao;
import com.vn.DAO.categoryDao;
import com.vn.DAO.discount_codeDao;
import com.vn.DAO.graphics_chipDao;
import com.vn.DAO.headphone_jackDao;
import com.vn.DAO.payment_methodDao;
import com.vn.DAO.rankDao;
import com.vn.DAO.screen_resolutionDao;
import com.vn.DAO.status_invoiceDao;
import com.vn.DAO.status_orderDao;
import com.vn.DAO.charging_portDao;
import com.vn.DAO.storageDao;
import com.vn.DAO.systemDao;

import com.vn.DAO.variantDao;
import com.vn.DAO.wireless_charging_technologyDao;
import com.vn.entity.battery_type;
import com.vn.entity.brand;
import com.vn.entity.category;
import com.vn.entity.charging_port;
import com.vn.entity.color;
import com.vn.entity.discount_code;
import com.vn.entity.graphics_chip;
import com.vn.entity.headphone_jack;
import com.vn.entity.payment_method;
import com.vn.entity.status_invoice;
import com.vn.entity.rank;
import com.vn.entity.screen_resolution;
import com.vn.entity.status_order;
import com.vn.entity.storage;
import com.vn.entity.system;
import com.vn.entity.variant;
import com.vn.entity.wireless_charging_technology;
import com.vn.utils.ParamService;

import com.vn.DAO.invoiceDao;
import com.vn.DAO.orderDao;
import com.vn.DAO.order_itemDao;
import com.vn.DAO.userDao;
import com.vn.DAO.variantDao;
import com.vn.entity.color;
import com.vn.entity.phone;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	HttpServletRequest req;
	@Autowired
	ServletContext app;
	@Autowired
	ColorDao colorDao;
	@Autowired
	discount_codeDao discount_codeDao;
	@Autowired
	rankDao rankDao;
	@Autowired
	storageDao storageDao;
	@Autowired
	brandDao brandDao;
	@Autowired
	battery_typeDao battery_typeDao;
	@Autowired
	systemDao systemDao;
	@Autowired
	headphone_jackDao headphone_jackDao;
	@Autowired
	charging_portDao charging_portDao;
	@Autowired
	wireless_charging_technologyDao wireless_charging_technologyDao;
	@Autowired
	screen_resolutionDao screen_resolutionDao;
	@Autowired
	graphics_chipDao graphics_chipDao;
	@Autowired
	status_orderDao status_orderDao;
	@Autowired
	payment_methodDao payment_methodDao;
	@Autowired
	status_invoiceDao status_invoiceDao;
	@Autowired
	categoryDao categoryDao;
	@Autowired
	userDao UserDao;
	@Autowired
	invoiceDao invoiceDao;
	@Autowired
	orderDao orderDao;
	@Autowired
	variantDao variantDao;

	@ModelAttribute("list_rank")
	public List<rank> getListRank() {
		return rankDao.findAll();
	}

	@GetMapping({ "login", "logout" })
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
		model.addAttribute("sumRevenue", sumRevenue);
		model.addAttribute("getTotalPricePerDay", getTotalPricePerDay);
		model.addAttribute("countOrder", countOrder);
		model.addAttribute("countUser", countUser);
		model.addAttribute("daysList", daysList);
		String page = "tongquan.jsp";
		model.addAttribute("page", page);
		return "/Admin/production/homeadmin";
	}

	@GetMapping("profile")
	public String getProfile(Model model) {
		String page = "profile.jsp";
		model.addAttribute("page", page);
		return "/Admin/production/homeadmin";
	}

	@GetMapping("order")
	public String getQLDonHang(Model model) {
		String page = "order.jsp";
		model.addAttribute("page", page);
		return "/Admin/production/homeadmin";
	}

	@GetMapping("product")
	public String getQLSanPham(Model model) {
		String page = "product.jsp";
		model.addAttribute("page", page);
		return "/Admin/production/homeadmin";
	}

	@ModelAttribute("fillTableUser")
	public List<user> getList() {
		return UserDao.findAll();
	}

	@GetMapping("discount")
	public String getQLMaGiamGia(Model model) {
		String page = "discount.jsp";
		model.addAttribute("page", page);

		List<discount_code> list_discount_code = discount_codeDao.findAll();
		model.addAttribute("list_discount_code", list_discount_code);

		discount_code discount_code = new discount_code();
		model.addAttribute("discount_code", discount_code);
		
		discount_code discount_codeUpdate = new discount_code();
		model.addAttribute("discount_codeUpdate", discount_codeUpdate);

		return "/Admin/production/homeadmin";
	}

	@PostMapping("discount_code/create")
	public String createDiscount_code(@ModelAttribute("discount_code") discount_code discount_code) {
		discount_codeDao.save(discount_code);
		return "redirect:/admin/discount";
	}

	@PostMapping("discount_code/update")
	public String updateDiscount_code(@ModelAttribute("discount_codeUpdate") discount_code discount_codeUpdate) {
		discount_codeDao.save(discount_codeUpdate);
		return "redirect:/admin/discount";
	}

	@GetMapping("discount_code/delete")
	public String deleteDiscount_code(@Param("id") Integer id) {
		discount_code discount_code = discount_codeDao.getById(id);
		discount_codeDao.delete(discount_code);
		return "redirect:/admin/discount";
	}

	@GetMapping("ajax/getdiscount_code/{id}")
	@ResponseBody
	public Optional<discount_code> getdiscount_codeById(Model model, @PathVariable("id") Integer id) {
		Optional<discount_code> discount_codeUpdate = discount_codeDao.findById(id);
		model.addAttribute("discount_codeUpdate", discount_codeUpdate.orElseGet(null).getClass());
		return discount_codeUpdate;
	}

	@GetMapping("category")
	public String getQLcategory(Model model) {
		String page = "category.jsp";
		model.addAttribute("page", page);

		List<category> list_category = categoryDao.findAll();
		model.addAttribute("list_category", list_category);

		category category = new category();
		model.addAttribute("category", category);

		category categoryUpdate = new category();
		model.addAttribute("categoryUpdate", categoryUpdate);

		return "/Admin/production/homeadmin";
	}

	@PostMapping("category/create")
	public String postMethodName(@ModelAttribute("category") category category) {
		categoryDao.save(category);
		return "redirect:/admin/category";
	}

	@PostMapping("category/update")
	public String updateCategory(@ModelAttribute("category") category category) {
		categoryDao.save(category);
		return "redirect:/admin/category";
	}

	@GetMapping("category/delete")
	public String deletecategory(@Param("id") Integer id) {
		category category = categoryDao.getById(id);
		categoryDao.delete(category);
		return "redirect:/admin/category";
	}

	@GetMapping("ajax/getcategory/{id}")
	@ResponseBody
	public Optional<category> getcategoryById(Model model, @PathVariable("id") Integer id) {
		Optional<category> categoryUpdate = categoryDao.findById(id);
		model.addAttribute("categoryUpdate", categoryUpdate.orElseGet(null).getClass());
		return categoryUpdate;
	}

	@GetMapping("color")
	public String getQLColor(Model model) {
		String page = "color.jsp";
		model.addAttribute("page", page);

		List<color> list_color = colorDao.findAll();
		model.addAttribute("list_color", list_color);

		color color = new color();
		model.addAttribute("color", color);

		color colorUpdate = new color();
		model.addAttribute("colorUpdate", colorUpdate);

		return "/Admin/production/homeadmin";
	}

	@PostMapping("color/create")
	public String postMethodName(@ModelAttribute("color") color color) {
		colorDao.save(color);
		return "redirect:/admin/color";
	}

	@PostMapping("color/update")
	public String updatecolor(@ModelAttribute("colorUpdate") color color) {
		colorDao.save(color);
		return "redirect:/admin/color";
	}

	@GetMapping("color/delete")
	public String deletecolor(@Param("id") Integer id) {
		color color = colorDao.getById(id);
		colorDao.delete(color);
		return "redirect:/admin/color";
	}

	@GetMapping("ajax/getcolor/{id}")
	@ResponseBody
	public Optional<color> getColorById(Model model, @PathVariable("id") Integer id) {
		Optional<color> color = colorDao.findById(id);
		model.addAttribute("colorUpdate", color);
		return color;
	}

	@GetMapping("storage")
	public String getQLstorage(Model model) {
		String page = "storage.jsp";
		model.addAttribute("page", page);

		List<storage> list_storage = storageDao.findAll();
		model.addAttribute("list_storage", list_storage);

		storage storage = new storage();
		model.addAttribute("storage", storage);

		storage storageUpdate = new storage();
		model.addAttribute("storageUpdate", storageUpdate);

		return "/Admin/production/homeadmin";
	}

	@PostMapping("storage/create")
	public String postMethodName(@ModelAttribute("storage") storage storage) {
		storageDao.save(storage);
		return "redirect:/admin/storage";
	}

	@PostMapping("storage/update")
	public String updaetStorage(@ModelAttribute("storage") storage storage) {
		storageDao.save(storage);
		return "redirect:/admin/storage";
	}

	@GetMapping("storage/delete")
	public String deletestorage(@Param("id") Integer id) {
		storage storage = storageDao.getById(id);
		storageDao.delete(storage);
		return "redirect:/admin/storage";
	}

	@GetMapping("ajax/getstorage/{id}")
	@ResponseBody
	public Optional<storage> getstorageById(Model model, @PathVariable("id") Integer id) {
		Optional<storage> storageUpdate = storageDao.findById(id);
		model.addAttribute("storageUpdate", storageUpdate.orElseGet(null).getClass());
		return storageUpdate;
	}

	@GetMapping("brand")
	public String getQLbrand(Model model) {
		String page = "brand.jsp";
		model.addAttribute("page", page);

		List<brand> list_brand = brandDao.findAll();
		model.addAttribute("list_brand", list_brand);

		brand brand = new brand();
		model.addAttribute("brand", brand);

		brand brandUpdate = new brand();
		model.addAttribute("brandUpdate", brandUpdate);

		return "/Admin/production/homeadmin";
	}

	@PostMapping("brand/create")
	public String postMethodName(@ModelAttribute("brand") brand brand) {
		brandDao.save(brand);
		return "redirect:/admin/brand";
	}

	@PostMapping("brand/update")
	public String updateBrand(@ModelAttribute("brandUpdate") brand brand) {
		brandDao.save(brand);
		return "redirect:/admin/brand";
	}

	@GetMapping("ajax/getbrand/{id}")
	@ResponseBody
	public Optional<brand> getbrandById(Model model, @PathVariable("id") Integer id) {
		Optional<brand> brandUpdate = brandDao.findById(id);
		model.addAttribute("brandUpdate", brandUpdate.orElseGet(null).getClass());
		return brandUpdate;
	}

	@GetMapping("brand/delete")
	public String deletebrand(@Param("id") Integer id) {
		brand brand = brandDao.getById(id);
		brandDao.delete(brand);
		return "redirect:/admin/brand";
	}

	@GetMapping("battery_type")
	public String getQLbattery_type(Model model) {
		String page = "battery_type.jsp";
		model.addAttribute("page", page);

		List<battery_type> list_battery_type = battery_typeDao.findAll();
		model.addAttribute("list_battery_type", list_battery_type);

		battery_type battery_type = new battery_type();
		model.addAttribute("battery_type", battery_type);

		battery_type battery_typeUpdate = new battery_type();
		model.addAttribute("battery_typeUpdate", battery_typeUpdate);

		return "/Admin/production/homeadmin";
	}

	@PostMapping("battery_type/create")
	public String postMethodName(@ModelAttribute("battery_type") battery_type battery_type) {
		battery_typeDao.save(battery_type);
		return "redirect:/admin/battery_type";
	}

	@PostMapping("battery_type/update")
	public String updateBattery_type(@ModelAttribute("battery_type") battery_type battery_type) {
		battery_typeDao.save(battery_type);
		return "redirect:/admin/battery_type";
	}

	@GetMapping("battery_type/delete")
	public String deletebattery_type(@Param("id") Integer id) {
		battery_type battery_type = battery_typeDao.getById(id);
		battery_typeDao.delete(battery_type);
		return "redirect:/admin/battery_type";
	}

	@GetMapping("ajax/getbattery_type/{id}")
	@ResponseBody
	public Optional<battery_type> getbattery_typeById(Model model, @PathVariable("id") Integer id) {
		Optional<battery_type> battery_typeUpdate = battery_typeDao.findById(id);
		model.addAttribute("battery_typeUpdate", battery_typeUpdate.orElseGet(null).getClass());
		return battery_typeUpdate;
	}

	@GetMapping("system")
	public String getQLsystem(Model model) {
		String page = "system.jsp";
		model.addAttribute("page", page);

		List<system> list_system = systemDao.findAll();
		model.addAttribute("list_system", list_system);

		system system = new system();
		model.addAttribute("system", system);

		system systemUpdate = new system();
		model.addAttribute("systemUpdate", systemUpdate);

		return "/Admin/production/homeadmin";
	}

	@PostMapping("system/create")
	public String postMethodName(@ModelAttribute("system") system system) {
		systemDao.save(system);
		return "redirect:/admin/system";
	}

	@PostMapping("system/update")
	public String updateSystemm(@ModelAttribute("system") system system) {
		systemDao.save(system);
		return "redirect:/admin/system";
	}

	@GetMapping("system/delete")
	public String deletesystem(@Param("id") Integer id) {
		system system = systemDao.getById(id);
		systemDao.delete(system);
		return "redirect:/admin/system";
	}

	@GetMapping("ajax/getsystem/{id}")
	@ResponseBody
	public Optional<system> getsystemById(Model model, @PathVariable("id") Integer id) {
		Optional<system> systemUpdate = systemDao.findById(id);
		model.addAttribute("systemUpdate", systemUpdate.orElseGet(null).getClass());
		return systemUpdate;
	}

	@GetMapping("rank")
	public String getQLrank(Model model) {
		String page = "rank.jsp";
		model.addAttribute("page", page);

		List<rank> list_rank = rankDao.findAll();
		model.addAttribute("list_rank", list_rank);

		rank rank = new rank();
		model.addAttribute("rank", rank);

		rank rankUpdate = new rank();
		model.addAttribute("rankUpdate", rankUpdate);

		return "/Admin/production/homeadmin";
	}

	@PostMapping("rank/create")
	public String postMethodName(@ModelAttribute("rank") rank rank) {
		rankDao.save(rank);
		return "redirect:/admin/rank";
	}

	@PostMapping("rank/update")
	public String updateRank(@ModelAttribute("rank") rank rank) {
		rankDao.save(rank);
		return "redirect:/admin/rank";
	}

	@GetMapping("rank/delete")
	public String deleterank(@Param("id") Integer id) {
		rank rank = rankDao.getById(id);
		rankDao.delete(rank);
		return "redirect:/admin/rank";
	}

	@GetMapping("ajax/getrank/{id}")
	@ResponseBody
	public Optional<rank> getrankById(Model model, @PathVariable("id") Integer id) {
		Optional<rank> rankUpdate = rankDao.findById(id);
		model.addAttribute("rankUpdate", rankUpdate.orElseGet(null).getClass());
		return rankUpdate;
	}

	@GetMapping("headphone_jack")
	public String getQLheadphone_jack(Model model) {
		String page = "headphone_jack.jsp";
		model.addAttribute("page", page);

		List<headphone_jack> list_headphone_jack = headphone_jackDao.findAll();
		model.addAttribute("list_headphone_jack", list_headphone_jack);

		headphone_jack headphone_jack = new headphone_jack();
		model.addAttribute("headphone_jack", headphone_jack);

		headphone_jack headphone_jackUpdate = new headphone_jack();
		model.addAttribute("headphone_jackUpdate", headphone_jackUpdate);

		return "/Admin/production/homeadmin";
	}

	@PostMapping("headphone_jack/create")
	public String postMethodName(@ModelAttribute("headphone_jack") headphone_jack headphone_jack) {
		headphone_jackDao.save(headphone_jack);
		return "redirect:/admin/headphone_jack";
	}

	@PostMapping("headphone_jack/update")
	public String UpdateHeadphone_jack(@ModelAttribute("headphone_jack") headphone_jack headphone_jack) {
		headphone_jackDao.save(headphone_jack);
		return "redirect:/admin/headphone_jack";
	}

	@GetMapping("headphone_jack/delete")
	public String deleteheadphone_jack(@Param("id") Integer id) {
		headphone_jack headphone_jack = headphone_jackDao.getById(id);
		headphone_jackDao.delete(headphone_jack);
		return "redirect:/admin/headphone_jack";
	}

	@GetMapping("ajax/getheadphone_jack/{id}")
	@ResponseBody
	public Optional<headphone_jack> getheadphone_jackById(Model model, @PathVariable("id") Integer id) {
		Optional<headphone_jack> headphone_jackUpdate = headphone_jackDao.findById(id);
		model.addAttribute("headphone_jackUpdate", headphone_jackUpdate.orElseGet(null).getClass());
		return headphone_jackUpdate;
	}

	@GetMapping("charging_port")
	public String getQLcharging_port(Model model) {
		String page = "charging_port.jsp";
		model.addAttribute("page", page);

		List<charging_port> list_charging_port = charging_portDao.findAll();
		model.addAttribute("list_charging_port", list_charging_port);

		charging_port charging_port = new charging_port();
		model.addAttribute("charging_port", charging_port);

		charging_port charging_portUpdate = new charging_port();
		model.addAttribute("charging_portUpdate", charging_portUpdate);

		return "/Admin/production/homeadmin";
	}

	@PostMapping("charging_port/create")
	public String postMethodName(@ModelAttribute("charging_port") charging_port charging_port) {
		charging_portDao.save(charging_port);
		return "redirect:/admin/charging_port";
	}

	@PostMapping("charging_port/update")
	public String updateCharging_port(@ModelAttribute("charging_port") charging_port charging_port) {
		charging_portDao.save(charging_port);
		return "redirect:/admin/charging_port";
	}

	@GetMapping("charging_port/delete")
	public String deletecharging_port(@Param("id") Integer id) {
		charging_port charging_port = charging_portDao.getById(id);
		charging_portDao.delete(charging_port);
		return "redirect:/admin/charging_port";
	}

	@GetMapping("ajax/getcharging_port/{id}")
	@ResponseBody
	public Optional<charging_port> getcharging_portById(Model model, @PathVariable("id") Integer id) {
		Optional<charging_port> charging_portUpdate = charging_portDao.findById(id);
		model.addAttribute("charging_portUpdate", charging_portUpdate.orElseGet(null).getClass());
		return charging_portUpdate;
	}

	@GetMapping("wireless_charging_technology")
	public String getQLcharging_technology(Model model) {
		String page = "wireless_charging_technology.jsp";
		model.addAttribute("page", page);

		List<wireless_charging_technology> list_wireless_charging_technology = wireless_charging_technologyDao
				.findAll();
		model.addAttribute("list_wireless_charging_technology", list_wireless_charging_technology);

		wireless_charging_technology wireless_charging_technology = new wireless_charging_technology();
		model.addAttribute("wireless_charging_technology", wireless_charging_technology);

		wireless_charging_technology wireless_charging_technologyUpdate = new wireless_charging_technology();
		model.addAttribute("wireless_charging_technologyUpdate", wireless_charging_technologyUpdate);

		return "/Admin/production/homeadmin";
	}

	@PostMapping("wireless_charging_technology/create")
	public String postMethodName(
			@ModelAttribute("wireless_charging_technology") wireless_charging_technology wireless_charging_technology) {
		wireless_charging_technologyDao.save(wireless_charging_technology);
		return "redirect:/admin/wireless_charging_technology";
	}

	@PostMapping("wireless_charging_technology/update")
	public String updateƯireless_charging_technology(
			@ModelAttribute("wireless_charging_technologyUpdate") wireless_charging_technology wireless_charging_technologyUpdate) {
		wireless_charging_technologyDao.save(wireless_charging_technologyUpdate);
		return "redirect:/admin/wireless_charging_technology";
	}

	@GetMapping("wireless_charging_technology/delete")
	public String deletewireless_charging_technology(@Param("id") Integer id) {
		wireless_charging_technology wireless_charging_technology = wireless_charging_technologyDao.getById(id);
		wireless_charging_technologyDao.delete(wireless_charging_technology);
		return "redirect:/admin/wireless_charging_technology";
	}

	@GetMapping("ajax/getwireless_charging_technology/{id}")
	@ResponseBody
	public Optional<wireless_charging_technology> wireless_charging_technologyById(Model model,
			@PathVariable("id") Integer id) {
		Optional<wireless_charging_technology> wireless_charging_technologyUpdate = wireless_charging_technologyDao
				.findById(id);
		model.addAttribute("wireless_charging_technologyUpdate",
				wireless_charging_technologyUpdate.orElseGet(null).getClass());
		return wireless_charging_technologyUpdate;
	}

	@GetMapping("screen_resolution")
	public String getQLscreen_resolution(Model model) {
		String page = "screen_resolution.jsp";
		model.addAttribute("page", page);

		List<screen_resolution> list_screen_resolution = screen_resolutionDao.findAll();
		model.addAttribute("list_screen_resolution", list_screen_resolution);

		screen_resolution screen_resolution = new screen_resolution();
		model.addAttribute("screen_resolution", screen_resolution);

		screen_resolution screen_resolutionUpdate = new screen_resolution();
		model.addAttribute("screen_resolutionUpdate", screen_resolutionUpdate);

		return "/Admin/production/homeadmin";
	}

	@PostMapping("screen_resolution/create")
	public String postMethodName(@ModelAttribute("screen_resolution") screen_resolution screen_resolution) {
		screen_resolutionDao.save(screen_resolution);
		return "redirect:/admin/screen_resolution";
	}

	@PostMapping("screen_resolution/update")
	public String updateScreen_resolution(
			@ModelAttribute("screen_resolutionUpdate") screen_resolution screen_resolutionUpdate) {
		screen_resolutionDao.save(screen_resolutionUpdate);
		return "redirect:/admin/screen_resolution";
	}

	@GetMapping("screen_resolution/delete")
	public String deletescreen_resolution(@Param("id") Integer id) {
		screen_resolution screen_resolution = screen_resolutionDao.getById(id);
		screen_resolutionDao.delete(screen_resolution);
		return "redirect:/admin/screen_resolution";
	}

	@GetMapping("ajax/getscreen_resolution/{id}")
	@ResponseBody
	public Optional<screen_resolution> screen_resolutionById(Model model, @PathVariable("id") Integer id) {
		Optional<screen_resolution> screen_resolutionUpdate = screen_resolutionDao.findById(id);
		model.addAttribute("screen_resolutionUpdate", screen_resolutionUpdate.orElseGet(null).getClass());
		return screen_resolutionUpdate;
	}

	@GetMapping("graphics_chip")
	public String getQLgraphics_chip(Model model) {
		String page = "graphics_chip.jsp";
		model.addAttribute("page", page);

		List<graphics_chip> list_graphics_chip = graphics_chipDao.findAll();
		model.addAttribute("list_graphics_chip", list_graphics_chip);

		graphics_chip graphics_chip = new graphics_chip();
		model.addAttribute("graphics_chip", graphics_chip);

		graphics_chip graphics_chipUpdate = new graphics_chip();
		model.addAttribute("graphics_chipUpdate", graphics_chipUpdate);

		return "/Admin/production/homeadmin";
	}

	@PostMapping("graphics_chip/create")
	public String postMethodName(@ModelAttribute("graphics_chip") graphics_chip graphics_chip) {
		graphics_chipDao.save(graphics_chip);
		return "redirect:/admin/graphics_chip";
	}

	@PostMapping("graphics_chip/update")
	public String updateGraphics_chip(@ModelAttribute("graphics_chipUpdate") graphics_chip graphics_chipUpdate) {
		graphics_chipDao.save(graphics_chipUpdate);
		return "redirect:/admin/graphics_chip";
	}

	@GetMapping("graphics_chip/delete")
	public String deletegraphics_chip(@Param("id") Integer id) {
		graphics_chip graphics_chip = graphics_chipDao.getById(id);
		graphics_chipDao.delete(graphics_chip);
		return "redirect:/admin/graphics_chip";
	}

	@GetMapping("ajax/getgraphics_chip/{id}")
	@ResponseBody
	public Optional<graphics_chip> graphics_chipById(Model model, @PathVariable("id") Integer id) {
		Optional<graphics_chip> graphics_chipUpdate = graphics_chipDao.findById(id);
		model.addAttribute("graphics_chipUpdate", graphics_chipUpdate.orElseGet(null).getClass());
		return graphics_chipUpdate;
	}

	@GetMapping("status_order")
	public String getQLstatus_order(Model model) {
		String page = "status_order.jsp";
		model.addAttribute("page", page);

		List<status_order> list_status_order = status_orderDao.findAll();
		model.addAttribute("list_status_order", list_status_order);

		status_order status_order = new status_order();
		model.addAttribute("status_order", status_order);

		status_order status_orderUpdate = new status_order();
		model.addAttribute("status_orderUpdate", status_orderUpdate);

		return "/Admin/production/homeadmin";
	}

	@PostMapping("status_order/create")
	public String postMethodName(@ModelAttribute("status_order") status_order status_order) {
		status_orderDao.save(status_order);
		return "redirect:/admin/status_order";
	}

	@PostMapping("status_order/update")
	public String updateStatus_order(@ModelAttribute("status_orderUpdate") status_order status_orderUpdate) {
		status_orderDao.save(status_orderUpdate);
		return "redirect:/admin/status_order";
	}

	@GetMapping("status_order/delete")
	public String deletestatus_order(@Param("id") Integer id) {
		status_order status_order = status_orderDao.getById(id);
		status_orderDao.delete(status_order);
		return "redirect:/admin/status_order";
	}

	@GetMapping("ajax/getstatus_order/{id}")
	@ResponseBody
	public Optional<status_order> status_orderById(Model model, @PathVariable("id") Integer id) {
		Optional<status_order> status_orderUpdate = status_orderDao.findById(id);
		model.addAttribute("status_orderUpdate", status_orderUpdate.orElseGet(null).getClass());
		return status_orderUpdate;
	}

	@GetMapping("payment_method")
	public String getQLpayment_method(Model model) {
		String page = "payment_method.jsp";
		model.addAttribute("page", page);

		List<payment_method> list_payment_method = payment_methodDao.findAll();
		model.addAttribute("list_payment_method", list_payment_method);

		payment_method payment_method = new payment_method();
		model.addAttribute("payment_method", payment_method);

		payment_method payment_methodUpdate = new payment_method();
		model.addAttribute("payment_methodUpdate", payment_methodUpdate);

		return "/Admin/production/homeadmin";
	}

	@PostMapping("payment_method/create")
	public String postMethodName(@ModelAttribute("payment_method") payment_method payment_method) {
		payment_methodDao.save(payment_method);
		return "redirect:/admin/payment_method";
	}

	@PostMapping("payment_method/update")
	public String updatePayment_method(@ModelAttribute("payment_methodUpdate") payment_method payment_methodUpdate) {
		payment_methodDao.save(payment_methodUpdate);
		return "redirect:/admin/payment_method";
	}

	@GetMapping("payment_method/delete")
	public String deletepayment_method(@Param("id") Integer id) {
		payment_method payment_method = payment_methodDao.getById(id);
		payment_methodDao.delete(payment_method);
		return "redirect:/admin/payment_method";
	}

	@GetMapping("ajax/getpayment_method/{id}")
	@ResponseBody
	public Optional<payment_method> payment_methodById(Model model, @PathVariable("id") Integer id) {
		Optional<payment_method> payment_methodUpdate = payment_methodDao.findById(id);
		model.addAttribute("payment_methodUpdate", payment_methodUpdate.orElseGet(null).getClass());
		return payment_methodUpdate;
	}

	@GetMapping("status_invoice")
	public String getQLstatus_invoice(Model model) {
		String page = "status_invoice.jsp";
		model.addAttribute("page", page);

		List<status_invoice> list_status_invoice = status_invoiceDao.findAll();
		model.addAttribute("list_status_invoice", list_status_invoice);

		status_invoice status_invoice = new status_invoice();
		model.addAttribute("status_invoice", status_invoice);

		status_invoice status_invoiceUpdate = new status_invoice();
		model.addAttribute("status_invoiceUpdate", status_invoiceUpdate);

		return "/Admin/production/homeadmin";
	}

	@PostMapping("status_invoice/create")
	public String postMethodName(@ModelAttribute("status_invoice") status_invoice status_invoice) {
		status_invoiceDao.save(status_invoice);
		return "redirect:/admin/status_invoice";
	}

	@PostMapping("status_invoice/update")
	public String updateStatus_invoice(@ModelAttribute("status_invoiceUpdate") status_invoice status_invoiceUpdate) {
		status_invoiceDao.save(status_invoiceUpdate);
		return "redirect:/admin/status_invoice";
	}

	@GetMapping("status_invoice/delete")
	public String deletestatus_invoice(@Param("id") Integer id) {
		status_invoice status_invoice = status_invoiceDao.getById(id);
		status_invoiceDao.delete(status_invoice);
		return "redirect:/admin/status_invoice";
	}

	@GetMapping("ajax/getstatus_invoice/{id}")
	@ResponseBody
	public Optional<status_invoice> status_invoiceById(Model model, @PathVariable("id") Integer id) {
		Optional<status_invoice> status_invoiceUpdate = status_invoiceDao.findById(id);
		model.addAttribute("status_invoiceUpdate", status_invoiceUpdate.orElseGet(null).getClass());
		return status_invoiceUpdate;
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
		model.addAttribute("getTotalPricePerDay", getTotalPricePerDay);
		model.addAttribute("totalSumProducts", totalSumProducts);
		model.addAttribute("sumRevenue", sumRevenue);
		model.addAttribute("countOrder", countOrder);
		model.addAttribute("countUsers", countUsers);
		model.addAttribute("monthsList", monthsList);
		model.addAttribute("daysList", daysList);
		model.addAttribute("hoursList", hoursList);
		String page = "statistical.jsp";
		model.addAttribute("page", page);
		return "/Admin/production/homeadmin";
	}

	@ModelAttribute("fillRank")
	public Map<Integer, String> getCategory() {
		Map<Integer, String> map = new HashMap<>();
		List<rank> ranks = rankDao.findAll();
		for (rank r : ranks) {
			map.put(r.getID(), r.getNAME());
		}
		return map;
	}

	@ModelAttribute("fillRole")
	public Map<Boolean, String> getRole() {
		Map<Boolean, String> map = new HashMap<>();
		map.put(true, "Admin");
		map.put(false, "User");
		return map;
	}

	@ModelAttribute("gender")
	public Map<String, String> getGender() {
		Map<String, String> map = new HashMap<>();
		map.put("NAM", "Nam");
		map.put("NU", "Nữ");
		map.put("KHAC", "Khác");
		return map;
	}

	@PostMapping("create-admin")
	public String create(Model model, @ModelAttribute("userItem") user users,
			@RequestParam("photo_file") MultipartFile img) throws IOException {
		if (!img.isEmpty()) {
			String filename = img.getOriginalFilename();

			// Sử dụng getServletContext().getRealPath() để lấy đường dẫn thư mục đúng
			String uploadDir = req.getServletContext().getRealPath("/images-user/");
			File uploadFolder = new File(uploadDir);

			// Kiểm tra và tạo thư mục nếu nó không tồn tại
			if (!uploadFolder.exists()) {
				uploadFolder.mkdirs();
			}

			// Tạo file trong thư mục images
			File destFile = new File(uploadFolder, filename);

			// Lưu trữ file vào thư mục đã xác định
			img.transferTo(destFile);

			// Thiết lập các thuộc tính người dùng
			users.setAVATAR(filename);
			users.setSTATUS(true);
			users.setCREATE_AT(new Date());
			users.setUPDATE_AT(new Date());

			// Lưu người dùng vào cơ sở dữ liệu
			UserDao.save(users);
		}
		return "redirect:/admin/user";
	}

	@RequestMapping("user")
	public String getQLNguoiDung(Model model) {
		String page = "qlnguoidung.jsp";
		model.addAttribute("page", page);

		user userItem = new user();
		model.addAttribute("userItem", userItem);
		return "/Admin/production/homeadmin";
	}

	@GetMapping("authorize/{id}")
	public String getAuthorize(Model model, @PathVariable("id") String id) {
		user users;
		users = UserDao.findById(id).get();

		users.setROLE(true);
		users.setUPDATE_AT(new Date());
		UserDao.save(users);
		String page = "qlnguoidung.jsp";
		model.addAttribute("page", page);
		return "redirect:/admin/user";
	}

	@GetMapping("unlock/{id}")
	public String getUnlock(Model model, @PathVariable("id") String id) {
		user users = UserDao.findById(id).get();
		users.setSTATUS(true);
		users.setUPDATE_AT(new Date());
		UserDao.save(users);
		String page = "qlnguoidung.jsp";
		model.addAttribute("page", page);
		return "redirect:/admin/user";
	}

}
