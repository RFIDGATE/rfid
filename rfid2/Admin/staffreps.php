<?php
	$host = "localhost";
	$user = "root";
	$pass = "";
	$db = "gatemonitoring";
	
	$conn = new mysqli($host, $user, $pass, $db);
	if($conn->connect_error){
		echo "Seems like you have not configured the database. Failed To Connect to database:" . $conn->connect_error;
	}
	$query = "
    SELECT reports.repsid, registeredrfid_staff.idpicture, rfid_cards.uid, staff_list.staff_id_number,
           staff_list.staff_name, staff_list.department, staff_list.role, dailylogs.timestamp
    FROM reports
    INNER JOIN dailylogs ON reports.logid = dailylogs.log_id
    INNER JOIN registeredrfid_staff ON dailylogs.registeredstaffid = registeredrfid_staff.registeredstaffid
    INNER JOIN staff_list ON registeredrfid_staff.staff_id = staff_list.staff_id
    INNER JOIN rfid_cards ON registeredrfid_staff.rfid_card_id = rfid_cards.id
    ORDER BY dailylogs.timestamp DESC"; // Adjust as per your specific requirements

$result = mysqli_query($conn, $query);

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
                            <li class="breadcrumb-item active" aria-current="page">Staff</li>
                        </ol>
                    </div>
                    <!-- Input Group -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card mb-4">
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Staff</h6>
                                </div>
                                <div class="table-responsive p-3" style="max-height: 600px; overflow-y: auto;">
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
                                                <th>Picture</th>
                                                <th>UID</th>
                                                <th>Staff ID</th>
                                                <th>Name</th>
                                                <th>Department</th>
                                                <th>Role</th>
                                                <th>Date</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                                <?php
                                                    while ($row = mysqli_fetch_assoc($result)) {
                                                        echo "<tr>";
                                                        echo "<td>" . htmlspecialchars($row['repsid']) . "</td>";
                                                        echo "<td><img src='../idpic/" . htmlspecialchars($row['idpicture']) . "' alt='ID Picture' width='50' ></td>";
                                                        echo "<td>" . htmlspecialchars($row['uid']) . "</td>";
                                                        echo "<td>" . htmlspecialchars($row['staff_id_number']) . "</td>";
                                                        echo "<td>" . htmlspecialchars($row['staff_name']) . "</td>";
                                                        echo "<td>" . htmlspecialchars($row['department']) . "</td>";
                                                        echo "<td>" . htmlspecialchars($row['timestamp']) . "</td>";
                                                        echo "<td>Status</td>"; // Placeholder for Status column
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
