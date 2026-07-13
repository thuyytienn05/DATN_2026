package edu.poly.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Accounts")
public class Account implements Serializable {

    // ĐÃ ĐỔI: khóa chính giờ là Id (số, tự tăng) thay vì Username
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Integer id;

    // Username không còn là khóa chính, nhưng vẫn NOT NULL + UNIQUE, vẫn dùng để đăng nhập như cũ
    @NotBlank(message = "Username không được để trống")
    @Column(name = "Username", nullable = false, unique = true)
    private String username;

    // ĐÃ ĐỔI: cột DB tên là PasswordHash (nên lưu mật khẩu đã hash, không lưu plain text)
    @NotBlank(message = "Password không được để trống")
    @Column(name = "PasswordHash", nullable = false)
    private String password;

    @NotBlank(message = "Fullname không được để trống")
    @Column(name = "FullName", nullable = false)
    private String fullname;

    @NotBlank(message = "Email không được để trống")
    @Email(message = "Email không hợp lệ")
    @Column(name = "Email", nullable = false, unique = true)
    private String email;

    @Column(name = "Photo")
    private String photo;

    // ĐÃ ĐỔI: tên cột DB là IsActivated
    @Column(name = "IsActivated", nullable = false)
    private Boolean activated = false;

    // ĐÃ ĐỔI: tên cột DB là IsAdmin
    @Column(name = "IsAdmin", nullable = false)
    private Boolean admin = false;

    @OneToMany(mappedBy = "account")
    private List<Order> orders;

    @OneToMany(mappedBy = "accountCart")
    private List<Cart> accountCarts;
}