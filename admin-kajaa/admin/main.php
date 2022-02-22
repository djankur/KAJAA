<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Ok Ajaa</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="js/datatables-simple-demo.js"></script>



    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script language="JavaScript" type="text/javascript">
        $(document).ready(function() {
            $("a.action").click(function(e) {
                if (!confirm('Are you sure?')) {
                    e.preventDefault();
                    return false;
                }
                return true;
            });
        });
    </script>

    <style>
        .navbar-brand {
            font-size: 18px;
            line-height: 1;
        }

        .thead {
            background-color: rgb(34, 37, 41);
            font-weight: 600;
            color: white;
            border-radius: 5rem;
        }

        a {
            color: white;
        }

        button {
            margin: 5px;
        }

        ::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
            box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
            background-color: #F5F5F5;
        }

        ::-webkit-scrollbar {
            width: 6px;
            background-color: #F5F5F5;
        }

        ::-webkit-scrollbar-thumb {
            background-color: #000000;
        }


        .book_card {
            flex: 1;
            flex-basis: 300px;
            flex-grow: 0;
            width: 334px;
            aspect-ratio: 3 / 4.2;
            background: #fff;
            border: 2px solid #fff;
            box-shadow: 0px 4px 7px rgba(0, 0, 0, .5);
            cursor: pointer;
            transition: all .5s cubic-bezier(.8, .5, .2, 1.4);
            overflow:hidden;
            position: relative;
        }

        .book_card img {
            width: 100%;
            height: 100%;
            transition: all .5s cubic-bezier(.8, .5, .2, 1.4);
        }

        .descriptions {
            position: absolute;
            top: 0px;
            left: 0px;
            background-color: rgba(0, 0, 0, .7);
            width: 100%;
            height: 100%;
            transition: all .7s ease-in-out;
            padding: 20px;
            box-sizing: border-box;
            clip-path: circle(0% at 100% 100%);
        }

        .book_card:hover .descriptions {
            left: 0px;
            transition: all .7s ease-in-out;
            clip-path: circle(75%);
            overflow-y:auto;
        }

        .book_card:hover {
            transition: all .5s cubic-bezier(.8, .5, .2, 1.4);
            box-shadow: 0px 2px 3px rgba(0, 0, 0, .3);
            transform: scale(.97);
        }

        .book_card:hover img {
            transition: all .5s cubic-bezier(.8, .5, .2, 1.4);
            transform: scale(1.6);
            filter: blur(4px);
        }

        .book_card h1 {
            color: #ff3838;
            letter-spacing: 1px;
            margin: 0px;
        }
        .book_card h5{
            color: turquoise;
        }

        .book_card p {
            line-height: 24px;
            height: 70%;
            color: white;
        }

        .book_card button {
            width: fit-content;
            height: 40px;
            cursor: pointer;
            border-style: none;
            background-color: #ff3838;
            color: #fff;
            font-size: 15px;
            outline: none;
            box-shadow: 0px 2px 3px rgba(0, 0, 0, .4);
            transition: all .5s ease-in-out;
        }

        .book_card button:hover {
            transform: scale(.95) translateX(-5px);
            transition: all .5s ease-in-out;
        }
    </style>
</head>

<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand" href="adminpanel.php">oK AJAA <br> ADMIN PANNEL</a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>

        <ul class="navbar-nav  ms-auto me-0 me-md-3 my-2 my-md-0">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="changepass.php">Change Password</a></li>
                    <li>
                        <hr class="dropdown-divider" />
                    </li>
                    <li><a class="dropdown-item" href="logout.php">Logout</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Core</div>
                        <a class="nav-link" href="adminpanel.php">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div> 
                            Dashboard
                        </a>
                        <div class="sb-sidenav-menu-heading"></div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Cars
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="addcar.php">Add car</a>
                                <a class="nav-link" href="viewcar.php">View car</a>
                               
                            </nav>
                        </div>
                        <!-- <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                            <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                            Customers
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                <a class="nav-link" href="addstudent.php">Add user</a>
                                <a class="nav-link" href="viewcar.php">View user</a>

                            </nav>
                        </div> -->

                    </div>
                </div>
               
            </nav>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Admin Panel </h1>
                    <!-- <ol class="breadcrumb mb-1">
                        <li class="breadcrumb-item active"></li>
                    </ol> -->