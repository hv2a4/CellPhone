package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.color;
import com.vn.entity.payment_method;
import com.vn.entity.system;

public interface payment_methodDao extends JpaRepository<payment_method, Integer> {

}
