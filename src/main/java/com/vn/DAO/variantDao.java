package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.vn.entity.color;
import com.vn.entity.system;
import com.vn.entity.variant;

public interface variantDao extends JpaRepository<variant, Integer> {
	@Query("select sum(v.QUANTITY) from variant v")
	long totalSumProduct();
}
