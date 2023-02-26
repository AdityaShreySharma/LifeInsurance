<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>User Sign Up</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<style>
			canvas {
			  	position: absolute;
			  	background-color: black;
			  	width: 100%;
			}
			
			#bg {
			  	position: relative;
			}
			
			#bg canvas, #overlay {
			  	position: absolute;
			}
			
			.container {
				padding-left:100px;
				padding-top: 100px;
				padding-bottom: 100px;
			}
			
			body {
				background-color: black; 
			}
		</style>
	</head>
	<body>
		<div id="bg">
			<canvas id=c></canvas>
		  	<div class="container" id="overlay">
		    	<div class="row d-flex justify-content-center align-items-center h-100">
		      		<div class="col-lg-12 col-xl-11">
		        		<div class="card text-black" style="border-radius: 25px;">
		          			<div class="card-body p-md-5">
		            			<div class="row justify-content-center">
		              				<div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
		
		                				<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign Up</p>
		
		                					<form:form class="mx-1 mx-md-4" action="/saveUser" modelAttribute="user" method="POST">
		                  						<div class="d-flex flex-row align-items-center mb-4">
		                    						<i class="fas fa-user fa-lg me-3 fa-fw"></i>
		                    						<div class="form-outline flex-fill mb-0">
			                    						<label class="form-label" for="form3Example1c">First Name</label>
			                      						<form:input type="text" path="userFirstName" id="form3Example1c" class="form-control" required="required"/>
		                    						</div>
		                  						</div>
		                  						
		                  						<div class="d-flex flex-row align-items-center mb-4">
		                    						<i class="fas fa-user fa-lg me-3 fa-fw"></i>
		                    						<div class="form-outline flex-fill mb-0">
			                    						<label class="form-label" for="form3Example1c">Last Name</label>
			                      						<form:input type="text" path="userLastName" id="form3Example1c" class="form-control" required="required" />
		                    						</div>
		                  						</div>
		                  			
					                  			<div class="d-flex flex-row align-items-center mb-4">
						                    		<i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
						                    		<div class="form-outline flex-fill mb-0">
						                      			<label class="form-label" for="form3Example3c">Email</label>
						                      			<form:input type="email" id="form3Example3c" path="userEmail" class="form-control" required="required" />
						                    		</div>
						                  		</div>
						                  		
						                  		<div class="d-flex flex-row align-items-center mb-4">
						                    		<i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
						                    		<div class="form-outline flex-fill mb-0">
						                      			<label class="form-label" for="form3Example3c">Mobile Number</label>
						                      			<form:input type="tel" id="form3Example3c" path="userMobileNumber" class="form-control" pattern="[0-9]{10}" required="required" />
						                  			</div>
						                  		</div>
						                  		
						                  		<div class="d-flex flex-row align-items-center mb-4">
					                    			<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
					                    			<div class="form-outline flex-fill mb-0">
					                      				<label class="form-label" for="form3Example4c">Password</label>
					                      				<form:input type="password" path="userPassword" id="form3Example4c" class="form-control" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,12}$" required="required"/>
					                    			</div>
					                  			</div>
					                  			
					                  			<div class="d-flex flex-row align-items-center mb-4">
					                    			<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
					                    			<div class="form-outline flex-fill mb-0">
					                      				<label class="form-label" for="form3Example4c">Role</label>
					                      				<form:select path="userRole" id="form3Example4c" class="form-control" required="required">
													        <option value="none">--Select--</option>
													        <option value="Admin">Admin</option>
													        <option value="Client">Client</option>
													    </form:select>
					                    			</div>
					                  			</div>
					
					                  			<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
					                   	 			<button type="submit" class="btn btn-primary btn-lg">Register</button>
					                  			</div>
		                					</form:form>
		              					</div>
		              					
		              					<div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
		              						<img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp" class="img-fluid" alt="Sample image">
							            </div>
		            				</div>
		          				</div>
		        			</div>
		      			</div>
		    		</div>
		  		</div>
		  	</div>
		<script>
			var w = c.width = window.innerWidth,
		    h = c.height = window.innerHeight,
		    ctx = c.getContext( '2d' ),
		    
		    minDist = 10,
		    maxDist = 30,
		    initialWidth = 10,
		    maxLines = 100,
		    initialLines = 4,
		    speed = 5,
		    
		    lines = [],
		    frame = 0,
		    timeSinceLast = 0,
		    
		    dirs = [
		      [ 0, 1 ],
		      [ 1, 0 ],
		      [ 0, -1 ],
		    	[ -1, 0 ],
		      [ .7, .7 ],
		      [ .7, -.7 ],
		      [ -.7, .7 ],
		      [ -.7, -.7]
		    ],
		    starter = {
		      
		      x: w / 2,
		      y: h / 2,
		      vx: 0,
		      vy: 0,
		      width: initialWidth
		    };
	
			function init() {
			  
			  lines.length = 0;
			  
			  for( var i = 0; i < initialLines; ++i )
			    lines.push( new Line( starter ) );
			  
			  ctx.fillStyle = '#222';
			  ctx.fillRect( 0, 0, w, h );
			}
			function getColor( x ) {
			  
			  return 'hsl( hue, 80%, 50% )'.replace(
			  	'hue', x / w * 360 + frame
			  );
			}
			function anim() {
			  
			  window.requestAnimationFrame( anim );
			  
			  ++frame;
			  
			  ctx.shadowBlur = 0;
			  ctx.fillStyle = 'rgba(0,0,0,.02)';
			  ctx.fillRect( 0, 0, w, h );
			  ctx.shadowBlur = .5;
			  
			  for( var i = 0; i < lines.length; ++i ) 
			    
			    if( lines[ i ].step() ) { 
			      
			      lines.splice( i, 1 );
			      --i;
			      
			    }
			  
			  ++timeSinceLast
			  
			  if( lines.length < maxLines && timeSinceLast > 10 && Math.random() < .5 ) {
			    
			    timeSinceLast = 0;
			    
			    lines.push( new Line( starter ) );
			    ctx.fillStyle = ctx.shadowColor = getColor( starter.x );
			    ctx.beginPath();
			    ctx.arc( starter.x, starter.y, initialWidth, 0, Math.PI * 2 );
			    ctx.fill();
			  }
			}
		
			function Line( parent ) {
			  
			  this.x = parent.x | 0;
			  this.y = parent.y | 0;
			  this.width = parent.width / 1.25;
			  
			  do {
			    
			    var dir = dirs[ ( Math.random() * dirs.length ) |0 ];
			    this.vx = dir[ 0 ];
			    this.vy = dir[ 1 ];
			    
			  } while ( 
			    ( this.vx === -parent.vx && this.vy === -parent.vy ) || ( this.vx === parent.vx && this.vy === parent.vy) );
			  
			  this.vx *= speed;
			  this.vy *= speed;
			  
			  this.dist = ( Math.random() * ( maxDist - minDist ) + minDist );
			  
			}
			Line.prototype.step = function() {
			  
			  var dead = false;
			  
			  var prevX = this.x,
			      prevY = this.y;
			  
			  this.x += this.vx;
			  this.y += this.vy;
			  
			  --this.dist;
			  
			  if( this.x < 0 || this.x > w || this.y < 0 || this.y > h )
			    dead = true;
			  
			  if( this.dist <= 0 && this.width > 1 ) {

			    this.dist = Math.random() * ( maxDist - minDist ) + minDist;

			    if( lines.length < maxLines ) lines.push( new Line( this ) );
			    if( lines.length < maxLines && Math.random() < .5 ) lines.push( new Line( this ) );
			    if( Math.random() < .2 ) dead = true;
			  }
			  
			  ctx.strokeStyle = ctx.shadowColor = getColor( this.x );
			  ctx.beginPath();
			  ctx.lineWidth = this.width;
			  ctx.moveTo( this.x, this.y );
			  ctx.lineTo( prevX, prevY );
			  ctx.stroke();
			  
			  if( dead ) return true
			}
		
			init();
			anim();
		
			window.addEventListener( 'resize', function() {
			  
			  w = c.width = window.innerWidth;
			  h = c.height = window.innerHeight;
			  starter.x = w / 2;
			  starter.y = h / 2;
			  
			  init();
			} )
		</script>
	</body>
</html>