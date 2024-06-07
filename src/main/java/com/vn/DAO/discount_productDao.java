package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.color;
import com.vn.entity.discount_product;
import org.springframework.stereotype.Repository;

@Repository
public interface discount_productDao extends JpaRepository<discount_product, Integer> {

}
