package com.vn.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.vn.entity.phone;
import com.vn.entity.user;
import org.springframework.stereotype.Repository;

@Repository
public interface userDao extends JpaRepository<user, String> {
	@Query("SELECT count(o) from user o where o.ROLE = ?1")
	int countUser(Boolean role);

	@Query("SELECT count(o) from user o")
	int countUsers();
	
    List<user> findByEMAILLike(String email);
    
    @Query("SELECT p FROM user p ORDER BY p.UPDATE_AT DESC")
    List<user> OrderByUpdateAtDesc();
}
