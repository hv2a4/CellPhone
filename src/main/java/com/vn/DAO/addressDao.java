package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.address;
import com.vn.entity.color;
import org.springframework.stereotype.Repository;

@Repository
public interface addressDao extends JpaRepository<address, Integer> {

}
