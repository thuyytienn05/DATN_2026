package edu.poly.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import lombok.Data;

@Data
@Entity
@Table(name = "Products")
public class Product implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Integer id;

    @Column(name = "Name")
    private String name;

    // MỚI: mô tả sản phẩm (cột Description trong DB mới)
    @Column(name = "Description")
    private String description;

    @Column(name = "Price")
    private Double price;

    @Column(name = "Quantity")
    private Integer quantity;

    @Temporal(TemporalType.DATE)
    @Column(name = "CreateDate")
    private Date createDate = new Date();

    // ĐÃ ĐỔI: tên cột DB là IsDeleted (trước là isDelete - Hibernate tự map isDelete->IsDelete,
    // giờ khai báo rõ để chắc chắn khớp)
    @Column(name = "IsDeleted")
    private Boolean isDelete = false;

    @ManyToOne
    @JoinColumn(name = "CategoryId")
    private Category category;

    @OneToMany(mappedBy = "product")
    private List<OrderDetail> orderDetails;

    @OneToMany(mappedBy = "productCart")
    private List<Cart> productCarts;

    // MỚI: 1 sản phẩm có nhiều ảnh (bảng ProductImages), thay cho cột "image" cũ
    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
    @OrderBy("sortOrder ASC")
    private List<ProductImage> images;

    // MỚI: các đợt khuyến mãi áp dụng cho sản phẩm này
    @OneToMany(mappedBy = "product")
    private List<Promotion> promotions;

    // GIỮ TƯƠNG THÍCH NGƯỢC: code/JSP cũ gọi product.getImage() sẽ không bị vỡ hoàn toàn,
    // trả về ảnh đại diện (ảnh đầu tiên) thay vì lỗi NoSuchMethod.
    // Khuyến khích dần chuyển JSP sang dùng product.getImages() để hiển thị nhiều ảnh.
    @Transient
    public String getImage() {
        if (images == null || images.isEmpty()) {
            return null;
        }
        return images.stream()
                .filter(img -> Boolean.TRUE.equals(img.getIsPrimary()))
                .findFirst()
                .orElse(images.get(0))
                .getImageUrl();
    }

    // MỚI: giá sau khuyến mãi đang hoạt động (nếu có), tiện dùng ngoài JSP
    @Transient
    public Double getFinalPrice() {
        if (promotions == null || promotions.isEmpty()) {
            return price;
        }
        Date today = new Date();
        return promotions.stream()
                .filter(p -> Boolean.TRUE.equals(p.getIsActive())
                        && !today.before(p.getStartDate())
                        && !today.after(p.getEndDate()))
                .map(Promotion::getDiscountPercent)
                .max(Double::compareTo)
                .map(percent -> Math.round(price * (1 - percent / 100.0) * 100.0) / 100.0)
                .orElse(price);
    }
}