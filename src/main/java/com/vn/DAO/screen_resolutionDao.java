package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.color;
import com.vn.entity.screen_resolution;
import com.vn.entity.system;

public interface screen_resolutionDao extends JpaRepository<screen_resolution, Integer> {

}
