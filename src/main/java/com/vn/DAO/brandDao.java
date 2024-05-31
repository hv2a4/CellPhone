package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.brand;
import com.vn.entity.color;

public interface brandDao extends JpaRepository<brand, Integer> {

}
