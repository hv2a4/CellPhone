package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.battery_type;
import com.vn.entity.color;

public interface battery_typeDao extends JpaRepository<battery_type, Integer> {

}
