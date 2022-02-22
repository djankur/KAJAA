
<?php

include 'connect.php';



$reg_no = $_POST["reg_no"];
$car_name = $_POST["car_name"];
$company = $_POST["company"];
$price = $_POST["price"];
$status = "available";
$file = $_FILES["file"];

if (isset($_POST['submit'])) {

	$filename = $file['name'];
	$filerror = $file['error'];
	$filetemp = $file['tmp_name'];
	$filetype = $file['type'];
	$filesize = $file['size'];
	$success_msg = false;
	$resultset = array();

	$fileExt = explode('.', $filename);
	$fileActualEXt = strtolower(end($fileExt));

	$allowed = array('jpg', 'jpeg', 'png');

	if (in_array($fileActualEXt, $allowed)) {
		if ($filerror === 0) {
			if ($filesize < 1120000) {
				$filenamenew = uniqid('', true) . "." . $fileActualEXt;
				$filedestination = 'uploads/' . $filenamenew;
				move_uploaded_file($filetemp, $filedestination);

				$query = "INSERT INTO car VALUES ( '$reg_no', '$car_name', '$company', '$price', '$status',  '$filedestination')";


				if (mysqli_query($con, $query)) {

					?>
							<SCRIPT> 
        						alert('Successfuly Added car to Database');

    						</SCRIPT>
					<?php
					header("location:viewcar.php");

				} else {
					echo mysqli_error($con);
				}
			} else {
				echo "File size should be less than 5mb";
			}
		} else {
			echo "There was an error uploading your file";
		}
	} else {
		echo " Invalid File type";
	}
}
?>
