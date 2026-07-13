package edu.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import edu.poly.entity.ProductImage;

public interface ProductImageDAO extends JpaRepository<ProductImage, Integer> {

    List<ProductImage> findByProduct_Id(Integer productId);

    @Query("SELECT pi FROM ProductImage pi WHERE "
         + "LOWER(pi.aiLabels) LIKE LOWER(CONCAT('%', :label, '%'))")
    List<ProductImage> findByLabelContaining(@Param("label") String label);
}