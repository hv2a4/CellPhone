package com.vn.controllers;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.aspectj.apache.bcel.generic.RET;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vn.DAO.ColorDao;
import com.vn.DAO.battery_typeDao;
import com.vn.DAO.brandDao;
import com.vn.DAO.categoryDao;
import com.vn.DAO.charging_portDao;
import com.vn.DAO.discount_codeDao;
import com.vn.DAO.discount_productDao;
import com.vn.DAO.graphics_chipDao;
import com.vn.DAO.headphone_jackDao;
import com.vn.DAO.imageDao;
import com.vn.DAO.invoiceDao;
import com.vn.DAO.orderDao;
import com.vn.DAO.payment_methodDao;
import com.vn.DAO.phoneDao;
import com.vn.DAO.rankDao;
import com.vn.DAO.screen_resolutionDao;
import com.vn.DAO.status_invoiceDao;
import com.vn.DAO.status_orderDao;
import com.vn.DAO.storageDao;
import com.vn.DAO.systemDao;
import com.vn.DAO.userDao;
import com.vn.DAO.variantDao;
import com.vn.DAO.wireless_charging_technologyDao;
import com.vn.entity.battery_type;
import com.vn.entity.brand;
import com.vn.entity.category;
import com.vn.entity.charging_port;
import com.vn.entity.color;
import com.vn.entity.discount_code;
import com.vn.entity.discount_product;
import com.vn.entity.graphics_chip;
import com.vn.entity.headphone_jack;
import com.vn.entity.image;
import com.vn.entity.invoice;
import com.vn.entity.order;
import com.vn.entity.order_item;
import com.vn.entity.payment_method;
import com.vn.entity.phone;
import com.vn.entity.rank;
import com.vn.entity.screen_resolution;
import com.vn.entity.status_invoice;
import com.vn.entity.status_order;
import com.vn.entity.storage;
import com.vn.entity.system;
import com.vn.entity.user;
import com.vn.entity.variant;
import com.vn.entity.wireless_charging_technology;
import com.vn.utils.ParamService;
import com.vn.utils.SessionService;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;

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
	@Autowired
	phoneDao phoneDao;
	@Autowired
	orderDao orderDaos;
	@Autowired
	SessionService sessionService;
	@Autowired
	imageDao imageDao;
	@Autowired
	ParamService service;
	@Autowired
	discount_productDao discount_productDao;
	LocalDate now = LocalDate.now();
	int numDays = now.lengthOfMonth();
	int currentYear = now.getYear();
	int currentMonth = now.getMonthValue();
	int currentDay = now.getDayOfMonth();

	@ModelAttribute("list_rank")
	public List<rank> getListRank() {
		return rankDao.findAll();
	}

	@ModelAttribute("list_brand")
	public Map<Integer, String> getBarnd() {
		Map<Integer, String> map = new HashMap<Integer, String>();

		List<brand> listBarnd = brandDao.findAll();
		for (brand brands : listBarnd) {
			map.put(brands.getID(), brands.getNAME());
		}
		return map;
	}

	@ModelAttribute("list_headphone_jack")
	public Map<Integer, String> getList_headphone_jack() {

		Map<Integer, String> map = new HashMap<Integer, String>();

		List<headphone_jack> listBattery = headphone_jackDao.findAll();
		for (headphone_jack battery_type : listBattery) {
			map.put(battery_type.getID(), battery_type.getNAME());
		}
		return map;
	}

	@ModelAttribute("list_battery_type")
	public Map<Integer, String> getList_battery_type() {
		Map<Integer, String> map = new HashMap<Integer, String>();

		List<battery_type> listBattery = battery_typeDao.findAll();
		for (battery_type battery_type : listBattery) {
			map.put(battery_type.getID(), battery_type.getNAME());
		}
		return map;
	}

	@ModelAttribute("list_screen_resolution")
	public Map<Integer, String> getList_screen_resolution() {
		Map<Integer, String> map = new HashMap<Integer, String>();

		List<screen_resolution> listBattery = screen_resolutionDao.findAll();
		for (screen_resolution screen_resolution : listBattery) {
			map.put(screen_resolution.getID(), screen_resolution.getNAME());
		}
		return map;
	}

	@ModelAttribute("list_graphics_chip")
	public Map<Integer, String> getList_graphics_chip() {
		Map<Integer, String> map = new HashMap<Integer, String>();

		List<graphics_chip> listBattery = graphics_chipDao.findAll();
		for (graphics_chip screen_resolution : listBattery) {
			map.put(screen_resolution.getID(), screen_resolution.getNAME());
		}
		return map;
	}

	@ModelAttribute("list_wireless_charging_technology")
	public List<wireless_charging_technology> getList_wireless_charging_technology() {
		return wireless_charging_technologyDao.findAll();
	}

	@GetMapping("login")
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
	public String getProfile(Model model, user item) {
		model.addAttribute("item", item);

		String page = "profile.jsp";
		model.addAttribute("page", page);
		return "/Admin/production/homeadmin";
	}

	@PostMapping("profile")
	public String postProfile(@Validated @ModelAttribute("item") user item, BindingResult bindingResult, Model model,
			@RequestPart("photo_file") MultipartFile file) {
		if (bindingResult.hasErrors()) {
			System.out.println("hello");
			String page = "profile.jsp";
			model.addAttribute("page", page);
			return "/Admin/production/homeadmin";
		}
		String photo = service.save(file, "/images/");

		Optional<user> userS = userDao.findById(item.getUSERNAME());

		userS.get().setAVATAR(photo);
		userS.get().setFULLNAME(item.getFULLNAME());
		userS.get().setPHONE_NUMBER(item.getPHONE_NUMBER());
		userS.get().setGENDER(item.getGENDER());
		userS.get().setEMAIL(item.getEMAIL());

		userDao.save(userS.get());
		sessionService.set("list", userS.get());
		model.addAttribute("profileAdminSuccess", "true");

		model.addAttribute("item", item);

		String page = "profile.jsp";
		model.addAttribute("page", page);
		return "/Admin/production/homeadmin";
	}

	@RequestMapping("logout")
	public String logOut() {
		sessionService.remove("list");
		return "redirect:/shop/login";
	}

	@PostMapping("/phone/create")
	public ResponseEntity<Map<String, String>> createPhone(@Validated @ModelAttribute("phone") phone phone,
			BindingResult bindingResult, @RequestParam("anh") List<MultipartFile> images, HttpServletRequest req) {

		Map<String, String> response = new HashMap<>();
		if (bindingResult.hasErrors()) {
			// Trả về lỗi xác thực
			bindingResult.getFieldErrors().forEach(error -> response.put(error.getField(), error.getDefaultMessage()));
			return ResponseEntity.badRequest().body(response);
		}

		try {
			// Khởi tạo danh sách hình ảnh nếu chưa có
			if (phone.getImages() == null) {
				phone.setImages(new ArrayList<>());
			}

			// Xử lý upload ảnh
			if (!images.isEmpty()) {
				// Lưu trữ ảnh đầu tiên
				MultipartFile firstImage = images.get(0);
				String firstImageUrl = saveImageToDisk(firstImage, req);
				phone.setIMAGE(firstImageUrl);

				// Lưu trữ 4 ảnh còn lại
				for (int i = 1; i < Math.min(images.size(), 5); i++) {
					MultipartFile imageFile = images.get(i);
					if (imageFile.isEmpty()) {
						continue;
					}
					String imageUrl = saveImageToDisk(imageFile, req);
					image image = new image();
					image.setIMAGE(imageUrl);
					image.setPhone(phone);
					phone.getImages().add(image);
				}
			}

			phone.setCREATE_AT(new Date());
			phone.setUPDATE_AT(new Date());
			phone.setIS_DELETE(false);
			phoneDao.save(phone);
		} catch (IOException e) {
			e.printStackTrace();
			response.put("status", "error");
			response.put("message", "Failed to save image to disk: " + e.getMessage());
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "error");
			response.put("message", e.getMessage());
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}

		response.put("status", "success");
		return ResponseEntity.ok(response);
	}

	private String saveImageToDisk(MultipartFile image, HttpServletRequest req) throws IOException {
		String filename = image.getOriginalFilename();
		File uploadFolder = new File(req.getServletContext().getRealPath("/images/"));
		if (!uploadFolder.exists()) {
			if (!uploadFolder.mkdirs()) {
				throw new IOException("Failed to create directory: " + uploadFolder.getAbsolutePath());
			}
		}
		File destFile = new File(uploadFolder, filename); // Tạo đối tượng File với đường dẫn và tên tệp tin đích
		try {
			image.transferTo(destFile); // Chuyển tệp tin vào đích
		} catch (IOException e) {
			throw new IOException("Failed to transfer file to: " + destFile.getAbsolutePath(), e);
		}
		return filename; // Trả về tên tệp tin đã lưu
	}

	@PostMapping("/phone/update")
	@ResponseBody
	public ResponseEntity<Map<String, String>> updatePhone(@Validated @ModelAttribute("phoneUpdate") phone phoneUpdate,
			BindingResult bindingResult, @RequestParam("anhUpdate") List<MultipartFile> images,
			HttpServletRequest req) {
		phoneUpdate.setUPDATE_AT(new Date());
		Map<String, String> response = new HashMap<>();
		if (bindingResult.hasErrors()) {
			// Collect validation errors
			bindingResult.getFieldErrors().forEach(error -> response.put(error.getField(), error.getDefaultMessage()));
			return ResponseEntity.badRequest().body(response);
		}

		try {
			// Clear existing images if any
			if (phoneUpdate.getImages() == null) {
				phoneUpdate.setImages(new ArrayList<>());
			} else {
				phoneUpdate.getImages().clear();
			}

			// Process and save new images
			List<image> newImages = new ArrayList<>();
			for (int i = 0; i < Math.min(images.size(), 5); i++) {
				MultipartFile imageFile = images.get(i);
				if (!imageFile.isEmpty()) {
					String imageUrl = saveImageToDisk(imageFile, req);
					image image = new image();
					image.setIMAGE(imageUrl);
					image.setPhone(phoneUpdate);
					newImages.add(image);
				}
			}

			// Update phone entity with new images
			phoneUpdate.getImages().addAll(newImages);
			// Save the phone entity with updated images
			phoneDao.save(phoneUpdate);

			response.put("status", "success");
			return ResponseEntity.ok(response);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "error");
			response.put("message", e.getMessage());
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
	}

	@PostMapping("variant/update")
	public ResponseEntity<Map<String, String>> updateVariant(
			@Validated @ModelAttribute("ObjectVariant") variant variant, BindingResult bindingResult) {
		Map<String, String> response = new HashMap<>();

		if (bindingResult.hasErrors()) {
			// Nếu có lỗi xảy ra trong quá trình binding
			bindingResult.getFieldErrors().forEach(error -> response.put(error.getField(), error.getDefaultMessage()));
			return ResponseEntity.badRequest().body(response);
		}

		try {
			// Lưu biến thể vào cơ sở dữ liệu
			variantDao.save(variant);

			// Trả về thông báo thành công
			response.put("status", "success");
			return ResponseEntity.ok(response);
		} catch (Exception e) {
			// Xử lý các ngoại lệ xảy ra
			e.printStackTrace();
			response.put("status", "error");
			response.put("message", "Có lỗi xảy ra khi cập nhật biến thể: " + e.getMessage());
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
	}

	@GetMapping("phone/delete")
	public String deletePhone(@Param("id") Integer id, RedirectAttributes redirectAttributes) {
		try {
			phone phone = phoneDao.getById(id);
			phoneDao.delete(phone);
			redirectAttributes.addFlashAttribute("message", "Hoàn tất");
			redirectAttributes.addFlashAttribute("messageType", "success");
		} catch (DataIntegrityViolationException e) {
			redirectAttributes.addFlashAttribute("message", "Không thể xóa. Bản ghi đang được sử dụng.");
			redirectAttributes.addFlashAttribute("messageType", "error");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message", "Có lỗi xảy ra khi xóa bản ghi.");
			redirectAttributes.addFlashAttribute("messageType", "error");
		}
		return "redirect:/admin/product";
	}

	@GetMapping("ajax/phone/{id}")
	@ResponseBody
	public Optional<phone> getphone(Model model, @PathVariable("id") Integer id) {
		Optional<phone> phoneUpdate = phoneDao.findById(id);
		model.addAttribute("phoneUpdate", phoneUpdate.orElseGet(null).getClass());
		return phoneUpdate;
	}

	@GetMapping("product")
	public String getQLSanPham(Model model, @ModelAttribute("phone") phone phone,
			@ModelAttribute("phoneUpdate") phone phoneUpdate, @ModelAttribute("ObjectVariant") variant variant) {
		String page = "product.jsp";
		model.addAttribute("page", page);

		return "/Admin/production/homeadmin";
	}

	@ModelAttribute("list_phone")
	List<phone> list_phone() {
		return phoneDao.OrderByCreateAtDesc();
	}

	@ModelAttribute("fillTableUser")
	public List<user> getList() {
		return UserDao.OrderByUpdateAtDesc();
	}

	@GetMapping("discount")
	public String getQLMaGiamGia(Model model, @ModelAttribute("discount_code") discount_code discount_code,
			@ModelAttribute("discount_codeUpdate") discount_code discount_codeUpdate,
			@RequestParam(value = "dirs") Optional<String> dirs, @RequestParam(name = "sizes") Optional<Integer> sizes,
			@RequestParam(name = "pages", defaultValue = "1") Optional<Integer> pages) {

		Pageable pageable = PageRequest.of(pages.orElse(1) - 1, sizes.orElse(12));
		Page<discount_code> pageDiscountCode = discount_codeDao.findAllSX(pageable);

		String page = "discount.jsp";
		model.addAttribute("page", page);
		List<discount_code> list_discount_code = pageDiscountCode.getContent();
		model.addAttribute("list_discount_code", list_discount_code);
		model.addAttribute("pageDiscountCode", pageDiscountCode);

		return "/Admin/production/homeadmin";
	}

	@PostMapping("/discount_code/create")
	public ResponseEntity<Map<String, String>> createDiscountCode(
			@Validated @ModelAttribute("discount_code") discount_code discount_code, BindingResult bindingResult,
			HttpServletRequest req) {

		Map<String, String> response = new HashMap<>();
		if (bindingResult.hasErrors()) {
			// Trả về lỗi xác thực
			bindingResult.getFieldErrors().forEach(error -> response.put(error.getField(), error.getDefaultMessage()));
			return ResponseEntity.badRequest().body(response);
		}
		try {
			List<discount_code> discount_codes = discount_codeDao.findAll();
			for (discount_code item : discount_codes) {
				if (item.getCODE().equalsIgnoreCase(discount_code.getCODE())) {
					response.put("status", "error");
					return ResponseEntity.ok(response);
				}
			}
			discount_codeDao.save(discount_code);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "error");
			response.put("message", e.getMessage());
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
		response.put("status", "success");
		return ResponseEntity.ok(response);
	}

	@PostMapping("/discount_code/update")
	public ResponseEntity<Map<String, String>> updateDiscountCode(
			@Validated @ModelAttribute("discount_code") discount_code discount_code, BindingResult bindingResult) {

		Map<String, String> response = new HashMap<>();
		if (bindingResult.hasErrors()) {
			// Trả về lỗi xác thực
			bindingResult.getFieldErrors().forEach(error -> response.put(error.getField(), error.getDefaultMessage()));
			return ResponseEntity.badRequest().body(response);
		}
		try {
			discount_codeDao.save(discount_code);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "error");
			response.put("message", e.getMessage());
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
		response.put("status", "success");
		return ResponseEntity.ok(response);
	}

	@GetMapping("discount_code/delete")
	public String deleteDiscount_code(Model model, @Param("id") Integer id) {
		try {
			discount_code discount_code = discount_codeDao.getById(id);
			discount_codeDao.delete(discount_code);
			model.addAttribute("message", "Đã xóa");
		} catch (Exception e) {
			model.addAttribute("message", "Không thể xóa");
		}

		String page = "discount.jsp";
		model.addAttribute("page", page);

		List<discount_code> list_discount_code = discount_codeDao.findAll();
		model.addAttribute("list_discount_code", list_discount_code);

		return "/Admin/production/homeadmin";
		// return "redirect:/admin/discount";
	}

	@GetMapping("ajax/getdiscount_code/{id}")
	@ResponseBody
	public Optional<discount_code> getdiscount_codeById(Model model, @PathVariable("id") Integer id) {
		Optional<discount_code> discount_codeUpdate = discount_codeDao.findById(id);
		model.addAttribute("discount_codeUpdate", discount_codeUpdate.orElseGet(null).getClass());
		return discount_codeUpdate;
	}

	@GetMapping("category")
	public String getQLcategory(Model model, @ModelAttribute("category") category category) {
		String page = "category.jsp";
		model.addAttribute("page", page);

		category categoryUpdate = new category();
		model.addAttribute("categoryUpdate", categoryUpdate);

		return "/Admin/production/homeadmin";
	}

	@ModelAttribute("list_category")
	public List<category> getCategorys() {
		return categoryDao.findAll();

	}

	@PostMapping("category/create")
	public String postMethodName(Model model, @Validated @ModelAttribute("category") category category,
			BindingResult result) {
		model.addAttribute("page", "category.jsp");
		model.addAttribute("list_category", getCategorys());
		model.addAttribute("category", category);
		String page = "category.jsp";
		for (category item : getCategorys()) {
			if (item.getNAME().equalsIgnoreCase(category.getNAME())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		categoryDao.save(category);
		model.addAttribute("message", "Hoàn tất");
		return "/Admin/production/homeadmin";

	}

	@PostMapping("category/update")
	public String updateCategory(Model model, @ModelAttribute("category") category category) {
		model.addAttribute("page", "category.jsp");
		model.addAttribute("list_category", getCategorys());
		model.addAttribute("category", category);
		String page = "category.jsp";
		for (category item : getCategorys()) {
			if (item.getNAME().equalsIgnoreCase(category.getNAME())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		categoryDao.save(category);
		model.addAttribute("message", "Hoàn tất");
		return "/Admin/production/homeadmin";
	}

	@GetMapping("category/delete/{id}")
	public String deletecategory(Model model, @PathVariable("id") Integer id) {
		model.addAttribute("page", "category.jsp");

		try {
			category category = categoryDao.findById(id).get();
			categoryDao.delete(category);
			model.addAttribute("message", "Đã xóa");
		} catch (Exception e) {
			model.addAttribute("message", "Không thể xóa");
		}
		return "/Admin/production/homeadmin";
	}

	// nhận hàng
	@GetMapping("returns/{id}")
	@ResponseBody
	public boolean getReturns(Model model, @PathVariable("id") Integer id) {

		// Tìm đối tượng order theo ID
		order orders = orderDaos.findById(id).orElseThrow(() -> new RuntimeException("Order not found"));
		// Tìm đối tượng status_order mới có ID là 6 (Trả hàng)
		status_order returnStatus = status_orderDao.findById(6)
				.orElseThrow(() -> new RuntimeException("Status not found"));
		if (orders.getStatus_order().getID() == 5) {
			// Cập nhật trạng thái trả hàng cho đối tượng order
			orders.setStatus_order(returnStatus);
			orders.setUPDATE_AT(new Date());
			orderDaos.save(orders);
			// Cập nhật số lượng cho từng sản phẩm trong đơn hàng
			List<order_item> listOrder_Item = orders.getOrder_items();
			for (order_item order_item : listOrder_Item) {
				variant variants = order_item.getVariant();
				variants.setQUANTITY(variants.getQUANTITY() + order_item.getQUANTITY());
				variantDao.save(variants);
			}
			return true;
		}
		return false;
	}

	// xác nhận trả hàng
	@GetMapping("xacNhanTraHang/{id}")
	@ResponseBody
	public boolean xacNhanTraHang(Model model, @PathVariable("id") Integer id) {
		// Tìm đối tượng order theo ID
		order orders = orderDaos.findById(id).orElseThrow(() -> new RuntimeException("Order not found"));
		// Tìm đối tượng status_order mới có ID là 5
		status_order returnStatus = status_orderDao.findById(5)
				.orElseThrow(() -> new RuntimeException("Status not found"));
		if (orders.getStatus_order().getID() == 7) {
			// Cập nhật trạng thái trả hàng cho đối tượng order
			orders.setStatus_order(returnStatus);
			orders.setUPDATE_AT(new Date());
			orderDaos.save(orders);
			return true;
		}
		return false;
	}

	@GetMapping("confirmation/{id}")
	@ResponseBody
	public boolean getConfirmation(Model model, @PathVariable("id") Integer id) {
		order orders = orderDaos.findById(id).orElseThrow(() -> new RuntimeException("Order not found"));
		status_order returnStatus = status_orderDao.findById(3)
				.orElseThrow(() -> new RuntimeException("Status not found"));
		if (orders.getStatus_order().getID() == 2) {
			orders.setStatus_order(returnStatus);
			orders.setUPDATE_AT(new Date());
			orderDaos.save(orders);
			return true;
		}
		return false;
	}

	@GetMapping("cancel/{id}")
	@ResponseBody
	public boolean cancel(Model model, @PathVariable("id") Integer id) {
		order orders = orderDaos.findById(id).orElseThrow(() -> new RuntimeException("Order not found"));
		status_order statusOrder = status_orderDao.findById(6)
				.orElseThrow(() -> new RuntimeException("Status not found"));
		if (orders.getStatus_order().getID() == 4) {
			orders.setStatus_order(statusOrder);
			orders.setUPDATE_AT(new Date());
			orderDaos.save(orders);
			return true;
		}
		return false;
	}

	@GetMapping("delivery/{id}")
	@ResponseBody
	public boolean getDelivery(@PathVariable("id") Integer id) {
		order orders = orderDaos.findById(id).orElseThrow(() -> new RuntimeException("Order not found"));
		status_order statusOrder = status_orderDao.findById(4)
				.orElseThrow(() -> new RuntimeException("Status not found"));
		if (orders.getStatus_order().getID() == 3) {
			orders.setStatus_order(statusOrder);
			orders.setUPDATE_AT(new Date());
			orderDaos.save(orders);
			return true;
		}
		return false;
	}

	@GetMapping("completed/{id}")
	@ResponseBody
	public boolean getCompleted(@PathVariable("id") Integer id) {
		order orders = orderDaos.findById(id).orElseThrow(() -> new RuntimeException("Order not found"));
		status_order statusOrder = status_orderDao.findById(1)
				.orElseThrow(() -> new RuntimeException("Status not found"));
		if (orders.getStatus_order().getID() == 4) {
			orders.setStatus_order(statusOrder);
			orders.setUPDATE_AT(new Date());
			status_invoice s = status_invoiceDao.findById(1).get();
			invoice invoice = orders.getInvoices().get(0);
			invoice.setStatus_invoice(s);
			invoiceDao.save(invoice);
			orderDaos.save(orders);
			return true;
		}
		return false;
	}

	@ModelAttribute("confirmations")
	List<order> getConfigmationOrder() {
		return orderDaos.findAllSX();
	}

	@ModelAttribute("fillOrder")
	public List<order> getListOrder() {
		List<order> a = orderDao.findAllSX();
		return orderDao.findAllSX();
	}

	@GetMapping("order")
	public String getQLDonHang(Model model, @RequestParam(name = "pages", defaultValue = "1") Optional<Integer> pages) {
		Pageable pageable = PageRequest.of(pages.orElse(1) - 1, 10);
		Page<order> pageOrder = orderDao.findAllSX(pageable);
		String page = "order.jsp";
		model.addAttribute("page", page);
		model.addAttribute("pageOrder", pageOrder);
		return "/Admin/production/homeadmin";
	}

	@GetMapping("ajax/getcategory/{id}")
	@ResponseBody
	public Optional<category> getcategoryById(Model model, @PathVariable("id") Integer id) {
		Optional<category> categoryUpdate = categoryDao.findById(id);
		model.addAttribute("categoryUpdate", categoryUpdate.orElseGet(null).getClass());
		return categoryUpdate;
	}

	@GetMapping("color")
	public String getQLColor(Model model, @RequestParam(name = "pages", defaultValue = "1") Optional<Integer> pages) {
		String page = "color.jsp";
		model.addAttribute("page", page);

		Pageable pageable = PageRequest.of(pages.orElse(1) - 1, 12);
		Page<color> pageColor = colorDao.findAll(pageable);

		model.addAttribute("pageColor", pageColor);

		color color = new color();
		model.addAttribute("color", color);

		color colorUpdate = new color();
		model.addAttribute("colorUpdate", colorUpdate);

		return "/Admin/production/homeadmin";
	}

	@ModelAttribute("list_color")
	public List<color> getListColor() {
		return colorDao.findAll();
	}

	@PostMapping("color/create")
	public String postMethodName(@ModelAttribute("color") color color, Model model) {
		model.addAttribute("page", "color.jsp");
		for (color item : getListColor()) {
			if (item.getNAME().equalsIgnoreCase(color.getNAME())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		colorDao.save(color);
		model.addAttribute("message", "Hoàn tất");
		return "/Admin/production/homeadmin";
	}

	@PostMapping("color/update")
	public String updatecolor(@ModelAttribute("color") color color, Model model) {
		model.addAttribute("page", "color.jsp");
		for (color item : getListColor()) {
			if (item.getNAME().equalsIgnoreCase(color.getNAME())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		colorDao.save(color);
		model.addAttribute("message", "Hoàn tất");
		return "/Admin/production/homeadmin";
	}

	@GetMapping("color/delete")
	public String deletecolor(@Param("id") Integer id, Model model) {

		model.addAttribute("page", "color.jsp");
		try {
			model.addAttribute("message", "Hoàn tất");
			color color = colorDao.getById(id);
			colorDao.delete(color);
		} catch (Exception e) {
			model.addAttribute("message", "Không thể xóa");
		}
		return "/Admin/production/homeadmin";

	}

	@GetMapping("ajax/getcolor/{id}")
	@ResponseBody
	public Optional<color> getColorById(Model model, @PathVariable("id") Integer id) {
		Optional<color> color = colorDao.findById(id);
		model.addAttribute("colorUpdate", color);
		return color;
	}

	@GetMapping("storage")
	public String getQLstorage(Model model, @RequestParam(name = "pages", defaultValue = "1") Optional<Integer> pages) {
		model.addAttribute("page", "storage.jsp");
		Pageable pageable = PageRequest.of(pages.orElse(1) - 1, 12);
		Page<storage> pageStorage = storageDao.findAllSX(pageable);

		model.addAttribute("pageStorage", pageStorage);

		return "/Admin/production/homeadmin";
	}

	@PostMapping("storage/create")
	public String postMethodName(@ModelAttribute("storage") storage storage, Model model) {
		model.addAttribute("page", "storage.jsp");
		for (storage item : storageDao.findAll()) {
			if (item.getGB() == storage.getGB()) {
				model.addAttribute("message", "Trùng GB");
				return "/Admin/production/homeadmin";
			}
		}
		storageDao.save(storage);
		model.addAttribute("message", "Hoàn tất");
		return "/Admin/production/homeadmin";
	}

	@PostMapping("storage/update")
	public String updaetStorage(@ModelAttribute("storage") storage storage, Model model) {
		model.addAttribute("page", "storage.jsp");
		for (storage item : storageDao.findAll()) {
			if (item.getGB() == storage.getGB()) {
				model.addAttribute("message", "Trùng GB");
				return "/Admin/production/homeadmin";
			}
		}
		storageDao.save(storage);
		model.addAttribute("message", "Hoàn tất");
		return "/Admin/production/homeadmin";
	}

	@GetMapping("storage/delete")
	public String deletestorage(@Param("id") Integer id, Model model) {
		model.addAttribute("page", "storage.jsp");
		try {
			storage storage = storageDao.getById(id);
			storageDao.delete(storage);
			model.addAttribute("message", "Hoàn tất");
		} catch (Exception e) {
			model.addAttribute("message", "Không thể xóa");
		}
		return "/Admin/production/homeadmin";
	}

	@GetMapping("ajax/getstorage/{id}")
	@ResponseBody
	public Optional<storage> getstorageById(Model model, @PathVariable("id") Integer id) {
		Optional<storage> storageUpdate = storageDao.findById(id);
		model.addAttribute("storageUpdate", storageUpdate.orElseGet(null).getClass());
		return storageUpdate;
	}

	@GetMapping("brand")
	public String getQLbrand(Model model, @RequestParam(name = "pages", defaultValue = "1") Optional<Integer> pages) {
		model.addAttribute("page", "brand.jsp");
		Pageable pageable = PageRequest.of(pages.orElse(1) - 1, 12);
		Page<brand> pageBrand = brandDao.findAll(pageable);
		model.addAttribute("pageBrand", pageBrand);
		return "/Admin/production/homeadmin";
	}

	@PostMapping("brand/create")
	public String postMethodName(@ModelAttribute("brand") brand brand, Model model) {
		model.addAttribute("page", "brand.jsp");
		for (brand item : brandDao.findAll()) {
			if (item.getNAME().equalsIgnoreCase(brand.getNAME())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		brandDao.save(brand);
		model.addAttribute("message", "Hoàn tất");
		return "/Admin/production/homeadmin";
	}

	@PostMapping("brand/update")
	public String updateBrand(@ModelAttribute("brandUpdate") brand brand, Model model) {
		model.addAttribute("page", "brand.jsp");
		for (brand item : brandDao.findAll()) {
			if (item.getNAME().equalsIgnoreCase(brand.getNAME())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		brandDao.save(brand);
		model.addAttribute("message", "Hoàn tất");
		return "/Admin/production/homeadmin";
	}

	@GetMapping("brand/delete")
	public String deletebrand(@Param("id") Integer id, Model model) {
		model.addAttribute("page", "brand.jsp");
		try {
			brand brand = brandDao.getById(id);
			brandDao.delete(brand);
			model.addAttribute("message", "Hoàn tất");
		} catch (Exception e) {
			model.addAttribute("message", "Không thể xóa");
		}
		return "/Admin/production/homeadmin";
	}

	@GetMapping("ajax/getbrand/{id}")
	@ResponseBody
	public Optional<brand> getbrandById(Model model, @PathVariable("id") Integer id) {
		Optional<brand> brandUpdate = brandDao.findById(id);
		model.addAttribute("brandUpdate", brandUpdate.orElseGet(null).getClass());
		return brandUpdate;
	}

	@GetMapping("battery_type")
	public String getQLbattery_type(@Validated @ModelAttribute("battery_type") battery_type battery_type,
			BindingResult bindingResult, Model model) {
		String page = "battery_type.jsp";
		model.addAttribute("page", page);

		List<battery_type> list_battery_type = battery_typeDao.findAll();
		model.addAttribute("list_battery_type", list_battery_type);

		battery_type battery_typeUpdate = new battery_type();
		model.addAttribute("battery_typeUpdate", battery_typeUpdate);

		return "/Admin/production/homeadmin";
	}

	@PostMapping("battery_type/create")
	public String postMethodName(@Validated @ModelAttribute("battery_type") battery_type battery_type,
			BindingResult bindingResult, Model model) {
		model.addAttribute("page", "battery_type.jsp");
		model.addAttribute("battery_typeUpdate", new com.vn.entity.battery_type());
		model.addAttribute("list_battery_type", battery_typeDao.findAll());
		for (battery_type item : battery_typeDao.findAll()) {
			if (item.getNAME().equalsIgnoreCase(battery_type.getNAME())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		try {
			battery_typeDao.save(battery_type);
			model.addAttribute("message", "Hoàn tất");
			return "/Admin/production/homeadmin";
		} catch (Exception e) {
			model.addAttribute("message", "Không được bỏ trống tên");
			model.addAttribute("a", "Không được bỏ trống tên");
			return "/Admin/production/homeadmin";
		}
	}

	@PostMapping("battery_type/update")
	public String updateBattery_type(@ModelAttribute("battery_type") battery_type battery_type, Model model) {
		model.addAttribute("page", "battery_type.jsp");
		model.addAttribute("battery_type", new com.vn.entity.battery_type());
		model.addAttribute("battery_typeUpdate", new com.vn.entity.battery_type());
		model.addAttribute("list_battery_type", battery_typeDao.findAll());
		for (battery_type item : battery_typeDao.findAll()) {
			if (item.getNAME().equalsIgnoreCase(battery_type.getNAME())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		battery_typeDao.save(battery_type);
		model.addAttribute("message", "Hoàn tất");
		return "/Admin/production/homeadmin";
	}

	@GetMapping("battery_type/delete")
	public String deletebattery_type(@Param("id") Integer id, Model model) {
		try {
			battery_type battery_type = battery_typeDao.getById(id);
			battery_typeDao.delete(battery_type);
			model.addAttribute("message", "Hoàn tất");
		} catch (Exception e) {
			model.addAttribute("message", "Không thể xóa");
		}
		model.addAttribute("page", "battery_type.jsp");
		model.addAttribute("battery_type", new com.vn.entity.battery_type());
		model.addAttribute("battery_typeUpdate", new com.vn.entity.battery_type());
		model.addAttribute("list_battery_type", battery_typeDao.findAll());
		return "/Admin/production/homeadmin";
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
		model.addAttribute("page", "system.jsp");
		model.addAttribute("system", new system());
		model.addAttribute("systemUpdate", new system());
		return "/Admin/production/homeadmin";
	}

	@ModelAttribute("list_system")
	public Map<Integer, String> getSystem() {
		Map<Integer, String> map = new HashMap<Integer, String>();

		List<system> list_system = systemDao.findAll();
		for (system system : list_system) {
			map.put(system.getID(), system.getSYSTEM());
		}
		return map;
	}

	@PostMapping("system/create")
	public String postMethodName(@ModelAttribute("system") system system, Model model) {

		model.addAttribute("page", "system.jsp");
		model.addAttribute("system", new system());
		model.addAttribute("systemUpdate", new system());
		for (system item : systemDao.findAll()) {
			if (item.getSYSTEM().equalsIgnoreCase(system.getSYSTEM())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		try {
			systemDao.save(system);
			model.addAttribute("message", "Hoàn tất");
		} catch (Exception e) {
			model.addAttribute("message", "Không được để trống tên");
		}

		return "/Admin/production/homeadmin";
	}

	@PostMapping("system/update")
	public String updateSystemm(@ModelAttribute("system") system system, Model model) {
		model.addAttribute("page", "system.jsp");
		model.addAttribute("system", new system());
		model.addAttribute("systemUpdate", new system());
		for (system item : systemDao.findAll()) {
			if (item.getSYSTEM().equalsIgnoreCase(system.getSYSTEM())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		systemDao.save(system);
		model.addAttribute("message", "Hoàn tất");
		return "/Admin/production/homeadmin";
	}

	@GetMapping("system/delete")
	public String deletesystem(@Param("id") Integer id, Model model) {
		model.addAttribute("page", "system.jsp");
		model.addAttribute("system", new system());
		model.addAttribute("systemUpdate", new system());
		try {
			system system = systemDao.getById(id);
			systemDao.delete(system);
			model.addAttribute("message", "Đã xóa");
		} catch (Exception e) {
			model.addAttribute("message", "Không thể xóa");
		}
		return "/Admin/production/homeadmin";
	}

	@GetMapping("ajax/getsystem/{id}")
	@ResponseBody
	public Optional<system> getsystemById(Model model, @PathVariable("id") Integer id) {
		Optional<system> systemUpdate = systemDao.findById(id);
		model.addAttribute("systemUpdate", systemUpdate.orElseGet(null).getClass());
		return systemUpdate;
	}

	@GetMapping("rank")
	public String getQLrank(Model model, @ModelAttribute("rank") rank rank,
			@ModelAttribute("rankUpdate") rank rankUpdate) {
		model.addAttribute("page", "rank.jsp");
		model.addAttribute("list_rank", rankDao.findAll());
		return "/Admin/production/homeadmin";
	}

	@PostMapping("rank/create")
	public String postMethodName(Model model, @ModelAttribute("rank") rank rank,
			@ModelAttribute("rankUpdate") rank rankUpdate) {
		model.addAttribute("page", "rank.jsp");
		model.addAttribute("list_rank", rankDao.findAll());
		for (rank item : rankDao.findAll()) {
			if (item.getNAME().equalsIgnoreCase(rank.getNAME())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		try {
			rankDao.save(rank);
			model.addAttribute("message", "Hoàn tất");
		} catch (Exception e) {
			model.addAttribute("message", "Không được để trống tên");
		}
		return "/Admin/production/homeadmin";
	}

	@PostMapping("rank/update")
	public String updateRank(Model model, @ModelAttribute("rank") rank rank,
			@ModelAttribute("rankUpdate") rank rankUpdate) {
		model.addAttribute("page", "rank.jsp");
		model.addAttribute("list_rank", rankDao.findAll());
		for (rank item : rankDao.findAll()) {
			if (item.getNAME().equalsIgnoreCase(rank.getNAME())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		try {
			rankDao.save(rank);
			model.addAttribute("message", "Hoàn tất");
		} catch (Exception e) {
			model.addAttribute("message", "Không được để trống tên");
		}
		return "/Admin/production/homeadmin";
	}

	@GetMapping("rank/delete")
	public String deleterank(@Param("id") Integer id, @ModelAttribute("rank") rank rank,
			@ModelAttribute("rankUpdate") rank rankUpdate, Model model) {
		model.addAttribute("page", "rank.jsp");
		model.addAttribute("list_rank", rankDao.findAll());
		try {
			rankDao.delete(rankDao.getById(id));
			model.addAttribute("message", "Đã xóa");
		} catch (Exception e) {
			model.addAttribute("message", "Không thể xóa");
		}
		return "/Admin/production/homeadmin";
	}

	@GetMapping("ajax/getrank/{id}")
	@ResponseBody
	public Optional<rank> getrankById(Model model, @PathVariable("id") Integer id) {
		Optional<rank> rankUpdate = rankDao.findById(id);
		model.addAttribute("rankUpdate", rankUpdate.orElseGet(null).getClass());
		return rankUpdate;
	}

	@GetMapping("headphone_jack")
	public String getQLheadphone_jack(Model model, @ModelAttribute("headphone_jack") headphone_jack headphone_jack) {
		model.addAttribute("page", "headphone_jack.jsp");
		model.addAttribute("headphone_jackUpdate", new headphone_jack());
		model.addAttribute("list_headphone_jack", headphone_jackDao.findAll());
		return "/Admin/production/homeadmin";
	}

	@PostMapping("headphone_jack/create")
	public String postMethodName(@ModelAttribute("headphone_jack") headphone_jack headphone_jack, Model model) {
		model.addAttribute("page", "headphone_jack.jsp");
		model.addAttribute("headphone_jackUpdate", new headphone_jack());
		model.addAttribute("list_headphone_jack", headphone_jackDao.findAll());

		for (headphone_jack item : headphone_jackDao.findAll()) {
			if (item.getNAME().equalsIgnoreCase(headphone_jack.getNAME())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		try {
			headphone_jackDao.save(headphone_jack);
			model.addAttribute("message", "Hoàn tất");
		} catch (Exception e) {
			model.addAttribute("message", "Không được để trống tên");
		}
		return "/Admin/production/homeadmin";
	}

	@PostMapping("headphone_jack/update")
	public String UpdateHeadphone_jack(@ModelAttribute("headphone_jack") headphone_jack headphone_jack, Model model) {
		model.addAttribute("page", "headphone_jack.jsp");
		model.addAttribute("headphone_jackUpdate", new headphone_jack());
		model.addAttribute("list_headphone_jack", headphone_jackDao.findAll());

		for (headphone_jack item : headphone_jackDao.findAll()) {
			if (item.getNAME().equalsIgnoreCase(headphone_jack.getNAME())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		try {
			headphone_jackDao.save(headphone_jack);
			model.addAttribute("message", "Hoàn tất");
		} catch (Exception e) {
			model.addAttribute("message", "Không được để trống tên");
		}
		return "/Admin/production/homeadmin";
	}

	@GetMapping("headphone_jack/delete")
	public String deleteheadphone_jack(@Param("id") Integer id, Model model) {
		model.addAttribute("page", "headphone_jack.jsp");
		model.addAttribute("headphone_jack", new headphone_jack());
		model.addAttribute("headphone_jackUpdate", new headphone_jack());
		model.addAttribute("list_headphone_jack", headphone_jackDao.findAll());
		try {
			headphone_jackDao.delete(headphone_jackDao.getById(id));
			model.addAttribute("message", "Đã xóa");
		} catch (Exception e) {
			model.addAttribute("message", "Không thể xóa");
		}
		return "/Admin/production/homeadmin";

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
		model.addAttribute("page", "charging_port.jsp");
		model.addAttribute("charging_port", new charging_port());
		model.addAttribute("charging_portUpdate", new charging_port());
		model.addAttribute("list_charging_port", charging_portDao.findAll());
		return "/Admin/production/homeadmin";
	}

	@ModelAttribute("list_charging_port")
	public Map<Integer, String> getListCharingPort() {
		Map<Integer, String> map = new HashMap<Integer, String>();

		List<charging_port> list_charging_port = charging_portDao.findAll();
		for (charging_port charging_port : list_charging_port) {
			map.put(charging_port.getID(), charging_port.getNAME());
		}
		return map;
	}

	@PostMapping("charging_port/create")
	public String postMethodName(@ModelAttribute("charging_port") charging_port charging_port, Model model) {
		model.addAttribute("page", "charging_port.jsp");
		model.addAttribute("charging_portUpdate", new charging_port());
		model.addAttribute("list_charging_port", charging_portDao.findAll());
		for (charging_port item : charging_portDao.findAll()) {
			if (item.getNAME().equalsIgnoreCase(charging_port.getNAME())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		try {
			charging_portDao.save(charging_port);
			model.addAttribute("message", "Hoàn tất");
		} catch (Exception e) {
			model.addAttribute("message", "Không được để trống tên");
		}
		return "/Admin/production/homeadmin";
	}

	@PostMapping("charging_port/update")
	public String updateCharging_port(@ModelAttribute("charging_port") charging_port charging_port, Model model) {
		model.addAttribute("page", "charging_port.jsp");
		model.addAttribute("charging_portUpdate", new charging_port());
		model.addAttribute("list_charging_port", charging_portDao.findAll());
		for (charging_port item : charging_portDao.findAll()) {
			if (item.getNAME().equalsIgnoreCase(charging_port.getNAME())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		try {
			charging_portDao.save(charging_port);
			model.addAttribute("message", "Hoàn tất");
		} catch (Exception e) {
			model.addAttribute("message", "Không được để trống tên");
		}
		return "/Admin/production/homeadmin";
	}

	@GetMapping("charging_port/delete")
	public String deletecharging_port(@Param("id") Integer id, Model model) {
		model.addAttribute("page", "charging_port.jsp");
		model.addAttribute("charging_port", new charging_port());
		model.addAttribute("charging_portUpdate", new charging_port());
		model.addAttribute("list_charging_port", charging_portDao.findAll());
		try {
			charging_portDao.delete(charging_portDao.getById(id));
			model.addAttribute("message", "Đã xóa");
		} catch (Exception e) {
			model.addAttribute("message", "Không thể xóa");
		}
		return "/Admin/production/homeadmin";
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
		model.addAttribute("page", "wireless_charging_technology.jsp");
		model.addAttribute("wireless_charging_technology", new wireless_charging_technology());
		model.addAttribute("wireless_charging_technologyUpdate", new wireless_charging_technology());
		model.addAttribute("list_wireless_charging_technology", wireless_charging_technologyDao.findAll());
		return "/Admin/production/homeadmin";
	}

	@PostMapping("wireless_charging_technology/create")
	public String postMethodName(Model model,
			@ModelAttribute("wireless_charging_technology") wireless_charging_technology wireless_charging_technology) {
		model.addAttribute("page", "wireless_charging_technology.jsp");
		model.addAttribute("wireless_charging_technologyUpdate", new wireless_charging_technology());
		model.addAttribute("list_wireless_charging_technology", wireless_charging_technologyDao.findAll());
		for (wireless_charging_technology item : wireless_charging_technologyDao.findAll()) {
			if (item.getNAME().equalsIgnoreCase(wireless_charging_technology.getNAME())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		try {
			wireless_charging_technologyDao.save(wireless_charging_technology);
			model.addAttribute("message", "Hoàn tất");
		} catch (Exception e) {
			model.addAttribute("message", "Không được để trống tên");
		}
		return "/Admin/production/homeadmin";
	}

	@PostMapping("wireless_charging_technology/update")
	public String updateƯireless_charging_technology(Model model,
			@ModelAttribute("wireless_charging_technologyUpdate") wireless_charging_technology wireless_charging_technologyUpdate) {
		model.addAttribute("page", "wireless_charging_technology.jsp");
		model.addAttribute("wireless_charging_technology", new wireless_charging_technology());
		model.addAttribute("list_wireless_charging_technology", wireless_charging_technologyDao.findAll());
		for (wireless_charging_technology item : wireless_charging_technologyDao.findAll()) {
			if (item.getNAME().equalsIgnoreCase(wireless_charging_technologyUpdate.getNAME())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		try {
			wireless_charging_technologyDao.save(wireless_charging_technologyUpdate);
			model.addAttribute("message", "Hoàn tất");
		} catch (Exception e) {
			model.addAttribute("message", "Không được để trống tên");
		}
		return "/Admin/production/homeadmin";
	}

	@GetMapping("wireless_charging_technology/delete")
	public String deletewireless_charging_technology(@Param("id") Integer id, Model model) {
		model.addAttribute("page", "wireless_charging_technology.jsp");
		model.addAttribute("wireless_charging_technology", new wireless_charging_technology());
		model.addAttribute("wireless_charging_technologyUpdate", new wireless_charging_technology());
		model.addAttribute("list_wireless_charging_technology", wireless_charging_technologyDao.findAll());
		try {
			wireless_charging_technologyDao.delete(wireless_charging_technologyDao.getById(id));
			model.addAttribute("message", "Đã xóa");
		} catch (Exception e) {
			model.addAttribute("message", "Không thể xóa");
		}
		return "/Admin/production/homeadmin";
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
		model.addAttribute("page", "screen_resolution.jsp");
		model.addAttribute("screen_resolution", new screen_resolution());
		model.addAttribute("screen_resolutionUpdate", new screen_resolution());
		model.addAttribute("list_screen_resolution", screen_resolutionDao.findAll());
		return "/Admin/production/homeadmin";
	}

	@PostMapping("screen_resolution/create")
	public String postMethodName(Model model,
			@ModelAttribute("screen_resolution") screen_resolution screen_resolution) {
		model.addAttribute("page", "screen_resolution.jsp");
		model.addAttribute("screen_resolutionUpdate", new screen_resolution());
		model.addAttribute("list_screen_resolution", screen_resolutionDao.findAll());
		for (screen_resolution item : screen_resolutionDao.findAll()) {
			if (item.getNAME().equalsIgnoreCase(screen_resolution.getNAME())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		try {
			screen_resolutionDao.save(screen_resolution);
			model.addAttribute("message", "Hoàn tất");
		} catch (Exception e) {
			model.addAttribute("message", "Không được để trống tên");
		}
		return "/Admin/production/homeadmin";
	}

	@PostMapping("screen_resolution/update")
	public String updateScreen_resolution(Model model,
			@ModelAttribute("screen_resolutionUpdate") screen_resolution screen_resolutionUpdate) {
		model.addAttribute("page", "screen_resolution.jsp");
		model.addAttribute("screen_resolution", new screen_resolution());
		model.addAttribute("list_screen_resolution", screen_resolutionDao.findAll());
		for (screen_resolution item : screen_resolutionDao.findAll()) {
			if (item.getNAME().equalsIgnoreCase(screen_resolutionUpdate.getNAME())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		try {
			screen_resolutionDao.save(screen_resolutionUpdate);
			model.addAttribute("message", "Hoàn tất");
		} catch (Exception e) {
			model.addAttribute("message", "Không được để trống tên");
		}
		return "/Admin/production/homeadmin";
	}

	@GetMapping("screen_resolution/delete")
	public String deletescreen_resolution(@Param("id") Integer id, Model model) {
		model.addAttribute("page", "screen_resolution.jsp");
		model.addAttribute("screen_resolution", new screen_resolution());
		model.addAttribute("screen_resolutionUpdate", new screen_resolution());
		model.addAttribute("list_screen_resolution", screen_resolutionDao.findAll());
		try {
			screen_resolutionDao.delete(screen_resolutionDao.getById(id));
			model.addAttribute("message", "Đã xóa");
		} catch (Exception e) {
			model.addAttribute("message", "Không thể xóa");
		}
		return "/Admin/production/homeadmin";
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
		model.addAttribute("page", "graphics_chip.jsp");
		model.addAttribute("graphics_chip", new graphics_chip());
		model.addAttribute("graphics_chipUpdate", new graphics_chip());
		model.addAttribute("list_graphics_chip", graphics_chipDao.findAll());
		return "/Admin/production/homeadmin";
	}

	@PostMapping("graphics_chip/create")
	public String postMethodName(Model model, @ModelAttribute("graphics_chip") graphics_chip graphics_chip) {
		model.addAttribute("page", "graphics_chip.jsp");
		model.addAttribute("graphics_chipUpdate", new graphics_chip());
		model.addAttribute("list_graphics_chip", graphics_chipDao.findAll());
		for (graphics_chip item : graphics_chipDao.findAll()) {
			if (item.getNAME().equalsIgnoreCase(graphics_chip.getNAME())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		try {
			graphics_chipDao.save(graphics_chip);
			model.addAttribute("message", "Hoàn tất");
		} catch (Exception e) {
			model.addAttribute("message", "Không được để trống tên");
		}
		return "/Admin/production/homeadmin";
	}

	@PostMapping("graphics_chip/update")
	public String updategraphics_chip(Model model,
			@ModelAttribute("graphics_chipUpdate") graphics_chip graphics_chipUpdate) {
		model.addAttribute("page", "graphics_chip.jsp");
		model.addAttribute("graphics_chip", new graphics_chip());
		model.addAttribute("list_graphics_chip", graphics_chipDao.findAll());
		for (graphics_chip item : graphics_chipDao.findAll()) {
			if (item.getNAME().equalsIgnoreCase(graphics_chipUpdate.getNAME())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		try {
			graphics_chipDao.save(graphics_chipUpdate);
			model.addAttribute("message", "Hoàn tất");
		} catch (Exception e) {
			model.addAttribute("message", "Không được để trống tên");
		}
		return "/Admin/production/homeadmin";
	}

	@GetMapping("graphics_chip/delete")
	public String deletegraphics_chip(@Param("id") Integer id, Model model) {
		model.addAttribute("page", "graphics_chip.jsp");
		model.addAttribute("graphics_chip", new graphics_chip());
		model.addAttribute("graphics_chipUpdate", new graphics_chip());
		model.addAttribute("list_graphics_chip", graphics_chipDao.findAll());
		try {
			graphics_chipDao.delete(graphics_chipDao.getById(id));
			model.addAttribute("message", "Đã xóa");
		} catch (Exception e) {
			model.addAttribute("message", "Không thể xóa");
		}
		return "/Admin/production/homeadmin";
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
		model.addAttribute("page", "status_order.jsp");
		model.addAttribute("status_order", new status_order());
		model.addAttribute("status_orderUpdate", new status_order());
		model.addAttribute("list_status_order", status_orderDao.findAll());
		return "/Admin/production/homeadmin";
	}

	@PostMapping("status_order/create")
	public String postMethodName(Model model, @ModelAttribute("status_order") status_order status_order) {
		model.addAttribute("page", "status_order.jsp");
		model.addAttribute("status_orderUpdate", new status_order());
		model.addAttribute("list_status_order", status_orderDao.findAll());
		for (status_order item : status_orderDao.findAll()) {
			if (item.getSTATUS().equalsIgnoreCase(status_order.getSTATUS())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		try {
			status_orderDao.save(status_order);
			model.addAttribute("message", "Hoàn tất");
		} catch (Exception e) {
			model.addAttribute("message", "Không được để trống tên");
		}
		return "/Admin/production/homeadmin";
	}

	@PostMapping("status_order/update")
	public String updatestatus_order(Model model,
			@ModelAttribute("status_orderUpdate") status_order status_orderUpdate) {
		model.addAttribute("page", "status_order.jsp");
		model.addAttribute("status_order", new status_order());
		model.addAttribute("list_status_order", status_orderDao.findAll());
		for (status_order item : status_orderDao.findAll()) {
			if (item.getSTATUS().equalsIgnoreCase(status_orderUpdate.getSTATUS())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		try {
			status_orderDao.save(status_orderUpdate);
			model.addAttribute("message", "Hoàn tất");
		} catch (Exception e) {
			model.addAttribute("message", "Không được để trống tên");
		}
		return "/Admin/production/homeadmin";
	}

	@GetMapping("status_order/delete")
	public String deletestatus_order(@Param("id") Integer id, Model model) {
		model.addAttribute("page", "status_order.jsp");
		model.addAttribute("status_order", new status_order());
		model.addAttribute("status_orderUpdate", new status_order());
		model.addAttribute("list_status_order", status_orderDao.findAll());
		try {
			status_orderDao.delete(status_orderDao.getById(id));
			model.addAttribute("message", "Đã xóa");
		} catch (Exception e) {
			model.addAttribute("message", "Không thể xóa");
		}
		return "/Admin/production/homeadmin";
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
		model.addAttribute("page", "payment_method.jsp");
		model.addAttribute("payment_method", new payment_method());
		model.addAttribute("payment_methodUpdate", new payment_method());
		model.addAttribute("list_payment_method", payment_methodDao.findAll());
		return "/Admin/production/homeadmin";
	}

	@PostMapping("payment_method/create")
	public String postMethodName(Model model, @ModelAttribute("payment_method") payment_method payment_method) {
		model.addAttribute("page", "payment_method.jsp");
		model.addAttribute("payment_methodUpdate", new payment_method());
		model.addAttribute("list_payment_method", payment_methodDao.findAll());
		for (payment_method item : payment_methodDao.findAll()) {
			if (item.getNAME().equalsIgnoreCase(payment_method.getNAME())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		try {
			payment_methodDao.save(payment_method);
			model.addAttribute("message", "Hoàn tất");
		} catch (Exception e) {
			model.addAttribute("message", "Không được để trống tên");
		}
		return "/Admin/production/homeadmin";
	}

	@PostMapping("payment_method/update")
	public String updatepayment_method(Model model,
			@ModelAttribute("payment_methodUpdate") payment_method payment_methodUpdate) {
		model.addAttribute("page", "payment_method.jsp");
		model.addAttribute("payment_method", new payment_method());
		model.addAttribute("list_payment_method", payment_methodDao.findAll());
		for (payment_method item : payment_methodDao.findAll()) {
			if (item.getNAME().equalsIgnoreCase(payment_methodUpdate.getNAME())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		try {
			payment_methodDao.save(payment_methodUpdate);
			model.addAttribute("message", "Hoàn tất");
		} catch (Exception e) {
			model.addAttribute("message", "Không được để trống tên");
		}
		return "/Admin/production/homeadmin";
	}

	@GetMapping("payment_method/delete")
	public String deletepayment_method(@Param("id") Integer id, Model model) {
		model.addAttribute("page", "payment_method.jsp");
		model.addAttribute("payment_method", new payment_method());
		model.addAttribute("payment_methodUpdate", new payment_method());
		model.addAttribute("list_payment_method", payment_methodDao.findAll());
		try {
			payment_methodDao.delete(payment_methodDao.getById(id));
			model.addAttribute("message", "Đã xóa");
		} catch (Exception e) {
			model.addAttribute("message", "Không thể xóa");
		}
		return "/Admin/production/homeadmin";
	}
	//
	// @GetMapping("payment_method")
	// public String getQLpayment_method(Model model) {
	// String page = "payment_method.jsp";
	// model.addAttribute("page", page);
	//
	// List<payment_method> list_payment_method = payment_methodDao.findAll();
	// model.addAttribute("list_payment_method", list_payment_method);
	//
	// payment_method payment_method = new payment_method();
	// model.addAttribute("payment_method", payment_method);
	//
	// payment_method payment_methodUpdate = new payment_method();
	// model.addAttribute("payment_methodUpdate", payment_methodUpdate);
	//
	// return "/Admin/production/homeadmin";
	// }
	//
	// @PostMapping("payment_method/create")
	// public String postMethodName(@ModelAttribute("payment_method") payment_method
	// payment_method) {
	// payment_methodDao.save(payment_method);
	// return "redirect:/admin/payment_method";
	// }
	//
	// @PostMapping("payment_method/update")
	// public String updatePayment_method(@ModelAttribute("payment_methodUpdate")
	// payment_method payment_methodUpdate) {
	// payment_methodDao.save(payment_methodUpdate);
	// return "redirect:/admin/payment_method";
	// }
	//
	// @GetMapping("payment_method/delete")
	// public String deletepayment_method(@Param("id") Integer id) {
	// payment_method payment_method = payment_methodDao.getById(id);
	// payment_methodDao.delete(payment_method);
	// return "redirect:/admin/payment_method";
	// }

	@GetMapping("ajax/getpayment_method/{id}")
	@ResponseBody
	public Optional<payment_method> payment_methodById(Model model, @PathVariable("id") Integer id) {
		Optional<payment_method> payment_methodUpdate = payment_methodDao.findById(id);
		model.addAttribute("payment_methodUpdate", payment_methodUpdate.orElseGet(null).getClass());
		return payment_methodUpdate;
	}

	@GetMapping("status_invoice")
	public String getQLstatus_invoice(Model model) {
		model.addAttribute("page", "status_invoice.jsp");
		model.addAttribute("status_invoice", new status_invoice());
		model.addAttribute("status_invoiceUpdate", new status_invoice());
		model.addAttribute("list_status_invoice", status_invoiceDao.findAll());
		return "/Admin/production/homeadmin";
	}

	@PostMapping("status_invoice/create")
	public String postMethodName(Model model, @ModelAttribute("status_invoice") status_invoice status_invoice) {
		model.addAttribute("page", "status_invoice.jsp");
		model.addAttribute("status_invoiceUpdate", new status_invoice());
		model.addAttribute("list_status_invoice", status_invoiceDao.findAll());
		for (status_invoice item : status_invoiceDao.findAll()) {
			if (item.getNAME().equalsIgnoreCase(status_invoice.getNAME())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		try {
			status_invoiceDao.save(status_invoice);
			model.addAttribute("message", "Hoàn tất");
		} catch (Exception e) {
			model.addAttribute("message", "Không được để trống tên");
		}
		return "/Admin/production/homeadmin";
	}

	@PostMapping("status_invoice/update")
	public String updatestatus_invoice(Model model,
			@ModelAttribute("status_invoiceUpdate") status_invoice status_invoiceUpdate) {
		model.addAttribute("page", "status_invoice.jsp");
		model.addAttribute("status_invoice", new status_invoice());
		model.addAttribute("list_status_invoice", status_invoiceDao.findAll());
		for (status_invoice item : status_invoiceDao.findAll()) {
			if (item.getNAME().equalsIgnoreCase(status_invoiceUpdate.getNAME())) {
				model.addAttribute("message", "Trùng tên");
				return "/Admin/production/homeadmin";
			}
		}
		try {
			status_invoiceDao.save(status_invoiceUpdate);
			model.addAttribute("message", "Hoàn tất");
		} catch (Exception e) {
			model.addAttribute("message", "Không được để trống tên");
		}
		return "/Admin/production/homeadmin";
	}

	@GetMapping("status_invoice/delete")
	public String deletestatus_invoice(@Param("id") Integer id, Model model) {
		model.addAttribute("page", "status_invoice.jsp");
		model.addAttribute("status_invoice", new status_invoice());
		model.addAttribute("status_invoiceUpdate", new status_invoice());
		model.addAttribute("list_status_invoice", status_invoiceDao.findAll());
		try {
			status_invoiceDao.delete(status_invoiceDao.getById(id));
			model.addAttribute("message", "Đã xóa");
		} catch (Exception e) {
			model.addAttribute("message", "Không thể xóa");
		}
		return "/Admin/production/homeadmin";
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
		List<Integer> daysList = new ArrayList<>();
		for (int i = 1; i <= numDays; i++) {
			daysList.add(i);
		}
		List<Integer> hoursList = new ArrayList<>();
		for (int i = 0; i < 24; i++) {
			hoursList.add(i);
		}
		List<Integer> monthsList = new ArrayList<>();
		for (int i = 1; i <= 12; i++) {
			monthsList.add(i);
		}

		List<Object[]> getTop7Quantity = phoneDao.getTop7Phones();
		List<Double> getTotalPricePerDay = invoiceDao.getTotalPricePerDay(currentYear, currentMonth);
		List<Double> getTotalAmountPerHour = invoiceDao.getTotalAmountPerHour(currentYear, currentMonth, currentDay);
		List<Double> getTotalPricePerMonth = invoiceDao.getTotalPricePerMonth(currentYear);
		int countUsers = UserDao.countUsers();
		long totalSumProducts = variantDao.totalSumProduct();
		Long sumRevenue = invoiceDao.sumRevenue();
		long countOrder = orderDao.countOrder();
		model.addAttribute("getTop7Quantity", getTop7Quantity);
		model.addAttribute("getTotalPricePerDay", getTotalPricePerDay);
		model.addAttribute("getTotalAmountPerHour", getTotalAmountPerHour);
		model.addAttribute("getTotalPricePerMonth", getTotalPricePerMonth);
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
		return map;
	}

	@GetMapping("/check-username")
	public ResponseEntity<Boolean> checkUsernameExist(@RequestParam String username) {
		Boolean exists = userDao.existsById(username);
		return ResponseEntity.ok(exists);
	}

	@PostMapping("create-admin")
	public ResponseEntity<Map<String, String>> create(Model model, @Validated @ModelAttribute("userItem") user users,
			BindingResult bindingResult, @RequestParam("photo_file") MultipartFile img) throws IOException {
		Map<String, String> response = new HashMap<>();

		if (bindingResult.hasErrors()) {
			// Trả về lỗi xác thực
			bindingResult.getFieldErrors().forEach(error -> response.put(error.getField(), error.getDefaultMessage()));
			return ResponseEntity.badRequest().body(response);
		}
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
			users.setROLE(true);
			rank rank = new rank();
			rank.setID(5);
			users.setRank(rank);
			// Lưu người dùng vào cơ sở dữ liệu
			userDao.save(users);
		}
		response.put("status", "success");
		return ResponseEntity.ok(response);
	}
	
	@GetMapping("delete/{username}")
	public String deleteUser(@PathVariable("username") String username, RedirectAttributes redirectAttributes) {
	    try {
	        userDao.deleteById(username);
	        redirectAttributes.addFlashAttribute("message", "Vô hiệu hóa thành công");
	        redirectAttributes.addFlashAttribute("messageType", "success");
	        System.out.println("Thành công");
	    } catch (Exception e) {
	        redirectAttributes.addFlashAttribute("message", "Không thể vô hiệu hóa. Tài khoản đang được sử dụng.");
	        redirectAttributes.addFlashAttribute("messageType", "error");
	        System.out.println("Lỗi");
	    }
	    return "redirect:/admin/user";
	}


	@PostMapping("variant/create")
	public ResponseEntity<Map<String, String>> createVariant(
			@Validated @ModelAttribute("ObjectVariant") variant variant, BindingResult bindingResult) {
		Map<String, String> response = new HashMap<>();

		if (bindingResult.hasErrors()) {
			bindingResult.getFieldErrors().forEach(error -> {
				response.put(error.getField(), error.getDefaultMessage());
			});
			return ResponseEntity.badRequest().body(response);
		}

		try {
			variantDao.save(variant);
			response.put("status", "success");
			return ResponseEntity.ok(response);
		} catch (Exception e) {
			response.put("status", "error");
			response.put("message", "Failed to save variant: " + e.getMessage());
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
	}

	@GetMapping("variant/detele/{id}")
	public String deleteVariant(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
		try {
			variantDao.deleteById(id);
			redirectAttributes.addFlashAttribute("a", "Hoàn tất");
			redirectAttributes.addFlashAttribute("b", "success");
		} catch (DataIntegrityViolationException e) {
			redirectAttributes.addFlashAttribute("a", "Không thể xóa. Bản ghi đang được sử dụng.");
			redirectAttributes.addFlashAttribute("b", "error");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("a", "Có lỗi xảy ra khi xóa bản ghi.");
			redirectAttributes.addFlashAttribute("b", "error");
		}

		return "redirect:/admin/product";
	}

	@GetMapping("user")
	public String getQLNguoiDung(Model model, @ModelAttribute("userItem") user user,
			@RequestParam(name = "pages", defaultValue = "1") Optional<Integer> pages) {

		Pageable pageable = PageRequest.of(pages.orElse(1) - 1, 12);
		Page<user> pageUser = userDao.findAllSX(pageable);
		model.addAttribute("userItem", user);
		model.addAttribute("pageUser", pageUser);
		String page = "qlnguoidung.jsp";
		model.addAttribute("page", page);
		return "/Admin/production/homeadmin";
	}

	@Autowired
	userDao userDao;

	@GetMapping("authorize/{id}")
	public ResponseEntity<String> getAuthorize(@PathVariable("id") String id) {
		try {
			user user = userDao.findById(id).orElse(null);
			if (user == null) {
				return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Không tìm thấy người dùng");
			}
			user.setROLE(false); // Giả sử trường ROLE trong User là role, tùy vào định nghĩa của bạn
			user.setUPDATE_AT(new Date()); // Tương tự như trên, đảm bảo tên trường và kiểu dữ liệu đúng
			user.setSTATUS(false);
			userDao.save(user);
			return ResponseEntity.ok("Người dùng được phê duyệt thành công");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Lỗi máy chủ nội bộ");
		}
	}

	@GetMapping("unlock/{id}")
	public ResponseEntity<String> getUnlock(@PathVariable("id") String id) {
		try {
			user user = userDao.findById(id).orElse(null);
			if (user == null) {
				return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Không tìm thấy người dùng");
			}
			user.setROLE(false); // Giả sử trường ROLE trong User là role, tùy vào định nghĩa của bạn
			user.setUPDATE_AT(new Date()); // Tương tự như trên, đảm bảo tên trường và kiểu dữ liệu đúng
			user.setSTATUS(true);
			userDao.save(user);
			return ResponseEntity.ok("Người dùng đã được mở khóa thành công");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Lỗi máy chủ nội bộ");
		}
	}

	@ModelAttribute("listColor")
	public Map<Integer, String> getColor() {
		Map<Integer, String> map = new HashMap<>();
		List<color> listColor = colorDao.findAll();
		for (color color : listColor) {
			map.put(color.getID(), color.getNAME());
		}
		return map;
	}

	@ModelAttribute("listStorage")
	public Map<Integer, Integer> getStorage() {
		Map<Integer, Integer> map = new HashMap<>();
		List<storage> listColor = storageDao.findAll();
		for (storage color : listColor) {
			map.put(color.getID(), color.getGB());
		}
		return map;
	}

	@ModelAttribute("listDiscount")
	public Map<Integer, Double> getDiscount() {
		Map<Integer, Double> map = new HashMap<>();
		List<discount_product> list = discount_productDao.findAll();
		for (discount_product color : list) {
			map.put(color.getID(), color.getDISCOUNT_PERCENTAGE());
		}
		return map;
	}
}
