package com.vn.DAO;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.vn.entity.phone;

@Repository
public interface phoneDao extends JpaRepository<phone, Integer> {
	// Lấy ra 1 cái list storage không trùng với ID của storage
//	 @Query("SELECT s FROM storage s WHERE s.id NOT IN (SELECT p.storage.id FROM phone p)")
//	 List<storage> findDistinctStorage();
}
