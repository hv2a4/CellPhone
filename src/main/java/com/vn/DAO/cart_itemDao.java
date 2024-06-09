package com.vn.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.cart;
import com.vn.entity.cart_item;
import com.vn.entity.user;

import org.springframework.stereotype.Repository;

@Repository
public interface cart_itemDao extends JpaRepository<cart_item, Integer> {
	List<cart_item> findByCart(cart cart);
	
}
