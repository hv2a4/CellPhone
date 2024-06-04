package com.vn.DAO;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import com.vn.entity.color;
import com.vn.entity.system;
import com.vn.entity.user;

public interface userDao extends JpaRepository<user, String> {
  
   
 
}
