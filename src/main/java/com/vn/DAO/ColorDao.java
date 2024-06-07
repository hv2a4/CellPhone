package com.vn.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.vn.entity.color;
import org.springframework.stereotype.Repository;

@Repository
public interface ColorDao extends JpaRepository<color, Integer> {
	
//	@Query("SELECT c.ID, c.NAME FROM color c WHERE c.ID = ?1")
//	color findByIDddd(int id);
	
}
