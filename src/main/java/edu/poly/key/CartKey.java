package edu.poly.key;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Embeddable
public class CartKey implements Serializable {

    // ĐÃ ĐỔI: trước là "username" (String), giờ là "accountId" (Integer)
    // vì bảng Carts.AccountId giờ tham chiếu Accounts.Id (số) thay vì Accounts.Username (chuỗi)
    @Column(name = "AccountId")
    private Integer accountId;

    @Column(name = "ProductId")
    private Integer productId;
}