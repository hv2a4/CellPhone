package com.vn.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.vn.entity.color;
import com.vn.entity.system;
import com.vn.entity.variant;
import org.springframework.stereotype.Repository;

@Repository
public interface variantDao extends JpaRepository<variant, Integer> {
	@Query("select sum(v.QUANTITY) from variant v")
	long totalSumProduct();
	@Query("select v from variant v where v.ID = ?1 and v.storage.ID = ?2 and v.color.ID = ?3")
	variant variantById(Integer idvariant, Integer idstorage, Integer idcolor);

}
