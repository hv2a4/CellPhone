package com.vn.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.vn.entity.user;
import org.springframework.stereotype.Repository;

@Repository
public interface userDao extends JpaRepository<user, String> {
    List<user> findByEMAILLike(String email);
}
