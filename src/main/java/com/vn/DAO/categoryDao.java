package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.category;
import com.vn.entity.color;
import org.springframework.stereotype.Repository;

@Repository
public interface categoryDao extends JpaRepository<category, Integer> {

}
