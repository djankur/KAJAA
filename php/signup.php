<?php
include 'connect.php';
$name=$_POST['name'];
$email=$_POST['email'];
$password =$_POST['password'];
$sql="INSERT INTO user (user_id,name,email,password)VALUES(null,'$name','$email','$password') ";
if (mysqli_query($con,$sql))
{
    echo json_encode("success");
     mysqli_close($con);
 }

else
{
 
      echo json_encode("error");
     
}


?>