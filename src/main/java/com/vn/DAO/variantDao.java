package com.vn.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.vn.entity.color;
import com.vn.entity.system;
import com.vn.entity.variant;

public interface variantDao extends JpaRepository<variant, Integer> {
	@Query("select sum(v.QUANTITY) from variant v")
	long totalSumProduct();
	// Lấy tất cả các variant không trùng với ID_STORAGE
//	@Query("SELECT v FROM variant v WHERE NOT EXISTS (SELECT s FROM storage s WHERE s.id = v.storage.id)")
//    List<variant> findVariantsNotInStorage();
}
