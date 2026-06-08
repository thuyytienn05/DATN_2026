package edu.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import edu.poly.entity.OrderDetail;
import edu.poly.entity.ProductSalesDto;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long>{

	// Lấy danh sách OrderDetail theo Order ID
    List<OrderDetail> findByOrderId(Long orderId);

    // Lấy danh sách OrderDetail theo Product ID
    List<OrderDetail> findByProductId(Long productId);

    // Truy vấn tổng tiền của một đơn hàng
    @Query("SELECT SUM(od.price * od.quantity) FROM OrderDetail od WHERE od.order.id = :orderId")
    Double getTotalAmountByOrderId(@Param("orderId") Long orderId);

    // Thống kê doanh thu sản phẩm
    @Query("SELECT new edu.poly.entity.ProductSalesDto(od.product.name, SUM(od.quantity), SUM(od.price * od.quantity)) " +
           "FROM OrderDetail od GROUP BY od.product.name")
    List<ProductSalesDto> getProductSales();

}
