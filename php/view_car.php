<?php
include 'connect.php';
$cars = [];
$query = "select * from car";
$result = mysqli_query($con,$query);
while($row = mysqli_fetch_assoc($result)){
    $cars[] = $row;
}


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