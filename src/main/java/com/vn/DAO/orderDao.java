package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.color;
import com.vn.entity.order;
import com.vn.entity.system;

public interface orderDao extends JpaRepository<order, Integer> {

}
