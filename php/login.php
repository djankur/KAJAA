<?php
include 'connect.php';
$email=$_POST['email'];
$password =$_POST['password'];
$sql="SELECT * FROM `user` WHERE email= '$email' AND password= '$password' ";
$result= mysqli_query($con,$sql);
$count=mysqli_num_rows($result);
      if($count > 0)
{
        while ($row=mysqli_fetch_array($result))
        {
           echo json_encode("success");
            mysqli_close($con);
        }
    }
    else
    {
        
             echo json_encode("error");
            
    }

?>