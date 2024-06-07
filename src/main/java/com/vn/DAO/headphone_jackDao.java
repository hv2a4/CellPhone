package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.color;
import com.vn.entity.headphone_jack;
import org.springframework.stereotype.Repository;

@Repository
public interface headphone_jackDao extends JpaRepository<headphone_jack, Integer> {

}
