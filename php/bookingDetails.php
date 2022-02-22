<?php
include 'connect.php';

$userid = $_POST["user_id"];

$query = "SELECT * from car_transaction where `user_id` = $userid and `issue_status` = 'processing' ";
$result = mysqli_query($con,$query);
$bookings = mysqli_fetch_assoc($result);


if(empty($result)){
    $data = array(
        "success" => false
    );
}else{
    $data = array(
        "success" => true,
        "data" => $bookings
    );
}

echo json_encode($data);
?>