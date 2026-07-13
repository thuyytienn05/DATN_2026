package edu.poly.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import edu.poly.entity.Category;
import edu.poly.entity.Product;
import edu.poly.entity.Report;

public interface ProductDAO
        extends JpaRepository<Product, Integer> {

    List<Product> findByPriceBetween(
            Double min,
            Double max);

    @Query("""
            select p
            from Product p
            where p.isDelete = false
            """)
    List<Product> findAllRandom();

    @Query("""
            select p
            from Product p
            where p.isDelete = false
            and p.name like :name
            and (:categoryId is null
                 or p.category.id = :categoryId)
            """)
    Page<Product> search(
            String name,
            Integer categoryId,
            Pageable pageable);

    @Query("""
            select p
            from Product p
            where p.isDelete = false
            and p.name like :name
            and (:categoryId is null
                 or p.category.id = :categoryId)
            and p.price >= :price
            """)
    Page<Product> searchPriceGreater(
            String name,
            Integer categoryId,
            Double price,
            Pageable pageable);

    @Query("""
            select p
            from Product p
            where p.isDelete = false
            and p.name like :name
            and (:categoryId is null
                 or p.category.id = :categoryId)
            and p.price between :min and :max
            """)
    Page<Product> searchPriceBetween(
            String name,
            Integer categoryId,
            Double min,
            Double max,
            Pageable pageable);

    List<Product> findAllByNameContaining(
            String name);

    List<Product> findByCategory(
            Category category);

    @Query("""
            select new edu.poly.entity.Report(
                p.category.name,
                sum(p.price),
                count(p)
            )
            from Product p
            group by p.category.name
            order by sum(p.price) desc
            """)
    List<Report> getInventoryByCategory();
}