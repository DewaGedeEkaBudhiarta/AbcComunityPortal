package com.abcComunity.abccomunity;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.abc.dto.abcBeans;
import com.abc.service.userService;

@SpringBootTest
class AbcComunityApplicationTests {

//	@Test
//	void contextLoads() {
//	}

	@Autowired
	userService userService;
	
	//junit register
	@Test
	void registerUser() {
		abcBeans user = new abcBeans();
		user.setUsername("lastman");
		user.setPassword("123456543");
		user.setFirstname("kendra");
		user.setLastname("santiva");
		user.setAddress("oijjojnj");
		user.setEmail("last@gmail.com");
		user.setPhone("12343");
		
		userService.addUser(user);
	}
	
	//junit search
	@Test
	void searchUser() {
		List<abcBeans> user = userService.cariuser("kendra");
		System.out.println(user);
	}
}
