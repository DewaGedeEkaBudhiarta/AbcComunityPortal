package com.abcComunity.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abc.dto.jobPostBeans;

@Repository
public interface jobPostDao extends JpaRepository<jobPostBeans, Integer>{

	
}
