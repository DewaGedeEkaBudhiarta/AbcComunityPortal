package com.abc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.abc.dto.abcBeans;
import com.abcComunity.dao.userDao;
import com.abcComunity.security.ApplicationUserDetail;


@Service
public class Customservice implements UserDetailsService {
    @Autowired
	userDao userdao;
    abcBeans user;
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		user=userdao.findByEmail(username);
		if(user==null) {
			System.out.println("Email is Invalid");
			throw new UsernameNotFoundException("User Not Found with -> username or email: " + username);
		}
		return new ApplicationUserDetail(user);
	}

}
