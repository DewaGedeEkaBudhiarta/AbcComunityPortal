package com.abcComunity.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
@Configuration
@EnableWebSecurity
public class ApplicationSecurityConfig extends WebSecurityConfigurerAdapter {
    private PasswordEncoder passwordencoder;
    @Autowired
    UserDetailsService userservice;
	@Autowired
	UserDetailsService userdetail;
    @Autowired
    ApplicationSecurityConfig (PasswordEncoder encoder){
    	this.passwordencoder=encoder;
    }
    @Autowired
    RolesHandler roles;
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// TODO Auto-generated method stub
		http
		.authorizeRequests()
			.antMatchers("/index", "/home","/register","/login", "/confirmation", "/thankyou", "/emailConfirm", "/confirm2", "/forgotPassword", "/resetPassword").permitAll()
			.antMatchers("/CSS/**", "/images/**").permitAll()
			.anyRequest()
			.authenticated()
			.and()
		.formLogin()
			 .loginPage("/login").permitAll()
	         .usernameParameter("email")
	         .passwordParameter("password")
	         .successHandler(roles)
	         .and()
		//.loginPage("/loginPage")
		.logout()
			.logoutUrl("/logout")
	        .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
	        .logoutSuccessUrl("/index").permitAll()
	        .clearAuthentication(true)
	        .invalidateHttpSession(true);
	}
	
	@Autowired
	AuthenticationProvider authProvider() {
		DaoAuthenticationProvider  dao=new DaoAuthenticationProvider();
		dao.setPasswordEncoder(passwordencoder);
		dao.setUserDetailsService(userservice);
		
		return dao;
	}

	/*
	 * @Override
	 * 
	 * @Bean protected UserDetailsService userDetailsService() { // TODO
	 * Auto-generated method stub //username password UserDetails userone=
	 * User.builder().username("rahul").password(passwordencoder.encode("123456")).
	 * roles("ADMIN").build(); UserDetails
	 * usertwo=User.builder().username("vikash").password(passwordencoder.encode(
	 * "123456")).roles("USER").build(); return new
	 * InMemoryUserDetailsManager(userone,usertwo); }
	 */
}
