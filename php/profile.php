<?php
include 'connect.php';

$user_id = $_POST["user_id"];

$query = "select * from car where car_id = $user_id";
$result = mysqli_query($con,$query);
$user = mysqli_fetch_assoc($result);


if(empty($result)){
    $data = array(
        "success" => false
    );
}else{
    $data = array(
        "success" => true,
        "data" => $user
    );
}

echo json_encode($data);
?>