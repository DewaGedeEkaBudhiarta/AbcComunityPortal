package com.abc.service;

import java.util.List;

import com.abc.dto.abcBeans;
import com.abc.dto.emailBeans;
import com.abc.dto.jobPostBeans;

public interface userService {
	  public void addUser(abcBeans x); 
		// TODO Auto-generated method stub
	    public List<abcBeans> showAllUser();
	    public List<abcBeans> search(String search);
	    public void deleteData(int id);
	    public List<abcBeans> cariuser(String search);
	    public abcBeans SearchUser(int id_user);
	    public abcBeans login(String email);
	    public void encode(abcBeans x); 
	    public void sendEmail(String to,String subject,String text);
	    public void addEmail(emailBeans x);
	    public jobPostBeans postJOb(jobPostBeans jobPost); 
	    public abcBeans emailConfirm(String user);
	    public List<jobPostBeans> showAllJob();
	}


