package edu.poly.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import edu.poly.dao.AccountDAO;
import edu.poly.dao.CategoryDAO;
import edu.poly.dao.OrderDAO;
import edu.poly.dao.ProductDAO;
import edu.poly.entity.Account;
import edu.poly.entity.Category;
import edu.poly.entity.Order;
import edu.poly.entity.Product;
import edu.poly.entity.ProductImage;

import javax.servlet.ServletContext;
import javax.servlet.annotation.MultipartConfig;
import edu.poly.entity.ProductSalesDto;
import edu.poly.service.OrderDetailService;

@Controller
@MultipartConfig
public class AdminController {
	
	@Autowired
	AccountDAO accDao;
	
	@Autowired
	ProductDAO proDao;
	
	@Autowired
	CategoryDAO caDao;
	
	@Autowired
	OrderDAO orDao;
	
	@Autowired
	ServletContext app;
	
	@GetMapping("/admin/user")
public String user(Model model,
        @ModelAttribute("userEdit") Account account,
        @RequestParam("name") Optional<String> name) {

    model.addAttribute(
            "accountList",
            accDao.findAllByFullnameContaining(name.orElse(""))
    );

    model.addAttribute("name", name.orElse(""));
    return "admin/user-list";
}
	@GetMapping("/product/report")
	public String report(Model model) {
	    System.out.println("Report Controller is called");
	    model.addAttribute("items", proDao.getInventoryByCategory());
	    return "admin/tonkho";
	}

	@GetMapping("/admin/user/delete/{id}")
public String user_delete(
        @PathVariable Integer id,
        Model model) {

    Optional<Account> op = accDao.findById(id);

    if (op.isPresent()) {
        Account acc = op.get();
        acc.setActivated(false);
        accDao.save(acc);
        model.addAttribute("success_user_delete", true);
    }
    return "admin/user-list";
}
	
	@PostMapping("/admin/user/edit")
public String user_update(
        @Validated
        @ModelAttribute("userEdit") Account account,
        BindingResult result,
        Model model,
        @RequestParam("image")
        Optional<MultipartFile> file) {

    if (account.getId() == null ||
        !accDao.existsById(account.getId())) {

        model.addAttribute("error_user_update", true);

    } else {

        if (file.isPresent() && !file.get().isEmpty()) {

            try {
                String fileName = StringUtils.cleanPath(
                        file.get().getOriginalFilename());

                String uploadDir =
                        "src/main/resources/static/assets/img/avatars/";

                Path uploadPath = Paths.get(uploadDir);

                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }

                Path filePath =
                        uploadPath.resolve(fileName);

                Files.copy(
                        file.get().getInputStream(),
                        filePath,
                        StandardCopyOption.REPLACE_EXISTING);

                account.setPhoto(fileName);

            } catch (IOException e) {
                e.printStackTrace();
                model.addAttribute(
                        "error_file_upload",
                        "Lỗi khi tải ảnh lên!");
            }

        } else {

            Account oldAccount =
                    accDao.findById(account.getId())
                          .orElse(null);

            if (oldAccount != null) {
                account.setPhoto(oldAccount.getPhoto());
            }
        }

        accDao.save(account);
        model.addAttribute("success_user_update", true);
    }

    return "admin/user-list";
}

	
@GetMapping("/admin/product")
public String product(
        Model model,
        @ModelAttribute("productEdit") Product product,
        @RequestParam("name") Optional<String> name) {

    model.addAttribute(
            "productList",
            proDao.findAllByNameContaining(name.orElse(""))
    );

    model.addAttribute("name", name.orElse(""));

    return "admin/product-list";
}
	
	@GetMapping("/admin/product/delete/{id}")
public String product_delete(
        @ModelAttribute("productEdit") Product product,
        @PathVariable("id") Integer id,
        Model model) {

    Product pro = proDao.findById(id).orElse(null);

    if (pro == null) {
        model.addAttribute("error_product_delete", true);
    } else {
        pro.setIsDelete(true);
        proDao.save(pro);
        model.addAttribute("success_product_delete", true);
    }

    return "admin/product-list";
}
	
	@PostMapping("/admin/product/edit")
public String product_update(
        @Validated
        @ModelAttribute("productEdit") Product product,
        BindingResult result,
        Model model,
        @RequestParam("categoryId") Integer caId) {

    if (product.getId() == null ||
            !proDao.existsById(product.getId())) {

        model.addAttribute(
                "error_product_update",
                true);
    }
    else {

        Product oldProduct =
                proDao.findById(product.getId())
                      .orElse(null);

        if (oldProduct != null) {
            product.setImages(oldProduct.getImages());
            product.setIsDelete(
                    oldProduct.getIsDelete());
        }

        Category category =
                caDao.findById(caId)
                     .orElse(null);

        product.setCategory(category);

        proDao.save(product);

        model.addAttribute(
                "success_product_update",
                true);
    }

    return "admin/product-list";
}
	@GetMapping("/admin/order")
	public String order(Model model, @RequestParam("id") Optional<Long> id) {
		if(id.orElse((long)0)!=0) {
			List<Order> list = new ArrayList<>();
			list.add(orDao.findById(id.orElse((long)0)).get());
			model.addAttribute("orderList", list);
		}
		model.addAttribute("id", (id.orElse((long)0)==0)?"":id.orElse((long)0));
		return "admin/order-list";
	}
	
	@GetMapping("/admin/add-product")
	public String add_product(Model model, @ModelAttribute("productAdd") Product product) {
		return "admin/add-product";
	}
	
	@PostMapping("/admin/add-product")
