<?php
error_reporting(0);
include '../Includes/dbcon.php';
include '../Includes/session.php';

//------------------------SAVE--------------------------------------------------

if (isset($_POST['save'])) {

  $studentIdNumber = $_POST['student_id_number'];
  $studentName = $_POST['student_name'];
  $year = $_POST['year'];
  $course = $_POST['course'];
  $rfidCardId = $_POST['rfid_card_id'];
  $idPicture = $_FILES['id_picture']['name']; // Assuming file input name is 'id_picture'

  // Check if the ID picture is uploaded successfully
  if (move_uploaded_file($_FILES['id_picture']['tmp_name'], '../idpictures/' . $idPicture)) {
    $query = "INSERT INTO registeredrfid_student (rfid_card_id, student_id, idpicture)
                  VALUES ('$rfidCardId', '$studentIdNumber', '$idPicture')";

    if (mysqli_query($conn, $query)) {
      $statusMsg = "<div class='alert alert-success' style='margin-right:700px;'>Created Successfully!</div>";
    } else {
      $statusMsg = "<div class='alert alert-danger' style='margin-right:700px;'>An error Occurred!</div>";
    }
  } else {
    $statusMsg = "<div class='alert alert-danger' style='margin-right:700px;'>Failed to upload ID picture!</div>";
  }
}

//---------------------------------------EDIT-------------------------------------------------------------


if (isset($_GET['Id']) && isset($_GET['action']) && $_GET['action'] == "edit") {
  $Id = $_GET['Id'];

  $query = "SELECT * FROM registeredrfid_student WHERE registeredstudentid = '$Id'";
  $result = mysqli_query($conn, $query);
  $row = mysqli_fetch_array($result);

  if (isset($_POST['update'])) {
    // Handle update form submission
    // ...
  }
}


//--------------------------------BLOCK------------------------------------------------------------------

if (isset($_GET['action']) && $_GET['action'] == "block" && isset($_GET['Id'])) {
  $studentId = $_GET['Id'];

  // Generate the current timestamp in MySQL format
  $timestamp = date('Y-m-d H:i:s');

  // Insert query for blockrfidstud table
  $query = "INSERT INTO blockrfidstud (blocked_on, studentregis_id)
            VALUES ('$timestamp', '$studentId')";

  // Perform the query
  if (mysqli_query($conn, $query)) {
    // Redirect back to the same page after successful block
    header("Location: " . $_SERVER['PHP_SELF']);
    exit;
  } else {
    echo "Error: " . $query . "<br>" . mysqli_error($conn);
  }
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link href="img/logo/logo.jpg" rel="icon">
  <?php include 'includes/title.php'; ?>
  <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="css/ruang-admin.min.css" rel="stylesheet">



  <script>
    function classArmDropdown(str) {
      if (str == "") {
        document.getElementById("txtHint").innerHTML = "";
        return;
      } else {
        if (window.XMLHttpRequest) {
          // code for IE7+, Firefox, Chrome, Opera, Safari
          xmlhttp = new XMLHttpRequest();
        } else {
          // code for IE6, IE5
          xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
            document.getElementById("txtHint").innerHTML = this.responseText;
          }
        };
        xmlhttp.open("GET", "ajaxClassArms2.php?cid=" + str, true);
        xmlhttp.send();
      }
    }
  </script>
</head>

<body id="page-top">
  <div id="wrapper">
    <!-- Sidebar -->
    <?php include "Includes/sidebar.php"; ?>
    <!-- Sidebar -->
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <!-- TopBar -->
        <?php include "Includes/topbar.php"; ?>
        <!-- Topbar -->

        <!-- Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Registered Students</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Registereds Students</li>
            </ol>
          </div>
          <!-- Input Group -->
          <div class="row">
            <div class="col-lg-12">
              <div class="card mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Student Lists</h6>
                </div>
                <div class="table-responsive p-3" style="max-height: 600px; overflow-y: auto;">
                  <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                    <thead class="thead-light">
                      <tr>
                        <th>#</th>
                        <th>ID Picture</th>
                        <th>Student ID Number</th>
                        <th>Student Name</th>
                        <th>Year</th>
                        <th>Course</th>
                        <th>Block</th>
                      </tr>
                    </thead>

                    <tbody>


                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!--Row-->

        <!-- Documentation Link -->
        <!-- <div class="row">
            <div class="col-lg-12 text-center">
              <p>For more documentations you can visit<a href="https://getbootstrap.com/docs/4.3/components/forms/"
                  target="_blank">
                  bootstrap forms documentations.</a> and <a
                  href="https://getbootstrap.com/docs/4.3/components/input-group/" target="_blank">bootstrap input
                  groups documentations</a></p>
            </div>
          </div> -->

      </div>
      <!---Container Fluid-->
    </div>
    <!-- Footer -->
    <?php include "Includes/footer.php"; ?>
    <!-- Footer -->
  </div>
  </div>

  <!-- Scroll to top -->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="js/ruang-admin.min.js"></script>
  <!-- Page level plugins -->
  <script src="../vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="../vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script>
    $(document).ready(function() {
      $('#dataTable').DataTable(); // ID From dataTable 
      $('#dataTableHover').DataTable(); // ID From dataTable with Hover
    });

    function blockStudentConfirm() {
      return confirm("Are you sure you want to block this student?");
    }
  </script>
</body>

</html>