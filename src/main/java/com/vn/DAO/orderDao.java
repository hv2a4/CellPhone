package com.vn.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.vn.entity.order;

public interface orderDao extends JpaRepository<order, Integer> {
	@Query("select count(o) from order o")
	long countOrder();

}
