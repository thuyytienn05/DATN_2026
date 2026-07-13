package edu.poly.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// MỚI: khuyến mãi giảm giá % áp dụng trực tiếp trên từng sản phẩm
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Promotions")
public class Promotion implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "ProductId")
    private Product product;

    @Column(name = "DiscountPercent")
    private Double discountPercent;

    @Temporal(TemporalType.DATE)
    @Column(name = "StartDate")
    private Date startDate;

    @Temporal(TemporalType.DATE)
    @Column(name = "EndDate")
    private Date endDate;

    @Column(name = "IsActive")
    private Boolean isActive = true;
}