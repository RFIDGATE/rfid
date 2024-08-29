<?php 
error_reporting(0);
include '../Includes/dbcon.php';
include '../Includes/session.php';

if (isset($_GET['action']) && $_GET['action'] == 'unblock') {
    // Ensure registeredstudentid is set and numeric
    if (isset($_GET['Id']) && is_numeric($_GET['Id'])) {
        $registeredstudentid = $_GET['Id'];

        // Perform unblock operation by deleting from blockrfidstud table
        $delete_query = "DELETE FROM blockrfidstud WHERE studentregis_id = $registeredstudentid";
        $delete_result = mysqli_query($conn, $delete_query);

        if ($delete_result) {
            //echo "Student with ID $registeredstudentid has been unblocked successfully.";
            // Optionally redirect or refresh the page after deletion
            header("Location: ".$_SERVER['PHP_SELF']);
            exit();
        } else {
            echo "Error: Unable to unblock student. " . mysqli_error($conn);
        }
    } else {
        echo "Error: Invalid student ID.";
    }
}

// Query to fetch blocked RFID data along with student and RFID information
$query = "SELECT b.id, rs.idpicture, rs.rfid_card_id, rs.student_id, sl.student_name, sl.course, sl.year, b.blocked_on, rc.uid, rs.registeredstudentid
        FROM blockrfidstud b
        LEFT JOIN registeredrfid_student rs ON b.studentregis_id = rs.registeredstudentid
        LEFT JOIN student_list sl ON rs.student_id = sl.student_id_number
        LEFT JOIN rfid_cards rc ON rs.rfid_card_id = rc.id";

$result = mysqli_query($conn, $query);

if (!$result) {
    die('Error fetching data: ' . mysqli_error($conn));
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
  <?php include 'includes/title.php';?>
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
                xmlhttp = new XMLHttpRequest();
            } else {
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("txtHint").innerHTML = this.responseText;
                }
            };
            xmlhttp.open("GET","ajaxClassArms.php?cid="+str,true);
            xmlhttp.send();
        }
    }
  </script>
</head>

<body id="page-top">
  <div id="wrapper">
    <!-- Sidebar -->
    <?php include "Includes/sidebar.php";?>
    <!-- Sidebar -->
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <!-- TopBar -->
        <?php include "Includes/topbar.php";?>
        <!-- Topbar -->
        <!-- Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Blocked</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Blocked Rfid</li>
            </ol>
          </div>
              <!-- Input Group -->
              <div class="row">
                <div class="col-lg-12">
                  <div class="card mb-4">
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                      <h6 class="m-0 font-weight-bold text-primary">Blocked Rfid</h6>
                    </div>
                    <div class="table-responsive p-3" style="max-height: 600px; overflow-y: auto;">
                    <div class="p-3">
              
                      <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                        <thead class="thead-light">
                        <tr>
                            <th>#</th>
                            <th>ID Picture</th>
                            <th>ID number</th>
                            <th>RFID No</th>
                            <th>Name</th>
                            <th>Course</th>
                            <th>Year</th>
                            <th>Blocked On</th>
                            <th>Action</th>

                          </tr>
                        </thead>
                        <tbody>
                          <?php
                          $count = 1;
                          while ($row = mysqli_fetch_assoc($result)) {
                              echo "<tr>";
                              echo "<td><img src='../idpictures/".$row['idpicture']."' alt='ID Picture' width='100'></td>";
                              echo "<td>" . $row['student_id'] . "</td>";
                              echo "<td>" . $row['uid'] . "</td>";
                              echo "<td>" . $row['student_name'] . "</td>";
                              echo "<td>" . $row['course'] . "</td>";
                              echo "<td>" . $row['year'] . "</td>";
                              echo "<td>" . $row['blocked_on'] . "</td>";
                              echo "<td><a href='?action=unblock&Id=" . $row['registeredstudentid'] . "' onclick='return confirm(\"Are you sure you want to unblock this student?\");'><i class='fas fa-fw fa-unlock'></i></a></td>";
                              echo "</tr>";
                              $count++;
                          }
                          ?>
                          </tbody>

                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
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
    $(document).ready(function () {
      $('#dataTable').DataTable(); // ID From dataTable 
      $('#dataTableHover').DataTable(); // ID From dataTable with Hover
    });
  </script>
</body>

</html>
