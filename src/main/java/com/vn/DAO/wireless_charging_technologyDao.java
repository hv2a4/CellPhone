package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.color;
import com.vn.entity.system;
import com.vn.entity.wireless_charging_technology;

public interface wireless_charging_technologyDao extends JpaRepository<wireless_charging_technology, Integer> {

}
