package com.example.demo.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class Admin {
	@Id
	private int admin_id;
	
	@JsonIgnoreProperties("user")
	@OneToOne
	@JoinColumn(name = "user_id")
	Login user;
	
	@Column
	private String fname;
	
	@Column
	private String lname;
	
	
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public Admin(int admin_id, Login user_id, String fname, String lname) {
		super();
		this.admin_id = admin_id;
		this.user = user_id;
		this.fname = fname;
		this.lname = lname;
	}



	public int getAdmin_id() {
		return admin_id;
	}


	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}


	public Login getUser_id() {
		return user;
	}


	public void setUser_id(Login user_id) {
		this.user= user_id;
	}


	public String getFname() {
		return fname;
	}


	public void setFname(String fname) {
		this.fname = fname;
	}


	public String getLname() {
		return lname;
	}


	public void setLname(String lname) {
		this.lname = lname;
	}
	
	
	
	
	

}
