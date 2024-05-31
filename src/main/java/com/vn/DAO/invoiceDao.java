package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.color;
import com.vn.entity.invoice;
import com.vn.entity.system;

public interface invoiceDao extends JpaRepository<invoice, Integer> {

}
