
<?php

include 'connect.php';
// $con=mysqli_connect("localhost","root1","pass","library")or die("can't connect...");
session_start();
$username = $_POST["username"];
$password = $_POST["password"];
$result=mysqli_query($con,"select * from admin where username = '$username'");
	$row=mysqli_fetch_array($result);
	if($row['password']==$password)
	{
		$_SESSION['username']=$username;
 		header("Location:adminpanel.php");
		//  echo "Hello";
 	}
 	else
 	{
 		header("location:login.php?err=1");
		 echo mysqli_error($con);
 	}
 


?>
