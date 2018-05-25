<?php 

if(isset($_POST['submit']))
{

	include_once('dbh.php');

	//I should probably change mysqli to PDO later
	$userName = mysqli_real_escape_string($conn, $_POST['userName']);
	$password = mysqli_real_escape_string($conn, $_POST['password']);
	$email = mysqli_real_escape_string($conn, $_POST['email']);

	if (empty($email))
	{
		$email = "emailNotSet";
	}

	if (empty($userName) || empty($password))
	{	
		if (empty($userName) && empty($password))
		{
			oops("username_and_password_both_empty");
		}
		if (empty($userName))
		{
			oops("username_empty");
		}
		oops("password_empty");
		
	} else
	{
		$sql = "SELECT * FROM users WHERE name='$userName';";
		$result = mysqli_query($conn,$sql);
		$resultCheck = mysqli_num_rows($result);
		if ($resultCheck > 0)
		{
			oops("userTaken");
		} else
		{
			//Hash and salt Pwd (password_hash automatically salts with pseudorandomly generated number)
			//to do: improve security: add javascript client-side hashing
			$hashedPwd = password_hash($password.$userName, PASSWORD_DEFAULT);
			$sql = "INSERT INTO users (name,email,pass) VALUES ('$userName','$email','$hashedPwd');";
			$result = mysqli_query($conn, $sql);
			oops("success");
		}
	}

} else
{
	oops("button_not_pressed");
}

function oops($str)
{	
	$addStr = "";
	if (strlen($str)>0)
	{
		$addStr = "?signup=".$str;
	}
	header("Location: ../index.php".$addStr);
	exit();
}