package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.color;
import com.vn.entity.status_invoice;
import com.vn.entity.system;

public interface status_invoiceDao extends JpaRepository<status_invoice, Integer> {

}
