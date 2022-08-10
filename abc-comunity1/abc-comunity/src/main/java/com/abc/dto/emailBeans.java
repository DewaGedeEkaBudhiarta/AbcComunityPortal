package com.abc.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Email")
public class emailBeans {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idEmail;
	
	private String receiver;
	private String subject;
	private String message;
	
	public emailBeans() {
		
	}

	public emailBeans(int idEmail, String receiver, String subject, String message) {
		super();
		this.idEmail = idEmail;
		this.receiver = receiver;
		this.subject = subject;
		this.message = message;
	}

	public int getIdEmail() {
		return idEmail;
	}

	public void setIdEmail(int idEmail) {
		this.idEmail = idEmail;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "emailBeans [idEmail=" + idEmail + ", receiver=" + receiver + ", subject=" + subject + ", message="
				+ message + "]";
	}
	
	
}
