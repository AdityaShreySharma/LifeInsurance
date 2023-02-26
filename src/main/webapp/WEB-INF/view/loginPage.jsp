<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	</head>
	<style>	
		@import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');
		
		body {
			background: #f6f5f7;
			display: flex;
			justify-content: center;
			align-items: center;
			flex-direction: column;
			font-family: 'Montserrat', sans-serif;
			height: 100vh;
			
		}
		
		h1 {
			font-weight: bold;
			margin-bottom: 20px;
		}
		
		h2 {
			text-align: center;
		}
		
		button {
			border-radius: 20px;
			border: 1px solid #FF4B2B;
			background-color: #FF4B2B;
			color: #FFFFFF;
			font-size: 12px;
			font-weight: bold;
			padding: 12px 45px;
			letter-spacing: 1px;
			text-transform: uppercase;
			transition: transform 80ms ease-in;
		}
		
		button:active {
			transform: scale(0.95);
		}
		
		button:focus {
			outline: none;
		}
		
		button.ghost {
			background-color: transparent;
			border-color: #FFFFFF;
		}
		
		form {
			background-color: #FFFFFF;
			display: flex;
			align-items: center;
			justify-content: center;
			flex-direction: column;
			padding: 0 50px;
			height: 100%;
			text-align: center;
		}
		
		input {
			background-color: #eee;
			border: none;
			padding: 12px 15px;
			margin: 8px 0;
			width: 100%;
		}
		
		.container {
			background-color: #fff;
			border-radius: 20px;
			position: relative;
			overflow: hidden;
			width: 500px;
			max-width: 100%;
			min-height: 480px;
		}
		
		.form-container {
			position: absolute;
			top: 0;
			height: 100%;
			transition: all 0.6s ease-in-out;
		}
		
		.sign-in-container {			
			width: 100%;
			z-index: 2;
			left: 0;
		}
		
		canvas {
		  position: absolute;
		  top: 0;
		  left: 0;
		  background-color: black;
		}
	</style>
	<body>
		<div class="container">
			<div class="form-container sign-in-container">
				<form:form action="/verifyLogin">
					<h1>Login</h1>
					<input type="email" placeholder="Email" name="email"/>
					<input type="password" placeholder="Password" name="password"/>
					<button type="submit" style="margin-top: 20px;">Login</button>
				</form:form>
			</div>
		</div>
		<canvas id=c></canvas>
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