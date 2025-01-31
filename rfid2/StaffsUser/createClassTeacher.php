<?php 
error_reporting(0);
include '../Includes/dbcon.php';
include '../Includes/session.php';

// Block staff logic
if (isset($_GET['action']) && $_GET['action'] == "block" && isset($_GET['Id'])) {
    $staffId = $_GET['Id'];

    // Generate the current timestamp in MySQL format
    $timestamp = date('Y-m-d H:i:s');

    // Insert query for blockrfidstaff table
    $query = "INSERT INTO blockrfidstaff (blocked_on, staffregis_id)
              VALUES ('$timestamp', '$staffId')";

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
            <h1 class="h3 mb-0 text-gray-800">Staffs</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Registered Staffs</li>
            </ol>
          </div>
              <!-- Input Group -->
              <div class="row">
                <div class="col-lg-12">
                  <div class="card mb-4">
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                      <h6 class="m-0 font-weight-bold text-primary">Registered Staffs</h6>
                    </div>
                    <div class="table-responsive p-3">
                      <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                        <thead class="thead-light">
                          <tr>
                            <th>#</th>
                            <th>ID Picture</th>
                            <th>RFID No</th>
                            <th>ID Number</th>
                            <th>Name</th>
                            <th>Department</th>
                            <th>Role</th>
                            <th>Block</th>
                          </tr>
                        </thead>
                        <tbody>
                          <?php
                            $query = "
                              SELECT 
                                      rrs.registeredstaffid, 
                                      rc.uid AS rfid_no, 
                                      sl.staff_id_number, 
                                      sl.staff_name, 
                                      sl.department,
                                      sl.role,
                                      rrs.idpicture
                                  FROM 
                                      registeredrfid_staff rrs
                                  JOIN 
                                      rfid_cards rc ON rrs.rfid_card_id = rc.id
                                  JOIN 
                                      staff_list sl ON rrs.staff_id = sl.staff_id
                                  LEFT JOIN 
                                      blockrfidstaff brs ON rrs.registeredstaffid = brs.staffregis_id
                                  WHERE 
                                      rrs.staff_id IS NOT NULL
                                      AND brs.staffregis_id IS NULL";
                            $rs = $conn->query($query);
                            $num = $rs->num_rows;
                            $sn=0;

                            if($num > 0)
                            { 
                              while ($rows = $rs->fetch_assoc())
                              {
                                   $sn = $sn + 1;
                              $staffName = explode(' ', $rows['staff_name']);
                              echo "
                                <tr>
                                  <td>".$sn."</td>
                                  <td><img src='../idpicture/".$rows['idpicture']."' width='auto' height='50'></td>
                                  <td>".$rows['rfid_no']."</td>
                                  <td>".$rows['staff_id_number']."</td>
                                  <td>".$staffName[0]."</td>
                                  <td>".$rows['department']."</td>
                                  <td>".$rows['role']."</td>
                                  <td><a href='?action=block&Id=".$rows['registeredstaffid']."'><i class='fas fa-fw fa-ban'></i></a></td>
                                  
                                </tr>";
                              }
                            }
                            else
                            {
                                echo   
                                "<div class='alert alert-danger' role='alert'>
                                  No Record Found!
                                </div>";
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
      <?php include "Includes/footer.php";?>
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
    $(document).ready(function () {
      $('#dataTable').DataTable(); // ID From dataTable 
      $('#dataTableHover').DataTable(); // ID From dataTable with Hover
    });
  </script>
</body>

</html>
