package com.vn.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.vn.entity.order;
import com.vn.entity.user;

import org.springframework.stereotype.Repository;

@Repository
public interface orderDao extends JpaRepository<order, Integer> {
	@Query("select count(o) from order o")
	long countOrder();

//	List<Product> findByPriceBetween(double minPrice, double maxPrice);
	List<order> findByUser(user user);
}
