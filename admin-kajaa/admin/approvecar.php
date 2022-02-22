<?php

include 'connect.php';
// $con=mysqli_connect("localhost","root1","pass","library")or die("can't connect...");



    $reg_no=$_GET["reg_no"];
    

    $result = mysqli_query($con, "update car_transaction set issue_status='booked' where reg_no= '$reg_no'");

    
    if($result){
        header("location:returncar.php?ok=booked");
    }
    else{
        echo "failed:  ";
        echo mysqli_error($con);
    
    }
    

?>