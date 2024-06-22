package com.vn.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.vn.entity.color;
import com.vn.entity.order_item;
import com.vn.entity.system;
import org.springframework.stereotype.Repository;

@Repository
public interface order_itemDao extends JpaRepository<order_item, Integer> {
	@Query("select oi from order_item oi where oi.order.ID = ?1")
	List<order_item> finByAllOrder(Integer id);
}
