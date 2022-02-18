<?php
include 'connect.php';
$name=$_POST['name'];
$email=$_POST['email'];
$password =$_POST['password'];
$sql="INSERT INTO user (id,name,email,password)VALUES('','$name','$email','$password') ";
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