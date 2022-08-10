package com.abc.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.abc.dto.abcBeans;
import com.abc.dto.emailBeans;
import com.abc.dto.jobPostBeans;
import com.abcComunity.dao.emailDao;
import com.abcComunity.dao.jobPostDao;
import com.abcComunity.dao.userDao;
import org.springframework.mail.javamail.JavaMailSender;

@Service("userService")
public class userImplement implements userService{
	@Autowired
	userDao udao;
	
	@Autowired
	emailDao uemail;
	
	@Autowired
	private JavaMailSender emailSender;
	
	@Autowired
	jobPostDao jobDao;
	
	private PasswordEncoder passwordencoder;
	public userImplement(PasswordEncoder encoder) {
		// TODO Auto-generated constructor stub
		this.passwordencoder=encoder;
	}
	

	   List<abcBeans> myAllUser = new ArrayList<abcBeans>();

	    @Override
	    public void addUser(abcBeans x) {
	        // TODO Auto-generated method stub
	        //myAllUser.add(x);
	    	x.setRole("USER");
	    	x.setPassword(passwordencoder.encode(x.getPassword()));
	    	udao.save(x);
	    }

	    @Override
	    public List<abcBeans> showAllUser() {
	    	List <abcBeans> databaseall=udao.findAll();
	        // TODO Auto-generated method stub
	        return databaseall;        
	    }

		@Override
		public List<abcBeans> search(String search) {
			return udao.findByFirstnameAndLastname(search);
		}

		@Override
		public void deleteData(int id) {
			// TODO Auto-generated method stub
			udao.deleteById(id);
		}

		@Override
		public List<abcBeans> cariuser(String search) {
			// TODO Auto-generated method stub
			return udao.findByFirstnameAndLastname(search) ;
		}

		@Override
		public abcBeans login(String email) {
			abcBeans userLogin = udao.findByEmail(email);
			return userLogin;
		}

		@Override
		public abcBeans SearchUser(int id_user) {
			// TODO Auto-generated method stub
			Optional<abcBeans> userData = udao.findById(id_user);
			abcBeans d=userData.get();
			System.out.println(d);
			return d;
		}

		@Override
		public void encode(abcBeans x) {
			// TODO Auto-generated method stub
			udao.save(x);	
		}
		
		@Override
		public void sendEmail(String to,String subject,String text) {
			
//			<hardcoded>
//			String to="zulfikarace44@gmail.com";
//			String subject="test";
//			String text="Hey Welcome to w3htmlshool.com i am form Lithan ";
//			String from="dodehebat86@gmail.com";
			
			// TODO Auto-generated method stub
			SimpleMailMessage message = new SimpleMailMessage(); 
//			message.setFrom(from);
	        message.setTo(to);
	        message.setText(text);
	        message.setSubject("new mail");
	        emailSender.send(message);
	        System.out.println("Mail Send...");
		}
		
		@Override
	    public void addEmail(emailBeans x) {
	        // TODO Auto-generated method stub
	    	uemail.save(x);
	    }

		@Override
		public jobPostBeans postJOb(jobPostBeans jobPost) {
			// TODO Auto-generated method stub
			jobDao.save(jobPost);
			return jobPost;
		}

		@Override
		public abcBeans emailConfirm(String user) {
			// TODO Auto-generated method stub
			abcBeans email = udao.findByEmail(user);
			return email;
		}

		@Override
		public List<jobPostBeans> showAllJob() {
			// TODO Auto-generated method stub
			List <jobPostBeans> databaseall=jobDao.findAll();
	        // TODO Auto-generated method stub
	        return databaseall;        
	    }

	}


