<?php
include 'connect.php';

$carid = $_POST["carid"];

$query = "select * from car where car_id = $carid";
$result = mysqli_query($con,$query);
$cars = mysqli_fetch_assoc($result);


if(empty($result)){
    $data = array(
        "success" => false
    );
}else{
    $data = array(
        "success" => true,
        "data" => $cars
    );
}

echo json_encode($data);
?>