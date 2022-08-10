package com.abcComunity.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abc.dto.emailBeans;

@Repository
public interface emailDao extends JpaRepository<emailBeans, Integer>{

}
