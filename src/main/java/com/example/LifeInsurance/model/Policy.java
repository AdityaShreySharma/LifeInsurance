package com.example.LifeInsurance.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Policy {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int policyId;
	private int policyNumber;
	private String policyType;
	private double premium;
	private double sumInsured;
	private int paymentTenure;
	private String paymentMode;
	private String preferredModeOfPayment;
	private String statusOfPolicy = "Pending";
	private String city;
	private String educationalQualifiction;
	private String occupation;
	private String clientGender;
	private String consumeTobacco;
	private double annualIncome;
	private double lifeCoverAmount;
	private int lifeCoverUptoAge;
	private String clientDoB;
	private String topUp;
	private double addedCoverAmount;
	private String paymentStatus = "Pending";
	
	@ManyToOne
	private User user;
	
	public double getAddedCoverAmount() {
		return addedCoverAmount;
	}


	public void setAddedCoverAmount(double addedCoverAmount) {
		this.addedCoverAmount = addedCoverAmount;
	}
	
	public int getPolicyId() {
		return policyId;
	}


	public void setPolicyId(int policyId) {
		this.policyId = policyId;
	}


	public int getPolicyNumber() {
		return policyNumber;
	}


	public void setPolicyNumber(int policyNumber) {
		this.policyNumber = policyNumber;
	}


	public String getPolicyType() {
		return policyType;
	}


	public void setPolicyType(String policyType) {
		this.policyType = policyType;
	}


	public double getPremium() {
		return premium;
	}


	public void setPremium(double premium) {
		this.premium = premium;
	}


	public double getSumInsured() {
		return sumInsured;
	}


	public void setSumInsured(double sumInsured) {
		this.sumInsured = sumInsured;
	}


	public int getPaymentTenure() {
		return paymentTenure;
	}


	public void setPaymentTenure(int paymentTenure) {
		this.paymentTenure = paymentTenure;
	}


	public String getPaymentMode() {
		return paymentMode;
	}


	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}


	public String getPreferredModeOfPayment() {
		return preferredModeOfPayment;
	}


	public void setPreferredModeOfPayment(String preferredModeOfPayment) {
		this.preferredModeOfPayment = preferredModeOfPayment;
	}


	public String getStatusOfPolicy() {
		return statusOfPolicy;
	}


	public void setStatusOfPolicy(String statusOfPolicy) {
		this.statusOfPolicy = statusOfPolicy;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getEducationalQualifiction() {
		return educationalQualifiction;
	}


	public void setEducationalQualifiction(String educationalQualifiction) {
		this.educationalQualifiction = educationalQualifiction;
	}


	public String getOccupation() {
		return occupation;
	}


	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}


	public String getClientGender() {
		return clientGender;
	}


	public void setClientGender(String clientGender) {
		this.clientGender = clientGender;
	}


	public String getConsumeTobacco() {
		return consumeTobacco;
	}


	public void setConsumeTobacco(String consumeTobacco) {
		this.consumeTobacco = consumeTobacco;
	}


	public double getAnnualIncome() {
		return annualIncome;
	}


	public void setAnnualIncome(double annualIncome) {
		this.annualIncome = annualIncome;
	}


	public double getLifeCoverAmount() {
		return lifeCoverAmount;
	}


	public void setLifeCoverAmount(double lifeCoverAmount) {
		this.lifeCoverAmount = lifeCoverAmount;
	}


	public int getLifeCoverUptoAge() {
		return lifeCoverUptoAge;
	}


	public void setLifeCoverUptoAge(int lifeCoverUptoAge) {
		this.lifeCoverUptoAge = lifeCoverUptoAge;
	}


	public String getClientDoB() {
		return clientDoB;
	}


	public void setClientDoB(String clientDoB) {
		this.clientDoB = clientDoB;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}
	
	public String getTopUp() {
		return topUp;
	}


	public void setTopUp(String topUp) {
		this.topUp = topUp;
	}
	
	

	public String getPaymentStatus() {
		return paymentStatus;
	}


	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}


	public Policy() {
		super();
	}


	public Policy(int policyId, int policyNumber, String policyType, double premium, double sumInsured,
			int paymentTenure, String paymentMode, String preferredModeOfPayment, String statusOfPolicy, String city,
			String educationalQualifiction, String occupation, String clientGender, String consumeTobacco,
			double annualIncome, double lifeCoverAmount, int lifeCoverUptoAge, String clientDoB, String topUp,
			double addedCoverAmount, String paymentStatus, User user) {
		super();
		this.policyId = policyId;
		this.policyNumber = policyNumber;
		this.policyType = policyType;
		this.premium = premium;
		this.sumInsured = sumInsured;
		this.paymentTenure = paymentTenure;
		this.paymentMode = paymentMode;
		this.preferredModeOfPayment = preferredModeOfPayment;
		this.statusOfPolicy = statusOfPolicy;
		this.city = city;
		this.educationalQualifiction = educationalQualifiction;
		this.occupation = occupation;
		this.clientGender = clientGender;
		this.consumeTobacco = consumeTobacco;
		this.annualIncome = annualIncome;
		this.lifeCoverAmount = lifeCoverAmount;
		this.lifeCoverUptoAge = lifeCoverUptoAge;
		this.clientDoB = clientDoB;
		this.topUp = topUp;
		this.addedCoverAmount = addedCoverAmount;
		this.paymentStatus = paymentStatus;
		this.user = user;
	}
}