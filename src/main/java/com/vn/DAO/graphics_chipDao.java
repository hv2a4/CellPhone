package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.color;
import com.vn.entity.graphics_chip;
import org.springframework.stereotype.Repository;

@Repository
public interface graphics_chipDao extends JpaRepository<graphics_chip, Integer> {

}
