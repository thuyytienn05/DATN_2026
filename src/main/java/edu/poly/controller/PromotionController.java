package edu.poly.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import edu.poly.dao.PromotionDAO;
import edu.poly.dao.ProductDAO;
import edu.poly.entity.Product;
import edu.poly.entity.Promotion;

@Controller
@RequestMapping("/admin/khuyenmai")
public class PromotionController {

    @Autowired
    PromotionDAO promoDao;

    @Autowired
    ProductDAO proDao;

    @GetMapping("")
    public String list(Model model) {
        model.addAttribute("promotions", promoDao.findAll());
        model.addAttribute("products", proDao.findAll());
        return "admin/khuyenmai";
    }

    @PostMapping("/save")
    public String save(
            @RequestParam("productId") Integer productId,
            @RequestParam("discountPercent") Double discountPercent,
            @RequestParam("startDate") String startDateStr,
            @RequestParam("endDate") String endDateStr,
            @RequestParam(value = "isActive", required = false) Boolean isActive) throws Exception {

        Product product = proDao.findById(productId).orElse(null);
        if (product == null) {
            return "redirect:/admin/khuyenmai";
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = sdf.parse(startDateStr);
        Date endDate = sdf.parse(endDateStr);

        Promotion promotion = new Promotion();
        promotion.setProduct(product);
        promotion.setDiscountPercent(discountPercent);
        promotion.setStartDate(startDate);
        promotion.setEndDate(endDate);
        promotion.setIsActive(isActive != null);

        promoDao.save(promotion);
        return "redirect:/admin/khuyenmai";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Integer id) {
        promoDao.deleteById(id);
        return "redirect:/admin/khuyenmai";
    }

    @GetMapping("/toggle/{id}")
    public String toggle(@PathVariable("id") Integer id) {
        promoDao.findById(id).ifPresent(p -> {
            p.setIsActive(!Boolean.TRUE.equals(p.getIsActive()));
            promoDao.save(p);
        });
        return "redirect:/admin/khuyenmai";
    }
}