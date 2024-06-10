package com.vn.DAO;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.vn.entity.color;
import com.vn.entity.discount_code;
import org.springframework.stereotype.Repository;

@Repository
public interface discount_codeDao extends JpaRepository<discount_code, Integer> {

}
