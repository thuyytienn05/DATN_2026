package edu.poly.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import edu.poly.entity.Account;
import edu.poly.entity.Order;

public interface OrderDAO extends JpaRepository<Order, Long> {

  List<Order> findByAccountOrderByCreateDateDesc(Account account);

    List<Order> findByStatus(Integer status);
}