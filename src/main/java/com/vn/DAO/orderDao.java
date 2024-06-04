package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.color;
import com.vn.entity.order;
import com.vn.entity.system;
import org.springframework.stereotype.Repository;

@Repository
public interface orderDao extends JpaRepository<order, Integer> {

}
