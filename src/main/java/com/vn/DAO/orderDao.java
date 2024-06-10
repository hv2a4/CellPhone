package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.vn.entity.order;
import org.springframework.stereotype.Repository;

@Repository
public interface orderDao extends JpaRepository<order, Integer> {
	@Query("select count(o) from order o")
	long countOrder();
	
	@Query("SELECT o FROM order o WHERE o.ID = (SELECT MAX(o2.ID) FROM order o2)")
    order getOrderMoi();
	@Query("SELECT MAX(o2.ID) as ID FROM order o2")
	Integer maOrder();
}
