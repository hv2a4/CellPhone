package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vn.entity.color;
import com.vn.entity.rating;
import com.vn.entity.system;

public interface ratingDao extends JpaRepository<rating, Integer> {

}
