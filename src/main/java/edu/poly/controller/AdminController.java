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
	public String user(Model model, @ModelAttribute("userEdit") Account account, @RequestParam("name") Optional<String> name) {
		model.addAttribute("accountList", accDao.findAllByFullnameLike("%"+name.orElse("")+"%"));
		model.addAttribute("name", name.orElse(""));
		return "admin/user-list";
	}
	@GetMapping("/product/report")
	public String report(Model model) {
	    System.out.println("Report Controller is called");
	    model.addAttribute("items", proDao.getInventoryByCategory());
	    return "admin/tonkho";
	}

	@GetMapping("/admin/user/delete/{username}")
	public String user_delete(@ModelAttribute("userEdit") Account account, @PathVariable("username") String username, Model model) {
		if(accDao.existsById(username)) {
			Account acc = accDao.findById(username).get();
			acc.setActivated(false);
			accDao.save(acc);
			model.addAttribute("success_user_delete", true);
		}
		else 
			model.addAttribute("error_user_delete", true);
		return "admin/user-list";
	}
	
	@PostMapping("/admin/user/edit")
	public String user_update(@Validated @ModelAttribute("userEdit") Account account,
	                          BindingResult result,
	                          Model model,
	                          @RequestParam("image") Optional<MultipartFile> file) {
	    if (!accDao.existsById(account.getUsername())) {
	        model.addAttribute("error_user_update", true);
	    } else {
	        // Kiểm tra nếu file được upload
	        if (file.isPresent() && !file.get().isEmpty()) {
	            try {
	                // Lấy tên file an toàn
	                String fileName = StringUtils.cleanPath(file.get().getOriginalFilename());

	                // Đường dẫn thư mục lưu file (có thể đổi sang "upload-dir" nếu cần)
	                String uploadDir = "src/main/resources/static/assets/img/avatars/";

	                // Đảm bảo thư mục tồn tại
	                Path uploadPath = Paths.get(uploadDir);
	                if (!Files.exists(uploadPath)) {
	                    Files.createDirectories(uploadPath);
	                }

	                // Lưu file vào server
	                Path filePath = uploadPath.resolve(fileName);
	                Files.copy(file.get().getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

	                // Lưu tên file vào database
	                account.setPhoto(fileName);
	            } catch (IOException e) {
	                e.printStackTrace();
	                model.addAttribute("error_file_upload", "Lỗi khi tải ảnh lên!");
	            }
	        } else {
	            // Giữ nguyên ảnh cũ nếu không upload ảnh mới
	            account.setPhoto(accDao.findById(account.getUsername()).get().getPhoto());
	        }

	        // Lưu thông tin user
	        accDao.save(account);
	        model.addAttribute("success_user_update", true);
	    }

	    return "admin/user-list";
	}

	
	@GetMapping("/admin/product")
	public String product(Model model, @ModelAttribute("productEdit") Product product, @RequestParam("name") Optional<String> name) {
		model.addAttribute("productList", proDao.findAllBynameLike("%"+name.orElse("")+"%"));
		model.addAttribute("name", name.orElse(""));
		return "admin/product-list";
	}
	
	@GetMapping("/admin/product/delete/{id}")
	public String product_delete(@ModelAttribute("productEdit") Product product, @PathVariable("id") Integer id, Model model) {
		if(proDao.existsById(id)) {
			Product pro = proDao.findById(id).get();
			pro.setIsDelete(true);
			proDao.save(pro);
			model.addAttribute("success_product_delete", true);
		}
		else 
			model.addAttribute("error_product_delete", true);
		return "admin/product-list";
	}
	
	@PostMapping("/admin/product/edit")
	public String product_update(@Validated @ModelAttribute("productEdit") Product product, BindingResult result, Model model, @RequestParam("categoryId") String caId) {
		if(!proDao.existsById(product.getId()))
			model.addAttribute("error_product_update", true);
		else {
			product.setImage(proDao.findById(product.getId()).get().getImage());
			product.setCategory(caDao.findById(caId).get());
			product.setIsDelete(!product.getIsDelete());
			proDao.save(product);
			model.addAttribute("success_product_update", true);
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
	public String add_product_post(Model model, @ModelAttribute("productAdd") Product product, @RequestParam("images") MultipartFile[] files, @RequestParam("categoryId") String categoryId) {
		String imgs = "";
		for(MultipartFile file:files) {
			String fileName = StringUtils.cleanPath(file.getOriginalFilename());
	        // save the file on the local file system
	        try {
	            Path path = Paths.get(app.getRealPath("/assets/img/product/"+fileName));
	            Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
	            imgs+=(fileName+",");
	        } catch (IOException e) {
	            e.printStackTrace();
	    		model.addAttribute("error_product_add", true);
	        }
		}
		product.setCategory(caDao.findById(categoryId).get());
		product.setImage(imgs.substring(0, imgs.length()-1));
		proDao.save(product);
		model.addAttribute("success_product_add", true);
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
	public String category_delete(Model model, @ModelAttribute("categoryItem") Category ca) {
		if(ca.getId().length() == 4) {
			if(caDao.findById(ca.getId()).isEmpty())
				model.addAttribute("error_category", "Id không tồn tại!");
			else {
				caDao.deleteById(ca.getId());
				model.addAttribute("success_category", "Delete success!");
			}
		}
		else 
			model.addAttribute("error_category", "Độ dài id loại hàng là 4 ký tự!");
		model.addAttribute("categoryItems", caDao.findAll());
		return "admin/danhmuc";
	}
	
	@GetMapping("/admin/edit")
	public String category_edit(Model model, @RequestParam("id") String id, @ModelAttribute("categoryItem") Category ca) {
		if(caDao.findById(ca.getId()).isEmpty())
			return "redirect:/category/index";
		else {
			Category category = caDao.findById(id).get();
			ca.setId(category.getId());
			ca.setName(category.getName());
		}
		model.addAttribute("categoryItems", caDao.findAll());
		return "admin/danhmuc";
	}
	
	@GetMapping("/admin/delete")
	public String category_delete(Model model, @RequestParam("id") String id, @ModelAttribute("categoryItem") Category ca) {
		if(caDao.findById(ca.getId()).isEmpty())
			return "redirect:/category/index";
		else {
			caDao.deleteById(id);
			model.addAttribute("success_category", "Delete success!");
		}
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
