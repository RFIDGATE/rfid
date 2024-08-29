<?php
include '../Includes/dbcon.php';

// Get RFID UID from POST request
$uid = $_POST['uid'];

// Create SQL statement to insert data into the database
$sql = "INSERT INTO rfid (cid, uid) VALUES (NULL, ?)";

// Prepare and execute the statement
$stmt = $conn->prepare($sql);
$stmt->bind_param('s', $uid);

if ($stmt->execute()) {
    echo 'RFID data added successfully!';
} else {
    echo 'Error: ' . $stmt->error;
}

$stmt->close();
$conn->close();
