<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>New Policy</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
	</head>
	<style>
		h1 {
			padding-bottom: 20px;
			padding-left: 480px;
		}
		
		.right {
			padding-left: 20px;
		}
		
		.heading {
			font-family: 'Dancing Script', cursive; 
			color:white; 
			font-size: 30px;
		}
		
		.navTop {
			background-color: black;
		}
		
		.backButton {
			padding-left: 832px;
		}
		
	</style>
	<body>
		<nav class="navbar navbar-expand-lg bg-body-tertiary navTop">
			<div class="container-fluid">
				<a class="navbar-brand heading" href="/">Sapiens Insurance</a>
		    	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
		      		<span class="navbar-toggler-icon"></span>
		    	</button>
			    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			    	<div class="navbar-nav backButton">
			    		<a type="button" class="btn btn-primary" href="/viewClientPolicy">Back to Policy List</a>
			    	</div>
			 	</div>
		  	</div>
		</nav>
		<div class="container py-5">
		    <div class="row">
		    	<h1>New Policy</h1>
		        <div class="col-md-10 mx-auto">
		            <form:form action="/savePolicy" method="POST" modelAttribute="policy">
		                <div class="form-group row">
		                    <div class="col-sm-6">
		                        <label for="inputFirstname">Policy Type</label>
		                        <form:select name="policyType" path="policyType" class="form-control" onchange="typeOfPolicy(this);" required="required">
		                        	<option value="none">--Select--</option>
									<option value="Term Insurance Policy">Term Insurance Policy</option>
									<option value="Whole Life Insurance Policy">Whole Life Insurance Policy</option>
									<option value="Money Back Policy">Money Back Policy</option>
									<option value="Endowment Policy">Endowment Policy</option>
								</form:select>
		                    </div>
		                    <div class="col-sm-6">
		                        <label for="inputFirstname">Coverage Amount</label>
		                        <form:input type="number" class="form-control" name="sumInsured" path="sumInsured" placeholder="Sum Insured" required="required" min="1" max="30000000" />
		                    </div>
		                </div>
		                <div class="form-group row" id="topUpField" style="display: none;">
		                	<div class="col-sm-6">
		                    	<label for="addedProtection">Top Up</label>
			                    <form:select name="topUp" path="topUp" class="form-control" onchange="typeOfProtection(this)">
			                    	<option value="none">--Select--</option>
				                    <option value="Accident Death Benefit">Accident Death Benefit</option>
				                    <option value="Comprehensive Care">Comprehensive Care</option>
			                    </form:select>
		                    </div>
		                    <div class="col-sm-6" id="addedCover" style="display: none;">
					            <label for="topUpCoverageAmount" style="padding-top: 15px;">Top Up Coverage Amount</label>
					            <form:input type="number" name="addedCoverAmount" path="addedCoverAmount" placeholder="Top Up Coverage Amount" class="form-control" />
				            </div>
		                </div>
		                <div class="form-group row">
		                    <div class="col-sm-6">
		                        <label for="inputFirstname">Payment Tenure</label>
		                        <form:input type="text" class="form-control" name="paymentTenure" path="paymentTenure" placeholder="Payment Tenure" required="required" />
		                    </div>
		                    <div class="col-sm-6">
		                        <label for="inputFirstname">Payment Mode</label>
		                    	<form:select name="paymentMode" path="paymentMode" class="form-control" required="required">
		                        	<option value="none">--Select--</option>
									<option value="Annual">Annual</option>
									<option value="Half Yearly">Half Yearly</option>
									<option value="Monthly">Monthly</option>
								</form:select>
		                    </div>
		                </div>
		                <div class="form-group row">
		                    <div class="col-sm-6">
		                        <label for="inputFirstname">Preferred Mode of Payment</label>
		                    	<form:select path="preferredModeOfPayment" class="form-control" required="required">
		                        	<option value="none">--Select--</option>
									<option value="Cash">Cash</option>
									<option value="Credit Card">Credit Card</option>
									<option value="Debit Card">Debit Card</option>
									<option value="Net Banking">Net Banking</option>
									<option value="UPI">UPI</option>
									<option value="PayTM">PayTM</option>
								</form:select>
		                    </div>
		                    <div class="col-sm-6">
		                        <label for="inputState">Date of Birth</label>
		                        <form:input type="date" class="form-control" min="2000-01-01" max="2023-02-03" path="clientDoB" placeholder="Date of Birth" required="required" />
		                    </div>
		                </div>
		                <div class="form-group row">
		                    <div class="col-sm-6">
		                        <label for="inputContactNumber">Gender</label>
		                    	<form:select path="clientGender" class="form-control" required="required">
									<option value="none">--Select--</option>
									<option value="Male">Male</option>
									<option value="Female">Female</option>
									<option value="Other">Other</option>
								</form:select>
		                    </div>
		                    <div class="col-sm-6">
		                        <label for="inputWebsite">City</label>
		                        <form:input type="text" class="form-control" path="city" placeholder="City" required="required" />
		                    </div>
		                </div>
		                <div class="form-group row">
		                    <div class="col-sm-6">
		                        <label for="inputContactNumber">Educational Qualification</label>
		                    	<form:select class="form-control" path="educationalQualifiction" required="required">
								    <option value="none">--Select--</option>
								    <option value="No Formal Education">No Formal Education</option>
								    <option value="Primary">Primary</option>
								    <option value="Secondary">Secondary</option>
								    <option value="Bachelor's Degree">Bachelor's Degree</option>
								    <option value="Master's Degree">Master's Degree</option>
								    <option value="Doctorate">Doctorate</option>
								</form:select>
		                    </div>
		                    <div class="col-sm-6">
		                        <label for="inputWebsite">Occupation</label>
		                        <form:input type="text" class="form-control" path="occupation" placeholder="Occupation" required="required" />
		                    </div>
		                </div>
		                <div class="form-group row">
		                    <div class="col-sm-6">
		                        <label for="tobacco">Do you Consume Tobacco?</label><br>
		                        <label for="Yes">Yes</label>
		                        <form:radiobutton path="consumeTobacco" value="Yes" />
		                        <label style="padding-left: 20px;"for="No">No</label>
		                        <form:radiobutton path="consumeTobacco" value="No" />
		                    </div>
		                    <div class="col-sm-6">
		                        <label for="inputWebsite">Annual Income</label>
		                        <form:input type="text" class="form-control" path="annualIncome" placeholder="Annual Income" required="required" />
		                    </div>
		                </div>
		                <div class="form-group row">
		                    <div class="col-sm-6">
		                        <label for="inputContactNumber">Life Cover Amount</label>
		                        <form:input type="text" class="form-control" name="lifeCoverAmount" path="lifeCoverAmount" placeholder="Life Cover Amount" required="required" />
		                    </div>
		                    <div class="col-sm-6">
		                        <label for="inputWebsite">Life Cover Upto Age</label>
		                        <form:input type="text" class="form-control" path="lifeCoverUptoAge" placeholder="Life Cover Upto Age" required="required" />
		                    </div>
		                </div>
		                <div style="padding-left: 420px; padding-top: 20px;"><button type="submit" class="btn btn-primary px-4">Save</button></div>
		            </form:form>
		        </div>
		    </div>
		    <hr>
		</div>
		<script>
			function typeOfPolicy(that) {
				if (that.value == "Term Insurance Policy") {
					document.getElementById("topUpField").style.display = "block";
				} 
				else {
					document.getElementById("topUpField").style.display = "none";
				}
			}
			
			function typeOfProtection(that) {
				if (that.value == "Accident Death Benefit") {
					document.getElementById("addedCover").style.display = "block";
				} 
				else if(that.value=="Comprehensive Care") {
					document.getElementById("addedCover").style.display = "block";
				}
			}
		</script>
	</body>
</html>