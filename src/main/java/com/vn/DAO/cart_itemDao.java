package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.cart_item;
import com.vn.entity.color;

public interface cart_itemDao extends JpaRepository<cart_item, Integer> {

}
