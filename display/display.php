<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>School Dashboard</title>
    <link rel="stylesheet" href="gg.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .bg-cover {
            background-image: url('img/scc school.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        body,
        html {
            height: 100%;
            font-family: Arial, sans-serif;
            margin: 0;
            background-image: url('display/logo.jpg');


            /* Replace with your image path */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        .center-line {
            position: absolute;
            top: 0;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            border-left: 2px solid black;
            height: 100%;
        }

        .container {
            display: flex;
            flex-direction: column;
            height: 100%;
            justify-content: space-between;
            background-color: rgba(240, 240, 240, 0.9);
            /* Semi-transparent background */
            width: 100%;
        }

        .header {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 10px;
            background-color: #dc3545;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 100%;
        }

        .logo {
            width: 60%;
        }

        .time-date-container {
            display: flex;
            justify-content: space-between;
            padding: 0 20px;
            background-color: #f0f0f0;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .time,
        .date {
            font-size: 50px;
            font-weight: bold;
        }

        .date {
            text-align: right;
        }

        .student-info {
            display: flex;
            justify-content: space-around;
            align-items: center;
            flex-wrap: wrap;
            padding: 20px 0;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            gap: 1px;
            height: calc(100vh - 120px);
        }

        .student-cards {
            padding: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            background-color: #f9f9f9;
            margin-left: 50px;
            width: 500px;
        }

        .student-card1,
        .student-card2 {
            padding: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            background-color: #f9f9f9;
            margin-top: 155px;
            width: 300px;
        }

        .student-card1 {
            padding: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            background-color: #f9f9f9;
            margin-top: 155px;
            margin-left: 50px;
            width: 300px;
        }

        .pic {
            margin: 20px auto;
            height: 400px;
            width: 400px;
            background-color: red;
            border-radius: 50%;
            background-size: cover;
            background-position: center;
            box-shadow: 5px 5px 10px #c5c5c5, -5px -5px 10px #fbfbfb;
        }

        .pic1,
        .pic2 {
            margin: 20px auto;
            height: 200px;
            width: 200px;
            background-color: red;
            border-radius: 50%;
            background-size: cover;
            background-position: center;
            box-shadow: 5px 5px 10px #c5c5c5, -5px -5px 10px #fbfbfb;
        }

        .details,
        .details1,
        .details2 {
            margin: 2px auto;
            height: 140px;
            background-color: #c5c5c5;
            border-radius: 3%;
            text-align: center;
        }

        .details {
            margin: 20px auto;
            height: 190px;
            background-color: #c5c5c5;
            border-radius: 3%;
            text-align: center;
        }

        .p1,
        .p2,
        .p4 {
            margin-top: 1vw;
            margin-bottom: 0.5vw;
            font-size: 1.5vw;
            font-weight: bold;
        }

        .p4 {
            text-transform: uppercase;
            opacity: 0.7;
        }

        .pp1,
        .pp2,
        .pp3 {
            margin-top: 6px;
            margin-bottom: 4px;
            font-size: medium;
            font-weight: bold;
        }

        .pp3 {
            text-transform: uppercase;
            opacity: 70%;
        }

        footer {
            text-align: center;
            padding: 10px;
            background-color: #fff;
            box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            position: relative;
            height: 60px;
            width: 100%;
        }

        footer {
            text-align: center;
            padding: 10px;
            background-color: #fff;
            box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            position: relative;
            height: 60px;
            width: 100%;
        }
    </style>
    <script>
        let latestTimestamp = null;

        function checkForNewEntries() {
            const xhr = new XMLHttpRequest();
            xhr.open('GET', 'fetch_latest_timestamp.php', true);
            xhr.onload = function() {
                if (this.status === 200) {
                    const response = JSON.parse(this.responseText);
                    const serverTimestamp = response.latest_timestamp;

                    if (serverTimestamp && serverTimestamp !== latestTimestamp) {
                        latestTimestamp = serverTimestamp;
                        window.location.reload();
                    }
                }
            };
            xhr.send();
        }

        function updateTimeDate() {
            const now = new Date();
            const time = now.toLocaleTimeString('en-US', {
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            });
            const date = now.toLocaleDateString('en-US', {
                year: 'numeric',
                month: 'long',
                day: 'numeric'
            });

            document.querySelector('.time').textContent = `TIME: ${time}`;
            document.querySelector('.date').textContent = `DATE: ${date}`;
        }

        setInterval(updateTimeDate, 1000);
        window.onload = function() {
            updateTimeDate();
            checkForNewEntries();
        };
    </script>
</head>

<body>
    <div class="container">
        <header class="header">
            <img src="scc-logo1.png" alt="School Logo" class="logo">
        </header>

        <!-- Time and Date Container -->
        <div class="time-date-container">
            <div class="time">TIME: </div>
            <div class="date">DATE: </div>
        </div>

        <div class="student-info">
            <?php
            $host = "localhost";
            $user = "root";
            $pass = "";
            $db = "gatemonitoring";

            $conn = new mysqli($host, $user, $pass, $db);

            if ($conn->connect_error) {
                die("Seems like you have not configured the database. Failed To Connect to database: " . $conn->connect_error);
            }

            $today = date('Y-m-d');

            $sql = "
                SELECT
                    dl.log_id,
                    dl.timestamp,
                    dl.timeinout,
                    IFNULL(rs.registeredstudentid, rr.registeredstaffid) AS registered_id,
                    IFNULL(sl.student_name, st.staff_name) AS name,
                    IFNULL(sl.course, st.department) AS department_or_course,
                    IFNULL(sl.year, st.role) AS year_or_role,
                    IFNULL(rs.idpicture, rr.idpicture) AS idpicture
                FROM
                    dailylogs dl
                LEFT JOIN
                    registeredrfid_student rs ON dl.registeredstudentid = rs.registeredstudentid
                LEFT JOIN
                    student_list sl ON rs.student_id = sl.student_id
                LEFT JOIN
                    registeredrfid_staff rr ON dl.registeredstaffid = rr.registeredstaffid
                LEFT JOIN
                    staff_list st ON rr.staff_id = st.staff_id
                WHERE
                    DATE(dl.timestamp) = '$today'
                ORDER BY
                    dl.timestamp DESC
                LIMIT 3";

            $result = $conn->query($sql);

            $latest_entries = [];
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    $latest_entries[] = $row;
                }
            } else {
                $default_entries = [
                    [
                        'name' => 'Name: ',
                        'department_or_course' => ' Department',
                        'year_or_role' => '',
                        'timestamp' => '',
                        'timeinout' => ''
                    ],
                    [
                        'name' => 'Name: ',
                        'department_or_course' => ' Department',
                        'year_or_role' => '',
                        'timestamp' => '',
                        'timeinout' => ''
                    ],
                    [
                        'name' => 'Name: ',
                        'department_or_course' => ' Department',
                        'year_or_role' => '',
                        'timestamp' => '',
                        'timeinout' => ''
                    ]
                ];

                $latest_entries = $default_entries;
            }

            $conn->close();
            ?>

            <?php if (!empty($latest_entries)) : ?>
                <div class="student-cards">
                    <?php if (isset($latest_entries[0])) : ?>
                        <div class="pic" <?php if (!empty($latest_entries[0]['idpicture'])) : ?> style="background-image: url('idpic/<?php echo htmlspecialchars($latest_entries[0]['idpicture'], ENT_QUOTES); ?>');" <?php endif; ?>></div>
                        <div class="details">
                            <div class="time">TIME IN </div>
                            <h2><?php echo htmlspecialchars($latest_entries[0]['name']); ?></h2>
                            <p class="p1"><?php echo htmlspecialchars($latest_entries[0]['department_or_course']); ?> <?php echo htmlspecialchars($latest_entries[0]['year_or_role']); ?></p>
                            <p class="p2"><?php if (!empty($latest_entries[0]['timestamp']) && strtotime($latest_entries[0]['timestamp'])) {
                                                $timestamp = new DateTime($latest_entries[0]['timestamp']);
                                                $formatted_timestamp = $timestamp->format('F j, Y, h:i A');
                                                echo htmlspecialchars($formatted_timestamp);
                                            } ?></p>
                            <p class="p4"><?php echo htmlspecialchars($latest_entries[0]['timeinout']); ?></p>
                        </div>
                    <?php else : ?>
                        <div class="pic"></div>
                        <div class="details">
                            <h2>Name: </h2>
                            <p>Department</p>
                            <p></p> <!-- Current date and time -->
                            <p>: </p>
                            <p></p>
                        </div>
                    <?php endif; ?>
                </div>
                <div class="student-cards">
                    <?php if (isset($latest_entries[0])) : ?>
                        <div class="pic" <?php if (!empty($latest_entries[0]['idpicture'])) : ?> style="background-image: url('idpic/<?php echo htmlspecialchars($latest_entries[0]['idpicture'], ENT_QUOTES); ?>');" <?php endif; ?>></div>
                        <div class="details">
                            <div class="time">TIME OUT </div>
                            <h2><?php echo htmlspecialchars($latest_entries[0]['name']); ?></h2>
                            <p class="p1"><?php echo htmlspecialchars($latest_entries[0]['department_or_course']); ?> <?php echo htmlspecialchars($latest_entries[0]['year_or_role']); ?></p>
                            <p class="p2"><?php if (!empty($latest_entries[0]['timestamp']) && strtotime($latest_entries[0]['timestamp'])) {
                                                $timestamp = new DateTime($latest_entries[0]['timestamp']);
                                                $formatted_timestamp = $timestamp->format('F j, Y, h:i A');
                                                echo htmlspecialchars($formatted_timestamp);
                                            } ?></p>
                            <p class="p4"><?php echo htmlspecialchars($latest_entries[0]['timeinout']); ?></p>
                        </div>
                    <?php else : ?>
                        <div class="pic"></div>
                        <div class="details">
                            <h2>Name: </h2>
                            <p>Department</p>
                            <p></p> <!-- Current date and time -->
                            <p>: </p>
                            <p></p>
                        </div>
                    <?php endif; ?>
                </div>
            <?php endif; ?>
        </div>
        <footer>
            <div class="split" style="background-color: #dc3545;">Keep Safe!</div>
        </footer>
    </div>
</body>

</html>