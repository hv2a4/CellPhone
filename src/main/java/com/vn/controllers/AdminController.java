package com.vn.controllers;


import com.vn.DAO.*;
import com.vn.entity.order;
import com.vn.entity.rank;
import com.vn.entity.status_order;
import com.vn.entity.user;
import com.vn.utils.SessionService;
import jakarta.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletRequest;
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
    ColorDao colorDao;
    @Autowired
    userDao userDao;
    @Autowired
    rankDao rankDao;

    @Autowired
    ServletContext app;

    @Autowired
    orderDao orderDaos;
    @Autowired
    SessionService sessionService;
    @Autowired
    status_orderDao status_orderDao;

    @GetMapping("login")
    public String getlogin(Model model) {
        return "/Admin/production/login";
    }

//    @GetMapping("")
//    public String getMethodName(Model model) {
//        String page = "tongquan.jsp";
//        model.addAttribute("page", page);
//        return "/Admin/production/homeadmin";
//    }

    @GetMapping("/{id}")
    public String getSession(Model model, @PathVariable("id") String id) {
        System.out.println(id);
        String page = "tongquan.jsp";
        user sessionUser = (user) sessionService.get("list");
        System.out.println("Dữ liệu lấy từ session: " + sessionUser.getFULLNAME());
        if (sessionUser.getROLE()) {
            model.addAttribute("page", page);
            return "/Admin/production/homeadmin";
        } else {
            return "/Admin/production/404notfound";
        }
    }

    @RequestMapping("logout")
    public String logOut() {
        sessionService.remove("list");
        return "redirect:/shop/login";
    }

    @ModelAttribute("fillTableUser")
    public List<user> getList() {
        return userDao.findAll();
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
    public String create(Model model, @ModelAttribute("userItem") user users, @RequestParam("photo_file") MultipartFile img) throws IOException {
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
            users.setUpdate_at(new Date());

            // Lưu người dùng vào cơ sở dữ liệu
            userDao.save(users);
        }
        return "redirect:/admin/user";
    }


    @GetMapping("user")
    public String getQLNguoiDung(Model model, @ModelAttribute("userItem") user user) {
        model.addAttribute("userItem", user);
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

    @GetMapping("authorize/{id}")
    public String getAuthorize(Model model, @PathVariable("id") String id) {
        user users = userDao.findById(id).get();
        users.setROLE(true);
        users.setUpdate_at(new Date());
        userDao.save(users);
        String page = "qlnguoidung.jsp";
        model.addAttribute("page", page);
        return "redirect:/admin/user";
    }

    //trả hàng
    @GetMapping("returns/{id}")
    public String getReturns(Model model, @PathVariable("id") Integer id) {
        // Tìm đối tượng order theo ID
        order orders = orderDaos.findById(id).orElseThrow(() -> new RuntimeException("Order not found"));

        // Tìm đối tượng status_order mới có ID là 6 (Trả hàng)
        status_order returnStatus = status_orderDao.findById(6).orElseThrow(() -> new RuntimeException("Status not found"));

        // Cập nhật trạng thái trả hàng cho đối tượng order
        orders.setStatus_order(returnStatus);

        // Lưu lại đối tượng order
        orderDaos.save(orders);

        return "redirect:/admin/order";
    }

    @GetMapping("confirmation/{id}")
    public String getConfirmation(Model model, @PathVariable("id") Integer id) {
        order orders = orderDaos.findById(id).orElseThrow(() -> new RuntimeException("Order not found"));
        status_order returnStatus = status_orderDao.findById(3).orElseThrow(() -> new RuntimeException("Status not found"));
        orders.setStatus_order(returnStatus);
        System.out.println("Order ID: " + id + " updated to status: " + returnStatus.getSTATUS());
        orderDaos.save(orders);
        return "redirect:/admin/order";
    }

    @GetMapping("delivery/{id}")
    public String getDelivery(@PathVariable("id") Integer id) {
        order orders = orderDaos.findById(id).orElseThrow(() -> new RuntimeException("Order not found"));
        status_order statusOrder = status_orderDao.findById(4).orElseThrow(() -> new RuntimeException("Status not found"));
        orders.setStatus_order(statusOrder);
        System.out.println("Order ID: " + id + " updated to status: " + statusOrder.getSTATUS());
        orderDaos.save(orders);
        return "redirect:/admin/order";
    }

    @GetMapping("completed/{id}")
    public String getCompleted(@PathVariable("id") Integer id) {
        order orders = orderDaos.findById(id).orElseThrow(() -> new RuntimeException("Order not found"));
        status_order statusOrder = status_orderDao.findById(1).orElseThrow(() -> new RuntimeException("Status not found"));
        orders.setStatus_order(statusOrder);
        System.out.println("Order ID: " + id + " updated to status: " + statusOrder.getSTATUS());
        orderDaos.save(orders);
        return "redirect:/admin/order";
    }

    @GetMapping("unlock/{id}")
    public String getUnlock(Model model, @PathVariable("id") String id) {
        user users = userDao.findById(id).get();
        users.setSTATUS(true);
        users.setUpdate_at(new Date());
        userDao.save(users);
        String page = "qlnguoidung.jsp";
        model.addAttribute("page", page);
        return "redirect:/admin/user";
    }

    @GetMapping("product")
    public String getQLSanPham(Model model) {
        String page = "product.jsp";
        model.addAttribute("page", page);
        return "/Admin/production/homeadmin";
    }

    @ModelAttribute("confirmations")
    List<order> getConfigmationOrder() {
        return orderDaos.findAll();
    }

    @ModelAttribute("fillOrder")
    public List<order> getListOrder() {
        return orderDaos.findAll();
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
