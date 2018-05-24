<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="main.css">
	<title>Bananza</title>
</head>
<body>
<div class="topnav" >
	<div class="container" style="margin-left:10px">
		<div class="l"> Bananza </div>
		<div> </div>
		<div class="r"> 
			<div class="container" >
				<div class="navItem" onclick="loginDropDown()">
					Log In

				</div>
				<div class="navItem">
					Sign Up  

				</div>
				<div class = "navItem">
					<->
				</div>
			</div>

		</div>
	</div>
</div>
<div class="content">
	<div class="container">
		<div class = "l" style ="width:80%">
			<div class = "container" style="height: 50%">
				<div class="l" style="width: 50%">
					<div class="box">
						Game Goes Here
					</div>
					
				</div>
				<div class="r" style="width: 50%">
					<div class="box">
						Betting stuff goes here
					</div>
					
				</div>
			</div>
			<div style="height: 50%">
				<div class="box">
						Chat box here
				</div>
				
			</div>
			
		</div>
		<div class = "r" style ="width:20%">
			<div class="box">
						other info here
			</div>
		</div>
		
	</div>
</div>



<?php 
function loginDropDown()
{
	echo "hello";
}
 ?>
}
</body>
</html>