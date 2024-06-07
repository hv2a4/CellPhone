package com.vn.DAO;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.vn.entity.color;
import com.vn.entity.system;
import org.springframework.stereotype.Repository;

@Repository
public interface systemDao extends JpaRepository<system, Integer> {
	@Query("select s from system s")
	List<system> finBySystem();
}
