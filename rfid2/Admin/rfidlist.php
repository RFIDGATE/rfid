<?php
error_reporting(0);
include '../Includes/dbcon.php';
include '../Includes/session.php';

// Handle POST request to save RFID data
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['uid'])) {
  $uid = $_POST['uid'];
  $timestamp = date('Y-m-d H:i:s'); // Current timestamp

  // Insert RFID data into the database
  $stmt = $conn->prepare("INSERT INTO rfid (uid, timedate) VALUES (?, ?)");
  $stmt->bind_param("ss", $uid, $timestamp);
  $stmt->execute();
  $stmt->close();
}

// Pagination setup
$results_per_page = isset($_GET['results']) ? $_GET['results'] : 10;
$page = isset($_GET['page']) ? $_GET['page'] : 1;
$offset = ($page - 1) * $results_per_page;

// Query to fetch data from the RFID table
$sql = "
SELECT * 
FROM rfid
ORDER BY timedate DESC 
LIMIT $offset, $results_per_page";

$result = $conn->query($sql);
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
  <style>
    .table-container {
      max-height: 300px;
      overflow-y: auto;
    }

    .pagination-links {
      position: fixed;
      width: 100%;
      bottom: 0;
      left: 0;
      background-color: #f8f9fc;
      border-top: 1px solid #dee2e6;
    }

    .modal {
      display: none;
      position: fixed;
      z-index: 1000;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgba(0, 0, 0, 0.4);
    }

    .modal-content {
      background-color: #fefefe;
      margin: 15% auto;
      padding: 20px;
      border: 1px solid #888;
      width: 80%;
      max-width: 400px;
      text-align: center;
      position: relative;
    }

    .close {
      color: #aaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
      cursor: pointer;
    }

    .close:hover,
    .close:focus {
      color: black;
      text-decoration: none;
      cursor: pointer;
    }

    .done {
      background-color: #4CAF50;
      color: white;
      padding: 10px 20px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 16px;
      cursor: pointer;
      border: none;
      border-radius: 5px;
    }

    .done:hover {
      background-color: #45a049;
    }
  </style>
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
            <h1 class="h3 mb-0 text-gray-800">RFID List</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">RFID List</li>
            </ol>
          </div>
          <!-- Input Group -->
          <div class="row">
            <div class="col-lg-12">
              <div class="card mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">RFID List</h6>
                </div>
                <div class="table-responsive p-3" style="max-height: 600px; overflow-y: auto;">
                  <div class="card-body">
                    <form id="addRfidForm" method="post" action="store_rfid.php">
                      <div class="form-group row mb-3">
                        <button type="submit" id="addRfidButton" class="btn btn-primary">Add RFID</button>
                      </div>
                    </form>
                    <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                      <thead class="thead-light">
                        <tr>
                          <th>#</th>
                          <th>UID</th>
                          <th>Timestamp</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        // Fetch and display data from the database
                        while ($row = $result->fetch_assoc()) {
                          echo "<tr>";
                          echo "<td>" . $row['cid'] . "</td>"; // Display the 'cid' value
                          echo "<td>" . $row['uid'] . "</td>"; // Display the 'uid' value
                          echo "<td>" . $row['timedate'] . "</td>"; // Display the 'timedate' value
                          echo "</tr>";
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
        <!-- Modal HTML -->
        <div id="myModal" class="modal">
          <div class="modal-content">
            <span class="close">&times;</span>
            <p>Please scan RFID</p>
            <button class="done">Done</button>
          </div>
        </div>
        <!-- Footer -->
        <?php include "Includes/footer.php"; ?>
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
        $('#dataTableHover').DataTable();

        // Show modal when 'Add RFID' button is clicked
        $('#addRfidButton').click(function(event) {
          event.preventDefault(); // Prevent form submission
          var modal = document.getElementById('myModal');
          modal.style.display = 'block';

          // Handle 'Done' button click
          var doneButton = modal.querySelector('.done');
          doneButton.addEventListener('click', function() {
            // Refresh the page
            location.reload();
          });
        });
      });

      // Check for new data every 5 seconds
      function checkNewData() {
        // Add logic to check for new data if needed
      }
      $(document).ready(function() {
        setInterval(checkNewData, 5000);
      });
    </script>
  </div>
</body>

</html>