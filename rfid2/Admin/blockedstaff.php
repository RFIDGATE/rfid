<?php 
error_reporting(0);
include '../Includes/dbcon.php';
include '../Includes/session.php';

if (isset($_GET['action']) && $_GET['action'] == 'unblock') {
    // Ensure registeredstaffid is set and numeric
    if (isset($_GET['Id']) && is_numeric($_GET['Id'])) {
        $registeredstaffid = $_GET['Id'];

        // Perform unblock operation by deleting from blockrfidstaff table
        $delete_query = "DELETE FROM blockrfidstaff WHERE staffregis_id = $registeredstaffid";
        $delete_result = mysqli_query($conn, $delete_query);

        if ($delete_result) {
            //echo "Staff with ID $registeredstaffid has been unblocked successfully.";
            // Optionally redirect or refresh the page after deletion
            header("Location: ".$_SERVER['PHP_SELF']);
            exit();
        } else {
            echo "Error: Unable to unblock staff. " . mysqli_error($conn);
        }
    } else {
        echo "Error: Invalid staff ID.";
    }
}

// Query to fetch blocked RFID data along with staff and RFID information
$query = "SELECT b.id, rs.idpicture, rs.rfid_card_id, rs.staff_id, sl.staff_name, sl.department, sl.role, b.blocked_on, rc.uid, rs.registeredstaffid
        FROM blockrfidstaff b
        LEFT JOIN registeredrfid_staff rs ON b.staffregis_id = rs.registeredstaffid
        LEFT JOIN staff_list sl ON rs.staff_id = sl.staff_id
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
                            <th>RFID No</th>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Department</th>
                            <th>Role</th>
                            <th>Blocked On</th>
                            <th>Action</th>

                          </tr>
                        </thead>
                        <tbody>
                        <?php
                          $count = 1;
                          while ($row = mysqli_fetch_assoc($result)) {
                              echo "<tr>";
                              echo "<td>" . $count . "</td>";
                              echo "<td><img src='../idpictures/".$row['idpicture']."' alt='ID Picture' width='50'></td>";
                              echo "<td>" . $row['uid'] . "</td>";
                              echo "<td>" . $row['staff_id'] . "</td>";
                              echo "<td>" . $row['staff_name'] . "</td>";
                              echo "<td>" . $row['department'] . "</td>";
                              echo "<td>" . $row['role'] . "</td>";
                              echo "<td>" . $row['blocked_on'] . "</td>";
                              echo "<td><a href='?action=unblock&Id=" . $row['registeredstaffid'] . "' onclick='return confirm(\"Are you sure you want to unblock this staff member?\");'><i class='fas fa-fw fa-unlock'></i></a></td>";
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
