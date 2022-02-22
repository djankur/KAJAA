<?php
session_start();
if (!$_SESSION['username']) {
    header("LOCATION: login.php");
}

$username = $_SESSION['username'];


// $con=mysqli_connect("localhost","root1","pass","library")or die("can't connect...");
include 'connect.php';
include 'main.php';

//$name = $_GET["name"];

?>




<h1 style="text-align: center;">Input Form</h1>


<form action="addcar1.php" method="POST" enctype="multipart/form-data">

    <div class="row g-2">
        <div class="col-md">
            <div class="form-floating mb-3 ">

                <input type="text" class="form-control" name="reg_no" id="reg_no" onkeyup="GetDetail(this.value)" placeholder="reg_no" required>
                <label for="reg_no"> reg_no </label>
            </div>
        </div>

        <div class="col-md">
            <div class="form-floating mb-3">

                <input type="text" class="form-control" name="car_name" id="car_name" placeholder="car_name" required>
                <label for="car_name"> Car Name </label>
            </div>
        </div>
    </div>

    <div class="row g-2">
        <div class="col-md">
            <div class="form-floating mb-3">

                <input type="text" class="form-control" name="company" id="company" placeholder="company" required>
                <label for="company"> company </label>
            </div>
        </div>

        <div class="col-md">
            <div class="form-floating mb-3">
                <input type="number" class="form-control" name="price"  id="price" placeholder="price" required>
                <label for="price"> price </label>

            </div>
        </div>
    </div>



    <div class="row g-2">


        <div class="col-md">
            <div><label for="file"> Photo </label>

                <input type="file" class="form-control" name="file" id="file" required>
            </div>
        </div>
        <div class="col-md">
            <input type="hidden" name="" class="form-control">
        </div>
    </div>

    <div class="col-md" style="margin-top: 20px;">
        <input type="submit" class="btn btn-md btn-success form-control" value="Add " name="submit">
    </div>
    </div>

</form>

<script>
    function GetDetail(str) {
        if (str.length == 0) {
            document.getElementById("b_name").value = "";
            document.getElementById("description").value = "";
            document.getElementById("quantity").value = "";
            document.getElementById("author").value = "";
            document.getElementById("year").value = "";
            document.getElementById("category").value = "";
            document.getElementById("language").value = "";
            document.getElementById("file").value = "";
            return;
        } else {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function() {

                if (this.readyState == 4 &&
                    this.status == 200) {

                    var myObj = JSON.parse(this.responseText);


                    document.getElementById("b_name").value = myObj[0];
                    document.getElementById("description").value = myObj[1];

                    document.getElementById("author").value = myObj[3];
                    document.getElementById("year").value = myObj[4];
                    document.getElementById("category").value = myObj[5];
                    document.getElementById("language").value = myObj[6];
                    document.getElementById("file").value = myObj[7];
                }
            };

            xmlhttp.open("GET", "getbookdetails1.php?isbn=" + str, true);

            xmlhttp.send();
        }
    }
</script>

</body>

</html>