package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.color;
import com.vn.entity.status_order;
import com.vn.entity.system;

public interface status_orderDao extends JpaRepository<status_order, Integer> {

}
