<?php
include 'connect.php';

$email = $_GET["email"];

$query = "select * from user where email = '$email' ";
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