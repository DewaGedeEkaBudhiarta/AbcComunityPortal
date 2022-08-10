package com.abcComunity.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abc.dto.abcBeans;

@Repository
public interface userDao extends JpaRepository<abcBeans, Integer>{
	@Query(value="select * from user where firstname like %:searching% or lastname like %:searching%", nativeQuery = true)
	List<abcBeans> findByFirstnameAndLastname(@Param("searching") String search);
	
	@Query(value = "select * from user u where u.email = :email and u.password= :password", nativeQuery = true)
    abcBeans findUserByEmail(@Param("email") String email, @Param("password") String password);
	
	abcBeans findByEmail(String email);
}
