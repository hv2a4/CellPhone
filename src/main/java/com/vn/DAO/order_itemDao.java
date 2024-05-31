package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.color;
import com.vn.entity.order_item;
import com.vn.entity.system;

public interface order_itemDao extends JpaRepository<order_item, Integer> {

}
