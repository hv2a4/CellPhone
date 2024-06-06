package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.charging_port;
import com.vn.entity.color;
import org.springframework.stereotype.Repository;

@Repository
public interface charging_protDao extends JpaRepository<charging_port, Integer> {

}
