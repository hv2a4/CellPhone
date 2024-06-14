package com.vn.DAO;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.vn.entity.brand;
import com.vn.entity.phone;
import com.vn.entity.system;

@Repository
public interface phoneDao extends JpaRepository<phone, Integer> {
	@Query(value = "EXEC GetTop7Phones", nativeQuery = true)
	List<Object[]> getTop7Phones();

	@Query("SELECT p FROM phone p WHERE p.category.ID = ?1 AND p.brand.ID = ?2")
	List<phone> findProductsByCategoryAndBrand(int categoryId, int brandId);
	
	@Query("select p from phone p where p.brand.ID = ?1")
    List<phone> findAllBybrandIDEqual(Integer id);
	
	// Lọc theo 1 điều kiện
	Page<phone> findAllByNAMELike(String keywords, Pageable pageable);
	Page<phone> findBybrandNAMEIn(List<String> listBrand, Pageable pageable);
	Page<phone> findBysystemSYSTEMIn(List<String> listSystem, Pageable pageable);
	
	@Query("SELECT p FROM phone p JOIN p.variants v WHERE v.PRICE BETWEEN ?1 AND ?2")
	Page<phone> findByPRICEBetween(Double min, Double max, Pageable pageable);
	
	// Lọc theo 2 điều kiện
	// HANG - HE THONG
	@Query("select p from phone p where p.brand.NAME IN ?1 AND p.system.SYSTEM IN ?2")
	Page<phone> findBybrandInAndsystemIn(List<String> brandNames, List<String> listSystem, Pageable pageable);
	// HANG - GIA
	@Query("SELECT p FROM phone p JOIN p.variants v WHERE v.PRICE BETWEEN ?1 AND ?2 AND p.brand.NAME IN ?3")
	Page<phone> findByPRICEBetweenAndBrandIn(Double min, Double max, List<String> brandNames, Pageable pageable);
	// HE THONG - GIA
	@Query("SELECT p FROM phone p JOIN p.variants v WHERE v.PRICE BETWEEN ?1 AND ?2 AND p.system.SYSTEM IN ?3")
	Page<phone> findByPRICEBetweenAndsystemIn(Double min, Double max, List<String> systemSystems, Pageable pageable);
	
	// Lọc theo 3 điều kiện
	// GIA - HANG - HE THONG
	@Query("SELECT p FROM phone p JOIN p.variants v WHERE v.PRICE BETWEEN ?1 AND ?2 AND p.system.SYSTEM IN ?3 AND p.brand.NAME IN ?4")
	Page<phone> findByPriceSystemBrand(Double min, Double max, List<String> systemSystems, List<String> brandNames, Pageable pageable);
	
	
	// Lọc theo 4 điều kiện
	// GIA - HANG - HE THONG - NAME
	@Query("SELECT p FROM phone p JOIN p.variants v WHERE v.PRICE BETWEEN ?1 AND ?2 AND p.system.SYSTEM IN ?3 AND p.brand.NAME IN ?4 AND p.NAME LIKE ?5")
	Page<phone> findByNamePriceSystemBrand(Double min, Double max, List<String> systemSystems, List<String> brandNames, String keywords, Pageable pageable);

	@Query("SELECT p FROM phone p ORDER BY p.UPDATE_AT DESC")
    List<phone> OrderByCreateAtDesc();
}
