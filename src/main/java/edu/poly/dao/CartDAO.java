package edu.poly.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import edu.poly.entity.Account;
import edu.poly.entity.Cart;
import edu.poly.entity.Product;
import edu.poly.key.CartKey;

public interface CartDAO extends JpaRepository<Cart, CartKey> {

    List<Cart> findByAccountCart(Account account);

    List<Cart> findByProductCart(Product product);

    void deleteByAccountCart(Account account);
}