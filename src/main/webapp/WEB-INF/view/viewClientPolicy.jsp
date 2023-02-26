<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Client Policies</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
		<style>
			h1 {
				text-align: center;
				padding-top: 20px;
				padding-bottom: 10px;
			}
			
			.heading {
				font-family: 'Dancing Script', cursive; 
				color:white; 
				font-size: 30px;
			}
			
			.navTop {
				background-color: black;
			}
			
			.newPolicy {
				padding-left: 770px;
			}
			
			.logoutButton {
				padding-left: 20px;
			}
		</style>
	</head>
	<body>
		<nav class="navbar navbar-expand-lg bg-body-tertiary navTop">
			<div class="container-fluid">
				<a class="navbar-brand heading" href="/">Sapiens Insurance</a>
		    	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
		      		<span class="navbar-toggler-icon"></span>
		    	</button>
			    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			    	<div class="navbar-nav newPolicy">
			    		<a type="button" class="btn btn-info" href="/newPolicy">Add New Policy</a>
				    	<div class="logoutButton"><a type="button" class="btn btn-danger" href = "/logout">Log Out</a></div>
			    	</div>
			 	</div>
		  	</div>
		</nav>
		<div class="container my-2" style="padding-left: 20px">
	        <h1>Policies</h1>
	
	        <table border="4" class="table table-striped table-responsive-md">
	            <thead class="thead-dark">
	                <tr>
	                    <th style="text-align: center">Policy Number</th>
	                    <th style="text-align: center">Type</th>
	                    <th	style="text-align: center">Premium</th>
	                    <th	style="text-align: center">Coverage Amount</th>
	                    <th	style="text-align: center">Mode</th>
	                    <th	style="text-align: center">Policy Status</th>
	                    <th	style="text-align: center">Payment Status</th>
	                    <th style="width: 336px; text-align: center;">Actions</th>
	                </tr>
	            </thead>
	            <tbody>
		            <c:forEach var="policy" items="${listPolicies}">
		            	<tr>
		                    <td>${policy.policyNumber}</td>
		                    <td>${policy.policyType}</td>
		                    <td>${policy.premium}</td>
		                    <td>${policy.sumInsured}</td>
		                    <td>${policy.paymentMode}</td>
		                    <td>${policy.statusOfPolicy}</td>
		                    <td>${policy.paymentStatus}</td>
		                    <td>
		                    	<a style = "width: 100px" href="/update/${policy.policyId}" class="btn btn-primary">Update</a>
		                    	<a style = "width: 100px" href="/cancel/${policy.policyId}" class="btn btn-danger" onclick="return confirm('Are you sure you want to cancel this Policy?');">Cancel</a>
		                    	<a style = "width: 100px" href="/pay/${policy.policyId}" class="btn btn-success">Pay</a>
		                    </td>
		                </tr>
		            </c:forEach>
	            </tbody>
	        </table>
	    </div>
	</body>
</html>