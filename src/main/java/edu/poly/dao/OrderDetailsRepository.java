package edu.poly.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import edu.poly.entity.OrderDetail;
import edu.poly.entity.ProductSalesDto;

public interface OrderDetailsRepository
        extends JpaRepository<OrderDetail, Long> {

    @Query("""
            SELECT new edu.poly.entity.ProductSalesDto(
                p.name,
                SUM(CAST(o.quantity AS long)),
                SUM(o.quantity * p.price)
            )
            FROM OrderDetail o
            JOIN o.product p
            GROUP BY p.name
            """)
    List<ProductSalesDto> getSalesStats();
}