package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.color;
import com.vn.entity.image;

public interface imageDao extends JpaRepository<image, Integer> {

}
