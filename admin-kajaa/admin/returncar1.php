<?php

include 'connect.php';
// $con=mysqli_connect("localhost","root1","pass","library")or die("can't connect...");



    $transaction_id=$_GET["transaction_id"];
    

    $result = mysqli_query($con, "update car_transaction set issue_status='returned' where transaction_id= '$transaction_id'");

    
    if($result){

        
        header("location:returncar.php?ok=booked");
    }
    else{
        echo "failed:  ";
        echo mysqli_error($con);
    
    }
    

?>