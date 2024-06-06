package com.vn.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.vn.entity.color;
import com.vn.entity.phone;
import com.vn.entity.ProductStore;
import com.vn.entity.system;

public interface phoneDao extends JpaRepository<phone, Integer> {	
	@Query(value = "EXEC GetTop7Phones", nativeQuery = true)
    List<Object[]> getTop7Phones();
   
}
