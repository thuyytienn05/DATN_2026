package edu.poly.controller;

import java.time.Year;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.poly.dao.CategoryDAO;
import edu.poly.dao.ProductDAO;
import edu.poly.entity.Category;
import edu.poly.entity.Product;
import edu.poly.service.SessionService;

@Controller
public class HomeController {

    @Autowired
    ProductDAO proDao;

    @Autowired
    CategoryDAO caDao;

    @Autowired
    SessionService session;

    @RequestMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/shop")
    public String shop(
            Model model,
            @RequestParam("p") Optional<Integer> p,
            @RequestParam("name") Optional<String> name,
            @RequestParam("sort") Optional<Boolean> sort,
            // ĐÃ ĐỔI: category giờ là Integer (khớp với Category.id kiểu số trong DB mới)
            // LƯU Ý: JSP/link filter danh mục phải gửi category=<số>, không còn gửi "ca01" nữa
            @RequestParam("category") Optional<Integer> category,
            @RequestParam("price") Optional<Integer> price) {

        session.set("searchShop", name.orElse(""));
        session.set("sortShop", sort.orElse(true));

        Page<Product> products = proDao.search(
                "%" + name.orElse("") + "%",
                category.orElse(null),
                PageRequest.of(
                        p.orElse(0),
                        12,
                        Sort.by(
                                sort.orElse(true)
                                        ? Direction.ASC
                                        : Direction.DESC,
                                "price")));

        if (price.orElse(-1) == 2) {
            products = proDao.searchPriceGreater(
                    "%" + name.orElse("") + "%",
                    category.orElse(null),
                    price.orElse(0) * 100000.0,
                    PageRequest.of(
                            p.orElse(0),
                            12,
                            Sort.by(
                                    sort.orElse(true)
                                            ? Direction.ASC
                                            : Direction.DESC,
                                    "price")));
        }
        // ĐÃ SỬA: gọi "searchPriceBetween" (đã có sẵn trong ProductDAO, cùng logic)
        // thay vì "findAllByNameLikeAndCategoryIdLikeAndPriceBetween" (method không tồn tại)
        else if (price.orElse(-1) == 0
                || price.orElse(-1) == 1) {

            products = proDao.searchPriceBetween(
                    "%" + name.orElse("") + "%",
                    category.orElse(null),
                    price.orElse(0) * 100000.0,
                    (price.orElse(0) + 1) * 100000.0,
                    PageRequest.of(
                            p.orElse(0),
                            12,
                            Sort.by(
                                    sort.orElse(true)
                                            ? Direction.ASC
                                            : Direction.DESC,
                                    "price")));
        }

        Map<Integer, Object[]> map = new HashMap<>();

        for (Product pro : products) {
            map.put(pro.getId(), new Object[]{
                    pro.getName(),
                    pro.getPrice(),
                    pro.getCategory(),
                    pro.getImage() == null
                            ? new String[0]
                            : pro.getImage().split(",")
            });
        }

        Set<Entry<Integer, Object[]>> entries =
                map.entrySet();

        List<Entry<Integer, Object[]>> list =
                sort.orElse(true)
                        ? entries.stream()
                                .sorted(
                                        Comparator.comparingDouble(
                                                e -> (Double) e.getValue()[1]))
                                .collect(Collectors.toList())
                        : entries.stream()
                                .sorted(
                                        Comparator.comparingDouble(
                                                e -> -(Double) e.getValue()[1]))
                                .collect(Collectors.toList());

        model.addAttribute("page", products);
        model.addAttribute("products", list);

        return "shop";
    }

    @GetMapping("/shop/detail/{id}")
    public String shop_detail(
            Model model,
            @PathVariable("id") Integer id) {

        Product p = proDao.findById(id).orElse(null);

        if (p == null) {
            return "redirect:/shop";
        }

        Object[] obj = new Object[]{
                p.getId(),
                p.getName(),
                p.getPrice(),
                p.getImage() == null
                        ? new String[0]
                        : p.getImage().split(","),
                p.getCategory(),
                p.getQuantity()
        };

        List<Product> list =
                proDao.findByCategory(p.getCategory());

        Map<Integer, Object[]> map =
                new HashMap<>();

        for (Product pro : list) {
            map.put(pro.getId(), new Object[]{
                    pro.getName(),
                    pro.getPrice(),
                    pro.getCategory(),
                    pro.getImage() == null
                            ? new String[0]
                            : pro.getImage().split(",")
            });
        }

        model.addAttribute("detailProduct", obj);
        model.addAttribute("relatedProducts", map);

        return "shop-details";
    }

    @ModelAttribute("categories")
    public List<Category> categories_data() {
        return caDao.findByIsDelete(false);
    }

    @ModelAttribute("bestSellers")
    public Map<Integer, Object[]> bestSellers_data(
            Model model) {

        List<Product> products =
                proDao.findAllRandom();

        Map<Integer, Object[]> map =
                new HashMap<>();

        for (Product p : products) {
            map.put(p.getId(), new Object[]{
                    p.getName(),
                    p.getPrice(),
                    p.getCategory(),
                    p.getImage() == null
                            ? new String[0]
                            : p.getImage().split(","),
                    p.getPrice() < 130000
            });
        }

        model.addAttribute(
                "year",
                Year.now().getValue());

        return map;
    }

    @GetMapping("/profile-account")
    public String profileAccount() {
        return "profile-account";
    }

    @GetMapping("/GioiThieu")
    public String GioThieu() {
        return "GioiThieu";
    }

    @GetMapping("/bosuutap")
    public String bosutap() {
        return "bosuutap";
    }
}