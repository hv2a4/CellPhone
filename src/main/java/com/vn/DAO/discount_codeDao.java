package com.vn.DAO;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.vn.entity.discount_code;
import com.vn.entity.phone;

import org.springframework.stereotype.Repository;

@Repository
public interface discount_codeDao extends JpaRepository<discount_code, Integer> {

	@Query("SELECT p FROM discount_code p ORDER BY p.START_DATE DESC")
	Page<discount_code> findAllSX(Pageable pageable);
	
	@Query("select dc from discount_code dc where dc.CODE = ?1")
	discount_code findByLikeCODE(String code);
}	
