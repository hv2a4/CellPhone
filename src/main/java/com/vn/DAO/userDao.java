package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.vn.entity.color;
import com.vn.entity.system;
import com.vn.entity.user;

public interface userDao extends JpaRepository<user, String> {
	 @Query("SELECT count(o) from user o where o.ROLE = ?1")
	 int countUser(Boolean role);
	 @Query("SELECT count(o) from user o")
	 int countUsers();
}
