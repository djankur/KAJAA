<!DOCTYPE html>
<html lang="en">
<title>Ok AJAA</title>
<link rel="icon" href="image/logo.jpg">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-orange.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<style>
  body {
    margin: 0;

    width: 100%;
    margin: 0px;
  }

  h1,
  h2,
  h3,
  h4,
  h5,
  h6 {
    font-family: "Lato", sans-serif
  }

  .w3-bar,
  h1,
  button {
    font-family: "Montserrat", sans-serif
  }



  .w3-button {
    margin: 20px;
    border-radius: 3px;
    font-weight: bold;
    color: rgb(255, 87, 36);
  }

  .header {
    margin-bottom: 0;
    padding: 203px 200px;
    background-attachment: fixed;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
  }

  .card {
    width: 100%;
    height: 330px;
    box-shadow: 1px 1px 15px 5px lightgray;
  }

  .card-body {
    text-align: center;
  }

  .card span {
    padding: 20px;
    text-align: center;
    font-size: 80px;
    color: rgb(255, 87, 36);
  }

  .row {
    padding: 20px;
    margin-top: 20px;
    margin-bottom: 20px;
  }

  ::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
    box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
    background-color: white;
  }

  ::-webkit-scrollbar {
    width: 6px;
    background: rgb(255, 37, 24);
  }

  ::-webkit-scrollbar-thumb {
    background: rgb(255, 37, 24);
    background: -moz-linear-gradient(180deg, rgba(255, 37, 24, 1) 0%, rgba(222, 133, 9, 1) 67%, rgba(222, 190, 162, 1) 86%);
    background: -webkit-linear-gradient(180deg, rgba(255, 37, 24, 1) 0%, rgba(222, 133, 9, 1) 67%, rgba(222, 190, 162, 1) 86%);
    background: linear-gradient(180deg, rgba(255, 37, 24, 1) 0%, rgba(222, 133, 9, 1) 67%, rgba(222, 190, 162, 1) 86%);

  }

  #book{
    margin-top: -100px;
  }
</style>

<body>



  <!-- Header -->
  <div class="header"  style="background:	linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5)), url(image/car.jpeg);background-repeat:no-repeat;
	background-size:cover;
  background-position: center; color:white;">
    <div class="w3-center">
      
      <h1 class="w3-margin w3-jumbo">OK_AJAA</h1>

      
      <button class="w3-button w3-theme w3-hover-black w3-padding-large w3-large w3-margin-top" onclick="location.href='admin/login.php'">
        <span class="material-icons">admin_panel_settings</span> ADMIN LOGIN</button>
    </div>
  </div>

  <!-- First Grid
  <div class="container">
    <div class="row">
      <div class="col-4">
        <div class="card">
          <span class="material-icons">
            library_books
          </span>
          <div class="card-body">
            <h5 class="card-title">Acquisition & Cataloguing</h5>
            <p class="card-text">The acquisition & cataloguing feature of the library management system enables the librarian to select & buy books, journals, and other resources and create a database of the same for easy book search.</p>

          </div>
        </div>
      </div>
      <div class="col-4">
        <div class="card">
          <span class="material-icons">
            receipt
          </span>
          <div class="card-body">
            <h5 class="card-title">Serial Control</h5>
            <p class="card-text">The serial control feature of the library software enables the librarians to handle or control processes such as subscription, renewals of books or their cancellations.</p>

          </div>
        </div>
      </div>
      <div class="col-4">
        <div class="card">
          <span class="material-icons">
            qr_code_2
          </span>
          <div class="card-body">
            <h5 class="card-title">Bar code</h5>
            <p class="card-text">When a book is added by the librarian, an unique bar code is automatically generated which can be scaned to get the book details when issuing or returning the book by a student.</p>

          </div>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-4">
        <div class="card">
          <span class="material-icons">
            update
          </span>
          <div class="card-body">
            <h5 class="card-title">Updating records</h5>
            <p class="card-text">Book details or student details can be easily updated in the librarian dashboard. updating book quantity or changing the description, everything can be done in one click.</p>

          </div>
        </div>
      </div>
      <div class="col-4">
        <div class="card">
          <span class="material-icons">
            manage_search
          </span>
          <div class="card-body">
            <h5 class="card-title">Circulation</h5>
            <p class="card-text">The circulation feature enables the librarian to create and manage borrower types along with keeping a tab on their book issue date, return date, dues, and fines. It enables a smooth circulation of books in the library.</p>

          </div>
        </div>
      </div>
      <div class="col-4">
        <div class="card">
          <span class="material-icons">
            school
          </span>
          <div class="card-body">
            <h5 class="card-title">Student Dashboard</h5>
            <p class="card-text">Students get their own dashboard which can be accessed only by them. They can view or update their profile and browse through their records of borrowed books.</p>

          </div>
        </div>
      </div>
    </div>
  </div> -->

  <!-- Second Grid -->
  <div class="w3-row-padding w3-light-grey w3-padding-64 w3-container">
    <center>
      <h3><u>Creators</u></h3>
      <p>Anirban Dev Sharma</p>
      <p>Ankur Jyoti Das</p>
      <p>Jugantar Kashyap</p>
      <p>Kaushik Medhi</p>
      <p>Anamitrra Vijay</p>
    </center>
  </div>


  <!-- Footer -->
  <footer class="w3-container w3-padding-64 w3-center w3-opacity">
    <div class="w3-xlarge w3-padding-32">
      <i class="fa fa-facebook-official w3-hover-opacity"></i>
      <i class="fa fa-instagram w3-hover-opacity"></i>
      <i class="fa fa-snapchat w3-hover-opacity"></i>
      <i class="fa fa-pinterest-p w3-hover-opacity"></i>
      <i class="fa fa-twitter w3-hover-opacity"></i>
      <i class="fa fa-linkedin w3-hover-opacity"></i>
    </div>
  </footer>



</body>

</html>