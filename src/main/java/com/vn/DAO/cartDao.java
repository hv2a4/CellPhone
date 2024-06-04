package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.cart;
import com.vn.entity.color;
import org.springframework.stereotype.Repository;

@Repository
public interface cartDao extends JpaRepository<cart, Integer> {

}
