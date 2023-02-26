package com.example.LifeInsurance.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int userId;
	private String userFirstName;
	private String userLastName;
	@Column(unique = true)
	private String userEmail;
	private String userMobileNumber;
	private String userPassword;
	private String userRole;
	
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.MERGE, orphanRemoval = true)
	private List<Policy> policies = new ArrayList<>();


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getUserFirstName() {
		return userFirstName;
	}


	public void setUserFirstName(String userFirstName) {
		this.userFirstName = userFirstName;
	}


	public String getUserLastName() {
		return userLastName;
	}


	public void setUserLastName(String userLastName) {
		this.userLastName = userLastName;
	}


	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public String getUserMobileNumber() {
		return userMobileNumber;
	}


	public void setUserMobileNumber(String userMobileNumber) {
		this.userMobileNumber = userMobileNumber;
	}


	public String getUserPassword() {
		return userPassword;
	}


	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}


	public String getUserRole() {
		return userRole;
	}


	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}


	public List<Policy> getPolicies() {
		return policies;
	}


	public void setPolicies(List<Policy> policies) {
		this.policies = policies;
	}


	public User() {
		super();
	}


	public User(int userId, String userFirstName, String userLastName, String userEmail, String userMobileNumber,
			String userPassword, String userRole, List<Policy> policies) {
		super();
		this.userId = userId;
		this.userFirstName = userFirstName;
		this.userLastName = userLastName;
		this.userEmail = userEmail;
		this.userMobileNumber = userMobileNumber;
		this.userPassword = userPassword;
		this.userRole = userRole;
		this.policies = policies;
	}
}
