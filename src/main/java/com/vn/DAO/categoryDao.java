package com.vn.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.vn.entity.category;
import com.vn.entity.color;

public interface categoryDao extends JpaRepository<category, Integer> {
	
}
