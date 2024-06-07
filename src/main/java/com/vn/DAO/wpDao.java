package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.color;
import com.vn.entity.system;
import com.vn.entity.wp;
import org.springframework.stereotype.Repository;

@Repository
public interface wpDao extends JpaRepository<wp, Integer> {

}
