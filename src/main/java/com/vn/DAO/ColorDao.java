package com.vn.DAO;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.color;


import org.springframework.stereotype.Repository;

@Repository
public interface ColorDao extends JpaRepository<color, Integer> {

	Page<color> findAll(Pageable pageable);

}
