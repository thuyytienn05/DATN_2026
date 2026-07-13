package edu.poly.controller;

import java.util.*;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import edu.poly.dao.ProductDAO;
import edu.poly.dao.ProductImageDAO;
import edu.poly.entity.Product;
import edu.poly.entity.ProductImage;
import edu.poly.service.ImageRecognitionService;

@Controller
public class ImageSearchController {

    @Autowired
    ProductImageDAO imgDao;

    @Autowired
    ProductDAO proDao;

    @Autowired
    ImageRecognitionService aiService;

    @GetMapping("/tim-kiem-anh")
    public String page() {
        return "search-by-image";
    }

    @PostMapping("/tim-kiem-anh")
    public String search(@RequestParam("file") MultipartFile file, Model model) throws Exception {

        List<String> labels = aiService.recognize(file);

        Set<Integer> productIds = new LinkedHashSet<>();
        for (String label : labels) {
            for (ProductImage pi : imgDao.findByLabelContaining(label)) {
                productIds.add(pi.getProduct().getId());
            }
        }

        List<Product> results = productIds.stream()
                .map(id -> proDao.findById(id).orElse(null))
                .filter(Objects::nonNull)
                .collect(Collectors.toList());

        model.addAttribute("keywords", labels);
        model.addAttribute("products", results);
        return "search-by-image";
    }
}