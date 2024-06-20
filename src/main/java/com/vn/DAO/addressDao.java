package com.vn.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.vn.entity.address;
import com.vn.entity.color;
import org.springframework.stereotype.Repository;

@Repository
public interface addressDao extends JpaRepository<address, Integer> {
	@Query("select adr.ADDRESS from address adr where adr.ID = ?1")
	String findByNameAdr(Integer id);
}
