package edu.poly.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor // <-- Thêm nếu cần thiết
public class ProductSalesDto {
    private String productName;
    private Long totalSold;  // Đúng kiểu dữ liệu
    private Double revenue;
}
