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
                xmlhttp.open("GET", "ajaxClassArms.php?cid=" + str, true);
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
                        <h1 class="h3 mb-0 text-gray-800">Daily logs</h1>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="./">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Staffs</li>
                        </ol>
                    </div>
                    <!-- Input Group -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card mb-4">
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Staffs</h6>
                                </div>
                                <div class="table-responsive p-3" style="max-height: 600px; overflow-y: auto;">
                                    <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                                        <thead class="thead-light">
                                            <tr>
                                                <th>#</th>
                                                <th>ID Picture</th>
                                                <th>UID</th>
                                                <th>Name</th>
                                                <th>Department</th>
                                                <th>Date</th>
                                                <th>Status</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                        <?php
                                                // Database connection
                                                $host = "localhost";
                                                $user = "root";
                                                $pass = "";
                                                $db = "gatemonitoring";

                                                $conn = new mysqli($host, $user, $pass, $db);
                                                if ($conn->connect_error) {
                                                    echo "Seems like you have not configured the database. Failed To Connect to database:" . $conn->connect_error;
                                                    exit();
                                                }

                                                // Today's date
                                                $today = date('Y-m-d');

                                                // Query to fetch data, excluding records already in reports table
                                                $query = "SELECT dl.log_id, rs.idpicture, sl.staff_id_number, sl.staff_name, sl.department, dl.timestamp, dl.timeinout, rc.uid
                                                        FROM dailylogs dl
                                                        INNER JOIN registeredrfid_staff rs ON dl.registeredstaffid = rs.registeredstaffid
                                                        INNER JOIN staff_list sl ON rs.staff_id = sl.staff_id
                                                        INNER JOIN rfid_cards rc ON rs.rfid_card_id = rc.id
                                                        WHERE NOT EXISTS (
                                                            SELECT 1 FROM reports r WHERE dl.log_id = r.logid
                                                        )";

                                                $result = $conn->query($query);

                                                if (!$result) {
                                                    echo "Query failed: " . $conn->error;
                                                    exit();
                                                }

                                                // Display table rows and move outdated logs to reports table
                                                while ($row = $result->fetch_assoc()) {
                                                    echo "<tr>";
                                                    echo "<td>" . $row['log_id'] . "</td>";
                                                    echo "<td><img src='../idpic/{$row['idpicture']}' alt='ID Picture' width='50'></td>";
                                                    echo "<td>{$row['uid']}</td>";
                                                    echo "<td>{$row['staff_name']}</td>";
                                                    echo "<td>{$row['department']}</td>";
                                                    echo "<td>{$row['timestamp']}</td>";
                                                    echo "<td>{$row['timeinout']}</td>";
                                                    echo "</tr>";

                                                    // Check if timestamp is not today's date
                                                    if (substr($row['timestamp'], 0, 10) != $today) {
                                                        // Prepare statement for inserting into reports table
                                                        $insertStmt = $conn->prepare("INSERT INTO reports (logid, date) VALUES (?, ?)");
                                                        $insertStmt->bind_param("is", $row['log_id'], substr($row['timestamp'], 0, 10));
                                                        $insertStmt->execute();
                                                        $insertStmt->close();
                                                    }
                                                }

                                                // Close connection
                                                $conn->close();
                                                ?>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!---Container Fluid-->
          
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
    </script>
</body>

</html>
