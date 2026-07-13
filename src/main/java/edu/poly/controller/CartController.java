package edu.poly.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.poly.dao.AccountDAO;
import edu.poly.dao.CartDAO;
import edu.poly.dao.OrderDAO;
import edu.poly.dao.OrderDetailDAO;
import edu.poly.dao.ProductDAO;
import edu.poly.entity.Account;
import edu.poly.entity.Cart;
import edu.poly.entity.Order;
import edu.poly.entity.OrderDetail;
import edu.poly.entity.Product;
import edu.poly.key.CartKey;
import edu.poly.service.SessionService;

@Controller
public class CartController {

	@Autowired
	CartDAO cartDao;

	@Autowired
	AccountDAO accDao;

	@Autowired
	ProductDAO proDao;

	@Autowired
	OrderDAO orDao;

	@Autowired
	OrderDetailDAO deDao;

	@Autowired
	SessionService session;

	// MỚI: lấy giỏ hàng tạm (guest) trong session, tạo mới nếu chưa có
	private List<Cart> getGuestCart() {
		List<Cart> guestCart = session.get("guestCart");
		if (guestCart == null) {
			guestCart = new ArrayList<>();
		}
		return guestCart;
	}

	// MỚI: refetch lại Product mới từ DB cho từng item trong giỏ khách vãng lai,
	// tránh lỗi LazyInitializationException do entity Product cũ bị detached khỏi Hibernate Session
	private List<Cart> refreshGuestCart(List<Cart> guestCart) {
		for (Cart ca : guestCart) {
			Product fresh = proDao.findById(ca.getProductCart().getId()).orElse(ca.getProductCart());
			ca.setProductCart(fresh);
		}
		return guestCart;
	}

	@GetMapping("/shop/cart")
	public String cart(Model model) {
		Account user = session.get("user");

		List<Cart> cart = (user != null)
				? cartDao.findByAccountCart(user)
				: refreshGuestCart(getGuestCart()); // ĐÃ SỬA

		Map<CartKey, Object[]> map = new HashMap<>();
		double totalCart = 0.0;
		for (Cart ca : cart) {
			totalCart += ca.getQuantity() * ca.getProductCart().getPrice();
			map.put(ca.getId(), new Object[] {
					ca.getAccountCart(),
					new Object[] {
							ca.getProductCart().getId(),
							ca.getProductCart().getName(),
							ca.getProductCart().getPrice(),
							ca.getProductCart().getImage() == null
									? new String[0]
									: ca.getProductCart().getImage().split(",", 0)
					},
					ca.getQuantity(),
					ca.getProductCart()
			});
		}
		model.addAttribute("products", map);
		model.addAttribute("numberCart", cart.size());
		model.addAttribute("totalCart", totalCart);
		return "shopping-cart";
	}

	@GetMapping("/shop/cart/add")
	public String cart_add(Model model,
			@RequestParam("id") Integer id,
			@RequestParam("qty") Integer qty) {

		Account user = session.get("user");

		Product product = proDao.findById(id).orElse(null);

		if (product == null) {
			return "redirect:/shop";
		}

		if (product.getQuantity() < qty) {
			return "redirect:/shop/cart";
		}

		if (user != null) {
			CartKey cartKey = new CartKey(user.getId(), id);
			Cart cart = cartDao.findById(cartKey).orElse(null);

			if (cart == null) {
				cart = new Cart(cartKey, user, product, qty);
			} else {
				cart.setQuantity(cart.getQuantity() + qty);
			}
			cartDao.save(cart);

		} else {
			List<Cart> guestCart = getGuestCart();

			Cart existing = null;
			for (Cart c : guestCart) {
				if (c.getProductCart().getId().equals(id)) {
					existing = c;
					break;
				}
			}

			if (existing == null) {
				CartKey guestKey = new CartKey(0, id);
				guestCart.add(new Cart(guestKey, null, product, qty));
			} else {
				existing.setQuantity(existing.getQuantity() + qty);
			}

			session.set("guestCart", guestCart);
		}

		return "redirect:/shop/cart";
	}

