package com.vn.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.vn.entity.phone;
public interface phoneDao extends JpaRepository<phone, Integer> {	
	@Query(value = "EXEC GetTop7Phones", nativeQuery = true)
    List<Object[]> getTop7Phones();
   
}
