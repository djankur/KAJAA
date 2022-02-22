<?php
session_start();
if (!$_SESSION['username']) {
    header("LOCATION: login.php");
}

$username = $_SESSION['username'];

include 'connect.php';

include 'main.php';
// $con=mysqli_connect("localhost","root1","pass","library")or die("can't connect...");


$sql = ("SELECT COUNT(reg_no) FROM car");
$rs = mysqli_query($con, $sql);

$sql2 = ("SELECT COUNT(user_id) FROM user");
$rs2 = mysqli_query($con, $sql2);


$result = mysqli_fetch_array($rs);
$result2 = mysqli_fetch_array($rs2);

$sql3 = ("SELECT COUNT(transaction_id) FROM car_transaction where issue_status='proceesed'");
$result3 = mysqli_query($con, $sql3);
$total_issue_book = mysqli_fetch_array($result3);

$sql4 = ("SELECT count(*) FROM car where status = \"available\"");
$result4 = mysqli_query($con, $sql4);
$available_car = mysqli_fetch_array($result4);

$sql5 = ("SELECT distinct count(transaction_id ) FROM car_transaction where issue_status='booked'");
$result5 = mysqli_query($con, $sql5);
$total_returned_book = mysqli_fetch_array($result5);

echo mysqli_error($con);

?>



<div class="row">
    <div class="col">
        <div class="card bg-primary text-white mb-4">
            <div class="card-body">Total Car: <?php echo $result[0]; ?> </div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small text-white stretched-link" href="viewcar.php">View Details</a>
                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="card bg-dark text-white mb-4">
            <div class="card-body">Total Customer: <?php echo $result2[0]; ?></div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small text-white stretched-link" href="viewuser.php">View Details</a>
                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="card bg-success text-white mb-4">
            <div class="card-body">Available car: <?php echo $available_car[0]; ?></div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small text-white stretched-link" href="available.php">View Details</a>
                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <!-- <div class="col">
        <div class="card bg-danger text-white mb-4">
            <div class="card-body">Processed car: <?php echo $total_issue_book[0]; ?> </div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small text-white stretched-link" href="issuebook.php">View Details</a>
                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div> -->
    <div class="col">
        <div class="card bg-info text-white mb-4">
            <div class="card-body">Approved car: <?php echo $total_returned_book[0]; ?></div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small text-white stretched-link" href="returncar.php">View Details</a>
                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
</div>



<div class="container my-4" id="viewstudent">

    <h1 style="text-align: center;">Transaction History</h1>
</div>


<div class="container my-4">
    <table class="table" id="myTable">
        <thead class="thead">
            <tr>
                <td>Transaction ID</td>
                <td>Customer ID</td>
                <td>Customer Name</td>
                <td>Car Name</td>
                <td>Car reg_no</td>
                
                <td>Status</td>
                <td>Price</td>
                <td>Action</td>
                
            </tr>
        </thead>

        <tbody>
            <?php
            
            $query =' SELECT * FROM (( car_transaction inner join car on car_transaction.reg_no = car.reg_no) inner join user on car_transaction.user_id=user.user_id) where car_transaction.issue_status="processing"';
            $result = mysqli_query($con, $query);
            while ($row = mysqli_fetch_array($result)) {
                $status = $row["issue_status"];
                $issue_time = strtotime($row["issue_date"]);
                $return_time = strtotime($row["return_date"]);
                $offset = 24 * 60 * 60;
                $remaining = $return_time - $issue_time;
                $remaining_day = floor($remaining / $offset);
                $amount=$remaining_day*($row["price"]);
                
                $r_str = "";
                $r_status = "";
                $action = "";


                echo '
                <tr>
                    <td style="vertical-align:middle;">' . $row["transaction_id"] . '</td>
                    <td style="vertical-align:middle;">' . $row["user_id"] . '</td>
                    <td style="vertical-align:middle;">' . $row["name"] . '</td>
                    <td style="vertical-align:middle;">' .  $row["company"] . $row["car_name"] . '</td>
                    <td style="vertical-align:middle;">' . $row["reg_no"] . '</td>
                    <td style="vertical-align:middle;">' . $row["issue_status"] . '</td>
                    <td style="vertical-align:middle;">' . $amount. '</td>


                    <td >  <button class="btn btn-success"><a href="approvecar.php?reg_no=' . $row["reg_no"] . '" class="action">Approve</a></button></td>
 
                </tr>
    ';
            }
            ?>
        </tbody>


    </table>
</div>


</div>
</main>
<footer class="py-4 bg-light mt-auto">
    <div class="container-fluid px-4">
        <div class="d-flex align-items-center justify-content-between small">
            <div class="text-muted">Copyright &copy; Your Website 2021</div>
            <div>
                <a href="#">Privacy Policy</a>
                &middot;
                <a href="#">Terms &amp; Conditions</a>
            </div>
        </div>
    </div>
</footer>
</div>
</div>



<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>



<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
</script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous">
</script>
<script src="//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready(function() {
        $('#myTable').DataTable({
            responsive: true
        });

    });
</script>
<script>
    $(document).ready(function() {
        $('#myTable2').DataTable({
            responsive: true
        });

    });
</script>


</body>

</html>