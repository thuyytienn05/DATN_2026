package edu.poly.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.poly.dao.OrderDetailDAO;
import edu.poly.entity.ProductSalesDto;

@Service
public class OrderDetailService {
    @Autowired
    private OrderDetailDAO orderDetailDAO;

    public List<ProductSalesDto> getProductSales() {  // Trả về List<ProductSalesDto>
        return (List<ProductSalesDto>) orderDetailDAO.getProductSales();
    }
}
