package edu.poly.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Orders")
public class Order implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String address;

    // MỚI: tổng tiền hàng trước khi giảm giá
    @Column(name = "SubTotal")
    private Double subTotal;

    // MỚI: số tiền được giảm (từ coupon)
    @Column(name = "DiscountAmount")
    private Double discountAmount = 0.0;

    private Double total;

    // ĐÃ ĐỔI: trước là Boolean (chỉ 0/1), giờ là Integer (0..4) để thể hiện nhiều trạng thái hơn:
    // 0 = Chờ xác nhận, 1 = Đã xác nhận, 2 = Đang giao, 3 = Hoàn tất, 4 = Đã hủy
    // LƯU Ý QUAN TRỌNG: chỗ nào code cũ đang so sánh order.getStatus() như Boolean
    // (vd if (order.getStatus())) sẽ phải sửa lại thành so sánh số, vd: order.getStatus() == 3
    @Column(name = "Status")
    private Integer status = 0;

    @Temporal(TemporalType.DATE)
    @Column(name = "CreateDate")
    private Date createDate = new Date();

    // ĐÃ ĐỔI: JoinColumn từ "Username" -> "AccountId"
    @ManyToOne
    @JoinColumn(name = "AccountId")
    private Account account;

    // MỚI: mã giảm giá đã áp dụng cho đơn này (có thể null nếu không dùng coupon)
    @ManyToOne
    @JoinColumn(name = "CouponId")
    private Coupon coupon;

    @OneToMany(mappedBy = "order")
    private List<OrderDetail> orderDetails;

    // Helper tiện dùng trong JSP thay vì so sánh số "ma thuật"
    public boolean isCompleted() {
        return status != null && status == 3;
    }

    public boolean isCancelled() {
        return status != null && status == 4;
    }
}