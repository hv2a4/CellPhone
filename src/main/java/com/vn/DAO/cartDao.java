package com.vn.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.cart;
import com.vn.entity.color;
import com.vn.entity.user;

import org.springframework.stereotype.Repository;

@Repository
public interface cartDao extends JpaRepository<cart, Integer> {
	List<cart> findByUser(user user);
}
