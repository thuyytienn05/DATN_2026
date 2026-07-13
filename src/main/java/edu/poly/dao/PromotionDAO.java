package edu.poly.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface PromotionDAO extends JpaRepository<edu.poly.entity.Promotion, Integer> {

    List<edu.poly.entity.Promotion> findByProduct_Id(Integer productId);
}