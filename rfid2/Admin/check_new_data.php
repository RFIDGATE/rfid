<?php
include '../Includes/dbcon.php'; 
$last_id = isset($_GET['last_id']) ? (int)$_GET['last_id'] : 0;

$sql = "SELECT * FROM rfid_cards WHERE id > $last_id ORDER BY id DESC LIMIT 1";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    // You can customize the message or data you want to return
    echo "New RFID card added with UID: " . $row['uid'];
} else {
    // No new data
    echo "";
}

$conn->close();
?>
