package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.color;
import com.vn.entity.system;
import com.vn.entity.variant;
import org.springframework.stereotype.Repository;

@Repository
public interface variantDao extends JpaRepository<variant, Integer> {

}
