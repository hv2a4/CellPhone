package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.charging_port;
import org.springframework.stereotype.Repository;

@Repository
public interface charging_portDao extends JpaRepository<charging_port, Integer> {

}
