package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.vn.entity.order;
import org.springframework.stereotype.Repository;

@Repository
public interface orderDao extends JpaRepository<order, Integer> {
	@Query("select count(o) from order o")
	long countOrder();

}