public String add_product_post(
        Model model,
        @ModelAttribute("productAdd") Product product,
        @RequestParam("images") MultipartFile[] files,
        @RequestParam("categoryId") Integer categoryId) {

    try {

        product.setCategory(
                caDao.findById(categoryId).orElse(null));

        product = proDao.save(product);

        List<ProductImage> images =
                new ArrayList<>();

        int sort = 0;

        for (MultipartFile file : files) {

            if (file.isEmpty()) {
                continue;
            }

            String fileName =
                    StringUtils.cleanPath(
                            file.getOriginalFilename());

            Path path = Paths.get(
                    app.getRealPath(
                            "/assets/img/product/"
                                    + fileName));

            Files.copy(
                    file.getInputStream(),
                    path,
                    StandardCopyOption.REPLACE_EXISTING);

            ProductImage img =
                    new ProductImage();

            img.setProduct(product);
            img.setImageUrl(fileName);
            img.setSortOrder(sort++);
            img.setIsPrimary(sort == 1);

            images.add(img);
        }

        product.setImages(images);

        proDao.save(product);

        model.addAttribute(
                "success_product_add",
                true);

    } catch (Exception e) {
        e.printStackTrace();
        model.addAttribute(
                "error_product_add",
                true);
    }

    return "admin/add-product";
}
	
	@ModelAttribute("productList")
	public List<Product> productList(){
		return proDao.findAll();
	}
	
	@ModelAttribute("categories")
	public List<Category> categories(){
		return caDao.findAll();
	}
	
	@ModelAttribute("accountList")
	public List<Account> accountList(){
		return accDao.findAll();
	}
	
	@ModelAttribute("orderList")
	public List<Order> orderList(){
		return orDao.findAll();
	}
	@GetMapping("/admin/danhmuc")
	public String category_index(Model model, @ModelAttribute("categoryItem") Category ca) {
		ca.setId(null);
		ca.setName(null);
		model.addAttribute("categoryItems", caDao.findAll());
		return "admin/danhmuc";
	}
	
	@PostMapping("/admin/create")
	public String category_create(Model model, @Validated @ModelAttribute("categoryItem") Category ca, BindingResult result) {
		if(!result.hasErrors()) {
			if(!caDao.findById(ca.getId()).isEmpty())
				model.addAttribute("error_category", "Id đã tồn tại!");
			else {
				caDao.save(ca);
				model.addAttribute("success_category", "Create success!");
			}
		}
		model.addAttribute("categoryItems", caDao.findAll());
		return "admin/danhmuc";
	}
	
	@PostMapping("/admin/update")
	public String category_update(Model model, @Validated @ModelAttribute("categoryItem") Category ca, BindingResult result) {
		if(!result.hasErrors()) {
			if(caDao.findById(ca.getId()).isEmpty())
				model.addAttribute("error_category", "Id không tồn tại!");
			else {
				caDao.save(ca);
				model.addAttribute("success_category", "Update success!");
			}
		}
		model.addAttribute("categoryItems", caDao.findAll());
		return "admin/danhmuc";
	}
	
	@PostMapping("/admin/delete")
public String category_delete(Model model,
        @ModelAttribute("categoryItem") Category ca) {

    if (ca.getId() == null) {
        model.addAttribute("error_category", "Vui lòng chọn danh mục!");
    }
    else if (!caDao.existsById(ca.getId())) {
        model.addAttribute("error_category", "Id không tồn tại!");
    }
    else {
        caDao.deleteById(ca.getId());
        model.addAttribute("success_category", "Delete success!");
    }

    model.addAttribute("categoryItems", caDao.findAll());
    return "admin/danhmuc";
}
	@GetMapping("/admin/edit")
public String category_edit(Model model,
        @RequestParam("id") Integer id,
        @ModelAttribute("categoryItem") Category ca) {

    if (!caDao.existsById(id)) {
        return "redirect:/admin/danhmuc";
    }

    Category category = caDao.findById(id).get();

    ca.setId(category.getId());
    ca.setName(category.getName());

    model.addAttribute("categoryItems", caDao.findAll());
    return "admin/danhmuc";
}
	
	@GetMapping("/admin/delete")
public String category_delete(Model model,
        @RequestParam("id") Integer id,
        @ModelAttribute("categoryItem") Category ca) {

    if (!caDao.existsById(id)) {
        return "redirect:/admin/danhmuc";
    }

    caDao.deleteById(id);
    model.addAttribute("success_category", "Delete success!");
    model.addAttribute("categoryItems", caDao.findAll());

    return "admin/danhmuc";
}
	
	@Autowired
	private OrderDetailService orderDetailService;  // Sử dụng Service thay vì DAO

	@RequestMapping("/admin/stats")
	public String showStats(Model model) {
	    List<ProductSalesDto> productSales = new ArrayList<>();
	    try {
	        productSales = orderDetailService.getProductSales();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    model.addAttribute("productSales", productSales);
	    return "admin/stats";
	}
}
