<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<link rel="icon" href="./img/banano.ico">
	<title>Bananza</title>
</head>
<body>
	<nav>
		<div class = "topLogo">
			<img src="./img/banano.png">
			<div>Bananza!</div>
		</div>
		<ul class = "menuCtn">
			<li class = "menu">
			 	Log in 
			 	<ul class = "dropdown" >
			 		<li>
			 			<input type="text" name="userName" placeholder="Username">
			 		</li>
			 		<li>
			 			<input type="password" name="password" placeholder="Password">
			 		</li>
			 		<li>
			 			<button>Log In</button>
			 		</li>
			 	</ul>
			</li>
			<li class = "menu">
			 	Sign up
			 	<form class = "dropdown" action="./includes/signup.php" method="POST">
			 		<div>
			 			<input type="text" name="userName" placeholder="Username">
			 		</div>
			 		<div>
			 			<button> Check</button>
			 		</div>
			 		<div>
			 			<input type="password" name="password" placeholder="Password">
			 		</div>
		 			<div>
		 				<input type="password" name="check" placeholder="Retype Password">
		 			</div>
		 			<div>
		 				<button type ="submit" name="submit">Submit</button>
		 			</div>
			 			
			 			
			 			
			 			
			 	</form>
			</li>
		</ul>
	</nav>
	<script type="text/javascript" src ="./js/main.js"></script>
</body>
</html>