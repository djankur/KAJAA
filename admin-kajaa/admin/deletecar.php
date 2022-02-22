<?php

include 'connect.php';
// $con=mysqli_connect("localhost","root1","pass","library")or die("can't connect...");



    $reg_no=$_GET["reg_no"];

    $result = mysqli_query($con, "delete from car where reg_no='$reg_no'");

    
    if($result){
        header("location:viewcar.php?ok=1");
    }
    else{
        echo "failed:  ";
        echo mysqli_error($con);
    
    }
    

?>