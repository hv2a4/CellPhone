package com.vn.DAO;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.vn.entity.color;
import com.vn.entity.discount_code;
import com.vn.entity.storage;
import com.vn.entity.system;
import org.springframework.stereotype.Repository;

@Repository
public interface storageDao extends JpaRepository<storage, Integer> {
	Page<storage> findAll(Pageable pageable);
	
	@Query("SELECT p FROM storage p ORDER BY p.GB ASC")
	Page<storage> findAllSX(Pageable pageable);
}
