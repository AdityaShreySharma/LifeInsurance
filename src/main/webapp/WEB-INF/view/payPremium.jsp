<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Pay Premium</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<style>
			body{height: 100vh;justify-content: center;align-items: center;display: flex;background-color: #eee}.launch{height: 50px}.close{font-size: 21px;cursor: pointer}.modal-body{height: 450px}.nav-tabs{border:none !important}.nav-tabs .nav-link.active{color: #495057;background-color: #fff;border-color: #ffffff #ffffff #fff;border-top: 3px solid blue !important}.nav-tabs .nav-link{margin-bottom: -1px;border: 1px solid transparent;border-top-left-radius: 0rem;border-top-right-radius: 0rem;border-top: 3px solid #eee;font-size: 20px}.nav-tabs .nav-link:hover{border-color: #e9ecef #ffffff #ffffff}.nav-tabs{display: table !important;width: 100%}.nav-item{display: table-cell}.form-control{border-bottom: 1px solid #eee !important;border:none;font-weight: 600}.form-control:focus{color: #495057;background-color: #fff;border-color: #8bbafe;outline: 0;box-shadow: none}.inputbox{position: relative;margin-bottom: 20px;width: 100%}.inputbox span{position: absolute;top:7px;left: 11px;transition: 0.5s}.inputbox i{position: absolute;top: 13px;right: 8px;transition: 0.5s;color: #3F51B5}input::-webkit-outer-spin-button, input::-webkit-inner-spin-button{-webkit-appearance: none;margin: 0}.inputbox input:focus~span{transform: translateX(-0px) translateY(-15px);font-size: 12px}.inputbox input:valid~span{transform: translateX(-0px) translateY(-15px);font-size: 12px}.pay button{height: 47px;border-radius: 37px}
		</style>
	</head>
	<body>
		<button type="button" class="btn btn-primary launch" data-toggle="modal" data-target="#staticBackdrop"> 
			<i class="fa fa-rocket"></i> Pay Now
		</button>
			<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true"> 
				<div class="modal-dialog"> 
					<div class="modal-content"> 
						<div class="modal-body"> 
							<div class="text-right"> 
								<i class="fa fa-close close" data-dismiss="modal"></i> 
							</div> 
							<div class="tabs mt-3">
								<ul class="nav nav-tabs" id="myTab" role="tablist"> 
									<li class="nav-item" role="presentation">
										<a class="nav-link active" id="visa-tab" data-toggle="tab" href="#visa" role="tab" aria-controls="visa" aria-selected="true">
											<img src="https://i.imgur.com/sB4jftM.png" width="120"> 
										</a> 
									</li> 
									<li class="nav-item" role="presentation"> 
										<a class="nav-link" id="paypal-tab" data-toggle="tab" href="#paypal" role="tab" aria-controls="paypal" aria-selected="false"> 
											<img src="https://1000logos.net/wp-content/uploads/2021/03/Paytm_Logo.png" width="65">
											<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Google_Pay_Logo.svg/2560px-Google_Pay_Logo.svg.png" width="65">
											<img src="https://cdn.cdnlogo.com/logos/p/79/phonepe.svg" width="65">
											<img src="https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/upi-icon.png" width="65">
										</a>
									</li> 
								</ul> 
								<div class="tab-content" id="myTabContent"> 
									<div class="tab-pane fade show active" id="visa" role="tabpanel" aria-labelledby="visa-tab">
										<div class="mt-4 mx-4"> 
											<div class="text-center"> 
												<h5>Credit / Debit Card</h5> 
											</div> 
											<div class="form mt-3"> 
												<div class="inputbox"> 
													<input type="text" name="name" class="form-control" required="required"> 
													<span>Cardholder Name</span> 
												</div> 
												<div class="inputbox"> 
													<input type="text" name="name" min="1" max="999" class="form-control" required="required"> 
													<span>Card Number</span> 
													<i class="fa fa-eye"></i> 
												</div> 
												<div class="d-flex flex-row"> 
													<div class="inputbox"> 
														<input type="text" name="name" min="1" max="999" class="form-control" required="required"> 
														<span>Expiration Date</span>
													</div> 
													<div class="inputbox"> 
														<input type="text" name="name" min="1" max="999" class="form-control" required="required"> 
														<span>CVV</span> 
													</div> 
												</div> 
												<form:form action="/paymentStatus" method="POST" modelAttribute="policy">
													<div class="px-5 pay"> 
														<button type="submit" class="btn btn-success btn-block">Pay</button> 
													</div>
												</form:form>
											</div> 
										</div> 
									</div> 
									<div class="tab-pane fade" id="paypal" role="tabpanel" aria-labelledby="paypal-tab"> 
										<div class="px-5 mt-5"> 
											<div class="inputbox"> 
												<input type="text" name="name" class="form-control" required="required"> 
												<span>Enter UPI ID</span> 
											</div>
											<form:form action="/paymentStatus" method="POST" modelAttribute="policy">
												<div class="pay px-5"> 
													<button type="submit" class="btn btn-primary btn-block">Pay</button> 
												</div>
											</form:form>
										</div> 
									</div> 
								</div> 
							</div> 
						</div> 
					</div> 
				</div>
			</div>
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	</body>
</html>