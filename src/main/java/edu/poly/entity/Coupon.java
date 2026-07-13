package edu.poly.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// MỚI: mã giảm giá áp dụng cho toàn đơn hàng khi checkout
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Coupons")
public class Coupon implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Integer id;

    @Column(name = "Code", unique = true, nullable = false)
    private String code;

    // 1 = giảm theo phần trăm, 2 = giảm số tiền cố định
    @Column(name = "DiscountType", nullable = false)
    private Integer discountType;

    @Column(name = "DiscountValue", nullable = false)
    private Double discountValue;

    @Column(name = "MinOrderValue")
    private Double minOrderValue = 0.0;

    @Column(name = "MaxUsage")
    private Integer maxUsage;

    @Column(name = "UsedCount")
    private Integer usedCount = 0;

    @Temporal(TemporalType.DATE)
    @Column(name = "StartDate")
    private Date startDate;

    @Temporal(TemporalType.DATE)
    @Column(name = "EndDate")
    private Date endDate;

    @Column(name = "IsActive")
    private Boolean isActive = true;

    // Kiểm tra coupon còn hợp lệ để áp dụng hay không (chưa hết hạn, chưa hết lượt, còn active)
    public boolean isValidNow(Double orderSubTotal) {
        Date today = new Date();
        boolean withinDate = !today.before(startDate) && !today.after(endDate);
        boolean underLimit = maxUsage == null || usedCount < maxUsage;
        boolean meetsMinOrder = orderSubTotal != null && orderSubTotal >= minOrderValue;
        return Boolean.TRUE.equals(isActive) && withinDate && underLimit && meetsMinOrder;
    }

    // Tính số tiền được giảm dựa trên loại coupon
    public double calculateDiscount(double orderSubTotal) {
        if (discountType == 1) { // %
            return Math.round(orderSubTotal * (discountValue / 100.0) * 100.0) / 100.0;
        }
        return Math.min(discountValue, orderSubTotal); // số tiền cố định, không vượt quá tổng đơn
    }
}