	@GetMapping("/shop/cart/update")
	public String cart_update(Model model,
			@RequestParam("id") Integer id,
			@RequestParam("qty") Integer qty) {

		Account user = session.get("user");

		Product product = proDao.findById(id).orElse(null);

		if (product == null) {
			return "redirect:/shop/cart";
		}

		if (product.getQuantity() >= qty) {
			if (user != null) {
				CartKey cartKey = new CartKey(user.getId(), id);
				Cart cart = new Cart(cartKey, user, product, qty);
				cartDao.save(cart);
			} else {
				List<Cart> guestCart = getGuestCart();
				for (Cart c : guestCart) {
					if (c.getProductCart().getId().equals(id)) {
						c.setQuantity(qty);
						break;
					}
				}
				session.set("guestCart", guestCart);
			}
		}

		List<Cart> carts = (user != null)
				? cartDao.findByAccountCart(user)
				: refreshGuestCart(getGuestCart()); // ĐÃ SỬA

		Map<CartKey, Object[]> map = new HashMap<>();
		double totalCart = 0.0;

		for (Cart ca : carts) {
			totalCart += ca.getQuantity() * ca.getProductCart().getPrice();

			map.put(ca.getId(), new Object[] {
					ca.getAccountCart(),
					new Object[] {
							ca.getProductCart().getId(),
							ca.getProductCart().getName(),
							ca.getProductCart().getPrice(),
							ca.getProductCart().getImage() == null
									? new String[0]
									: new String[] { ca.getProductCart().getImage() }
					},
					ca.getQuantity(),
					ca.getProductCart()
			});
		}

		model.addAttribute("products", map);
		model.addAttribute("numberCart", carts.size());
		model.addAttribute("totalCart", totalCart);

		return "shopping-cart";
	}

	@GetMapping("/shop/cart/delete")
	public String cart_delete(Model model,
			@RequestParam("id") Integer id) {

		Account user = session.get("user");

		if (user != null) {
			CartKey cartKey = new CartKey(user.getId(), id);
			if (cartDao.existsById(cartKey)) {
				cartDao.deleteById(cartKey);
			}
		} else {
			List<Cart> guestCart = getGuestCart();
			guestCart.removeIf(c -> c.getProductCart().getId().equals(id));
			session.set("guestCart", guestCart);
		}

		List<Cart> cart = (user != null)
				? cartDao.findByAccountCart(user)
				: refreshGuestCart(getGuestCart()); // ĐÃ SỬA

		Map<CartKey, Object[]> map = new HashMap<>();
		double totalCart = 0.0;

		for (Cart ca : cart) {
			totalCart += ca.getQuantity() * ca.getProductCart().getPrice();

			map.put(ca.getId(), new Object[] {
					ca.getAccountCart(),
					new Object[] {
							ca.getProductCart().getId(),
							ca.getProductCart().getName(),
							ca.getProductCart().getPrice(),
							ca.getProductCart().getImage() == null
									? new String[0]
									: ca.getProductCart().getImage().split(",", 0)
					},
					ca.getQuantity(),
					ca.getProductCart()
			});
		}

		model.addAttribute("products", map);
		model.addAttribute("numberCart", cart.size());
		model.addAttribute("totalCart", totalCart);

		return "shopping-cart";
	}

	@PostMapping("/shop/order")
	public String shopping_order(Model model, @RequestParam("address") String address) {
		Account user = session.get("user");

		if (user == null) {
			return "redirect:/sign-in";
		}

		List<Cart> cart = cartDao.findByAccountCart(user);
		List<OrderDetail> list = new ArrayList<>();
		double totalCart = 0.0;
		for (Cart ca : cart) {
			OrderDetail orDe = new OrderDetail();
			orDe.setPrice(ca.getProductCart().getPrice());
			orDe.setProduct(ca.getProductCart());
			orDe.setQuantity(ca.getQuantity());
			list.add(orDe);
			totalCart += ca.getQuantity() * ca.getProductCart().getPrice();
		}

		Order order = new Order();
		order.setAddress(address);
		order.setAccount(user);
		order.setOrderDetails(list);
		order.setCreateDate(new Date());
		order.setSubTotal(totalCart);
		order.setDiscountAmount(0.0);
		order.setTotal(totalCart);
		order.setStatus(0);

		Order or = orDao.saveAndFlush(order);

		for (Cart ca : cart) {
			OrderDetail orDe = new OrderDetail();
			orDe.setOrder(or);
			orDe.setPrice(ca.getProductCart().getPrice());
			orDe.setProduct(ca.getProductCart());
			orDe.setQuantity(ca.getQuantity());
			Product p = proDao.findById(ca.getProductCart().getId()).get();
			p.setQuantity(p.getQuantity() - ca.getQuantity());
			proDao.save(p);
			deDao.save(orDe);
			cartDao.delete(ca);
		}
		model.addAttribute("order_success", true);
		model.addAttribute("totalCart", 0);
		model.addAttribute("numberCart", 0);
		return "shopping-cart";
	}
}