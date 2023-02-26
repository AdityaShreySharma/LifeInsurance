<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Welcome to Sapiens</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
	</head>
	<style>
		body {
			background-color: #0e1387;
		}
		.bg {
			background-image: url("https://pbs.twimg.com/media/Fn-F6WBXgAAnU88.jpg");
			background-repeat: no-repeat;
			background-size: cover;
			overflow: hidden;
			height: 532px;
   			width: 100%;
		}
		
		.heading {
			font-family: 'Dancing Script', cursive; 
			color:white; 
			font-size: 30px;
		}
		
		.navTop {
			background-color: black;
		}
		
		.signUpButton {
			padding-left: 832px;
		}
		
		.loginButton {
			padding-left: 20px;
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
			    	<div class="navbar-nav signUpButton">
			    		<a type="button" class="btn btn-success" href="/signUp">Sign Up</a>
				    	<div class="loginButton"><a type="button" class="btn btn-primary" href = "/loginPage">Login</a></div>
			    	</div>
			 	</div>
		  	</div>
		</nav>
		<div class="bg"></div>
	</body>
</html>