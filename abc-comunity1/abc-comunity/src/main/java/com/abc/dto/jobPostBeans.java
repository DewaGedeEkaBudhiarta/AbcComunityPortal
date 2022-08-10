package com.abc.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="JobPost")
public class jobPostBeans {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_Job;
	
	private String Title;
	private String LinkApply;
	private String JobType;
	private String Location;
	private String Description;
	private String Company;
	private String Salary;
	
	
public jobPostBeans() {
		
	}


public jobPostBeans(int id_Job, String title, String linkApply, String jobType, String location, String description,
		String company, String salary) {
	super();
	this.id_Job = id_Job;
	Title = title;
	LinkApply = linkApply;
	JobType = jobType;
	Location = location;
	Description = description;
	Company = company;
	Salary = salary;
}


public int getId_Job() {
	return id_Job;
}


public void setId_Job(int id_Job) {
	this.id_Job = id_Job;
}


public String getTitle() {
	return Title;
}


public void setTitle(String title) {
	Title = title;
}


public String getLinkApply() {
	return LinkApply;
}


public void setLinkApply(String linkApply) {
	LinkApply = linkApply;
}


public String getJobType() {
	return JobType;
}


public void setJobType(String jobType) {
	JobType = jobType;
}


public String getLocation() {
	return Location;
}


public void setLocation(String location) {
	Location = location;
}


public String getDescription() {
	return Description;
}


public void setDescription(String description) {
	Description = description;
}


public String getCompany() {
	return Company;
}


public void setCompany(String company) {
	Company = company;
}


public String getSalary() {
	return Salary;
}


public void setSalary(String salary) {
	Salary = salary;
}


@Override
public String toString() {
	return "jobPostBeans [id_Job=" + id_Job + ", Title=" + Title + ", LinkApply=" + LinkApply + ", JobType=" + JobType
			+ ", Location=" + Location + ", Description=" + Description + ", Company=" + Company + ", Salary=" + Salary
			+ "]";
}


}
