package com.vn.DAO;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.vn.entity.phone;

public interface phoneDao extends JpaRepository<phone, Integer> {
	@Query(value = "EXEC GetTop7Phones", nativeQuery = true)
	List<Object[]> getTop7Phones();

	@Query("SELECT p FROM phone p WHERE p.category.ID = ?1 AND p.brand.ID = ?2")
    List<phone> findProductsByCategoryAndBrand(int categoryId, int brandId);
    @Query("select p from phone p where p.brand.ID = ?1")
    List<phone> findAllBybrandIDEqual(Integer id);
    
    List<phone> findAllByNAMELike(String keywords);
    
    Page<phone> findBybrandNAMEIn(List<String> brandNames,Pageable pageable);
    
    List<phone> findBysystemSYSTEMIn(List<String> systemNames);
    
}
