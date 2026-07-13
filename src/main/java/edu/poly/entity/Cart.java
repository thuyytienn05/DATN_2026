package edu.poly.entity;

import edu.poly.key.CartKey;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "Carts")
public class Cart {
    @EmbeddedId
    private CartKey id;

    // ĐÃ ĐỔI: MapsId từ "username" -> "accountId", JoinColumn từ "username" -> "AccountId"
    @ManyToOne
    @MapsId("accountId")
    @JoinColumn(name = "AccountId")
    private Account accountCart;

    @ManyToOne
    @MapsId("productId")
    @JoinColumn(name = "ProductId")
    private Product productCart;

    private int quantity;
}