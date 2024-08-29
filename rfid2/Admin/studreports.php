<?php
$host = "localhost";
$user = "root";
$pass = "";
$db = "gatemonitoring";

// Establish database connection
$conn = new mysqli($host, $user, $pass, $db);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// SQL query to fetch data
$sql = "SELECT
            r.repsid,
            rs.student_id,
            dl.timestamp AS log_timestamp,
            rs.idpicture,
            sl.student_name,
            sl.course,
            sl.year,
            rc.uid AS uid
        FROM
            reports r
        INNER JOIN dailylogs dl ON r.logid = dl.log_id
        INNER JOIN registeredrfid_student rs ON dl.registeredstudentid = rs.registeredstudentid
        INNER JOIN student_list sl ON rs.student_id = sl.student_id
        LEFT JOIN rfid_cards rc ON rs.rfid_card_id = rc.id
        ORDER BY
            dl.timestamp DESC";

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
                        <h1 class="h3 mb-0 text-gray-800">Reports </h1>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="./">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Students</li>
                        </ol>
                    </div>
                    <!-- Input Group -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card mb-4">
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Students</h6>
                                </div>
                                <div class="table-responsive p-3"style="max-height: 600px; overflow-y: auto;">
                                <div class="row mb-3">
                                    <div class="col-md-3">
                                        <label for="monthFilter">Month:</label>
                                        <select id="monthFilter" class="form-control" onchange="applyFilters()">
                                            <option value="">All Months</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="weekFilter">Week:</label>
                                        <select id="weekFilter" class="form-control" onchange="applyFilters()">
                                            <option value="">All Weeks</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="yearFilter">Year:</label>
                                        <select id="yearFilter" class="form-control" onchange="applyFilters()">
                                            <option value="">All Years</option>
                                        </select>
                                    </div>
                                </div>

                                    <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                                        <thead class="thead-light">
                                        <tr>
                                                <th>#</th>
                                                <th>ID Picture</th>
                                                <th>UID</th>
                                                <th>Student ID</th>
                                                <th>Name</th>
                                                <th>Course</th>
                                                <th>Year</th>
                                                <th>Date</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            if ($result->num_rows > 0) {
                                                while ($row = $result->fetch_assoc()) {
                                                    echo "<tr>";
                                                    echo "<td>" . $row['repsid'] . "</td>";
                                                    echo "<td><img src='../idpic/" . $row['idpicture'] . "' width='50' height='50'></td>";
                                                    echo "<td>" . $row['uid'] . "</td>";
                                                    echo "<td>" . $row['student_id'] . "</td>";
                                                    echo "<td>" . $row['student_name'] . "</td>";
                                                    echo "<td>" . $row['course'] . "</td>";
                                                    echo "<td>" . $row['year'] . "</td>";
                                                    echo "<td>" . $row['log_timestamp'] . "</td>";
                                                    echo "<td>Status</td>"; // Replace with actual status logic
                                                    echo "</tr>";
                                                }
                                            } else {
                                                echo "<tr><td colspan='9'>No data available</td></tr>";
                                            }
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

  
    $(document).ready(function() {
        $('#dataTableHover').DataTable(); // Initialize DataTables
        populateFilters(); // Populate filters initially
    });

    function populateFilters() {
        populateYearFilter();
        populateMonthFilter();
        populateWeekFilter();
    }

    function populateYearFilter() {
        var yearFilter = document.getElementById("yearFilter");
        var years = [];

        // Get all unique years from the table data (assuming timestamp format is YYYY-MM-DD HH:MM:SS)
        var tableRows = document.getElementById("dataTableHover").getElementsByTagName("tbody")[0].rows;
        for (var i = 0; i < tableRows.length; i++) {
            var timestamp = tableRows[i].cells[7].innerText.trim(); // Assuming timestamp column is at index 7
            var year = new Date(timestamp).getFullYear(); // Extract year from timestamp

            if (!years.includes(year)) {
                years.push(year);
            }
        }

        // Sort years in descending order (if needed)
        years.sort(function(a, b) {
            return b - a;
        });

        // Populate the year filter select options
        var yearFilterOptions = document.getElementById("yearFilter");
        years.forEach(function(year) {
            var option = document.createElement("option");
            option.value = year;
            option.textContent = year;
            yearFilterOptions.appendChild(option);
        });
    }

    function populateMonthFilter() {
        var monthFilter = document.getElementById("monthFilter");
        var months = [];

        // Get all unique months from the table data (assuming timestamp format is YYYY-MM-DD HH:MM:SS)
        var tableRows = document.getElementById("dataTableHover").getElementsByTagName("tbody")[0].rows;
        for (var i = 0; i < tableRows.length; i++) {
            var timestamp = tableRows[i].cells[7].innerText.trim(); // Assuming timestamp column is at index 7
            var month = new Date(timestamp).getMonth() + 1; // Extract month from timestamp (getMonth() returns 0-based index)

            if (!months.includes(month)) {
                months.push(month);
            }
        }

        // Sort months in ascending order
        months.sort(function(a, b) {
            return a - b;
        });

        // Populate the month filter select options
        var monthFilterOptions = document.getElementById("monthFilter");
        months.forEach(function(month) {
            var option = document.createElement("option");
            option.value = month;
            option.textContent = monthToText(month); // Convert numeric month to text (e.g., 1 -> January)
            monthFilterOptions.appendChild(option);
        });
    }

    function populateWeekFilter() {
        var weekFilter = document.getElementById("weekFilter");
        var weeks = [];

        // Get all unique ISO weeks from the table data (assuming timestamp format is YYYY-MM-DD HH:MM:SS)
        var tableRows = document.getElementById("dataTableHover").getElementsByTagName("tbody")[0].rows;
        for (var i = 0; i < tableRows.length; i++) {
            var timestamp = tableRows[i].cells[7].innerText.trim(); // Assuming timestamp column is at index 7
            var week = getISOWeek(new Date(timestamp)); // Get ISO week number

            if (!weeks.includes(week)) {
                weeks.push(week);
            }
        }

        // Sort weeks in ascending order
        weeks.sort(function(a, b) {
            return a - b;
        });

        // Populate the week filter select options
        var weekFilterOptions = document.getElementById("weekFilter");
        weeks.forEach(function(week) {
            var option = document.createElement("option");
            option.value = week;
            option.textContent = "Week " + week;
            weekFilterOptions.appendChild(option);
        });
    }

    function monthToText(month) {
        var monthNames = ["January", "February", "March", "April", "May", "June",
                          "July", "August", "September", "October", "November", "December"];
        return monthNames[month - 1]; // Adjust for 0-based index
    }

    function getISOWeek(date) {
        var d = new Date(date);
        d.setHours(0, 0, 0, 0);
        d.setDate(d.getDate() + 3 - (d.getDay() + 6) % 7);
        var yearStart = new Date(d.getFullYear(), 0, 1);
        return Math.ceil((((d - yearStart) / 86400000) + 1) / 7);
    }

    function applyFilters() {
        var month = document.getElementById("monthFilter").value;
        var week = document.getElementById("weekFilter").value;
        var year = document.getElementById("yearFilter").value;

        var tableRows = document.getElementById("dataTableHover").getElementsByTagName("tbody")[0].rows;
        for (var i = 0; i < tableRows.length; i++) {
            var row = tableRows[i];
            var rowData = row.cells; // Access cells in each row for filtering logic

            // Example: Check conditions and hide/show rows based on filters
            var dateStr = rowData[7].innerText.trim(); // Assuming timestamp column is at index 7
            var date = new Date(dateStr);

            var monthMatches = (month === "" || date.getMonth() + 1 == month); // getMonth() returns 0-based index
            var weekMatches = (week === "" || getISOWeek(date) == week);
            var yearMatches = (year === "" || date.getFullYear() == year); // Extract year from timestamp

            if (monthMatches && weekMatches && yearMatches) {
                row.style.display = "";
            } else {
                row.style.display = "none";
            }
        }
    }



    </script>
</body>

</html>
