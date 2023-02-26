<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Admin</title>
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
			
			.logoutButton {
				padding-left: 920px;
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
			    	<div class="navbar-nav logoutButton">
				    	<a type="button" class="btn btn-danger" href = "/logout">Log Out</a>
			    	</div>
			 	</div>
		  	</div>
		</nav>
		<div class="container my-2" style="padding-left: 20px">
	        <h1>Client Policies</h1>
	
	        <table border="4" class="table table-striped table-responsive-md">
	            <thead class="thead-dark">
	                <tr>
	                	<th style="text-align: center">Client Name</th>
	                    <th style="text-align: center">Policy Number</th>
	                    <th style="text-align: center">Type</th>
	                    <th style="text-align: center">Coverage Amount</th>
	                    <th style="text-align: center">Status</th>
	                    <th style="text-align: center; width: 336px;">Actions</th>
	                </tr>
	            </thead>
	            <tbody>
		            <c:forEach var="policy" items="${listPolicies}">
		            	<tr>
		            		<td>${policy.user.userFirstName} ${policy.user.userLastName}</td>
		                    <td>${policy.policyNumber}</td>
		                    <td>${policy.policyType}</td>
		                    <td>${policy.sumInsured}</td>
		                    <td>${policy.statusOfPolicy}</td>
		                    <td>
		                    	<a class="approveButton btn btn-success" style = "width: 100px" href="/approve/${policy.policyId}" onclick="return confirm('Are you sure you want to approve this Policy?');">Approve</a>
		                    	<a class="onHoldButton btn btn-primary" style = "width: 100px" href="/onHold/${policy.policyId}" onclick="return confirm('Are you sure you want to put this Policy on hold?');">On Hold</a>
		                    	<a class="rejectButton btn btn-danger" style = "width: 100px" href="/reject/${policy.policyId}" onclick="return confirm('Are you sure you want to reject this Policy?');">Reject</a>
		                    </td>
		                </tr>
		            </c:forEach>
	            </tbody>
	        </table>
	    </div>
	</body>
</html>