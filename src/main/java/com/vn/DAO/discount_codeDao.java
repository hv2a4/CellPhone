package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.color;
import com.vn.entity.discount_code;

public interface discount_codeDao extends JpaRepository<discount_code, Integer> {

}
