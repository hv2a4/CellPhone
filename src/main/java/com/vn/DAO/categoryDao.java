package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.category;
import com.vn.entity.color;

public interface categoryDao extends JpaRepository<category, Integer> {

}
