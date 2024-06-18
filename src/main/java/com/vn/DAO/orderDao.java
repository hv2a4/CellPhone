package com.vn.DAO;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.vn.entity.discount_code;
import com.vn.entity.invoice;
import com.vn.entity.order;
import com.vn.entity.user;

import org.springframework.stereotype.Repository;

@Repository
public interface orderDao extends JpaRepository<order, Integer> {
	@Query("select count(o) from order o")
	long countOrder();

//	List<Product> findByPriceBetween(double minPrice, double maxPrice);
	List<order> findByUser(user user, Sort sort);
	
	@Query("SELECT o FROM order o WHERE o.ID = (SELECT MAX(o2.ID) FROM order o2)")
    order getOrderMoi();
	@Query("SELECT MAX(o2.ID) as ID FROM order o2")
	Integer maOrder();
	
	@Query("SELECT o FROM order o ORDER BY o.UPDATE_AT DESC")
	List<order> findAllSX();
	
	@Query("SELECT o FROM order o ORDER BY o.UPDATE_AT DESC")
	Page<order> findAllSX(Pageable pageable);
}
