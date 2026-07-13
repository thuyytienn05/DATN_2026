package edu.poly.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import lombok.Data;

@Data
@Entity
@Table(name = "Categories")
public class Category implements Serializable {

    // ĐÃ ĐỔI: trước là String Length(4) (vd "ca01"), giờ là Integer tự tăng
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Integer id;

    @NotBlank
    @Column(name = "Name")
    private String name;

    // ĐÃ ĐỔI: tên cột DB là IsDeleted (trước là is_delete)
    @Column(name = "IsDeleted")
    private Boolean isDelete = false;

    @OneToMany(mappedBy = "category")
    private List<Product> products;
}