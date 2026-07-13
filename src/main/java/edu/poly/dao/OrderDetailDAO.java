package edu.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import edu.poly.entity.OrderDetail;
import edu.poly.entity.ProductSalesDto;

import javax.transaction.Transactional;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long> {

    List<OrderDetail> findByOrderId(Long orderId);

    List<OrderDetail> findByProductId(Integer productId);
    
        
    @Query("""
            SELECT SUM(od.price * od.quantity)
            FROM OrderDetail od
            WHERE od.order.id = :orderId
            """)
    Double getTotalAmountByOrderId(
            @Param("orderId") Long orderId);

    @Query("""
            SELECT new edu.poly.entity.ProductSalesDto(
                od.product.name,
                SUM(CAST(od.quantity AS long)),
                SUM(od.price * od.quantity)
            )
            FROM OrderDetail od
            GROUP BY od.product.name
            """)
    List<ProductSalesDto> getProductSales();
    @Modifying
    @Transactional
    @Query("DELETE FROM OrderDetail od WHERE od.order.id = :orderId")
    void deleteByOrderId(@Param("orderId") Long orderId);
}