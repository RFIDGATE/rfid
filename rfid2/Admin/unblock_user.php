<?php
// unblock_user.php

// Database connection
include '../Includes/dbcon.php'; // Adjust path as per your file structure

// Check if ID is provided via POST
if (isset($_POST['id'])) {
    $id = $_POST['id'];

    // Prepare and execute SQL query to delete the record
    $query = "DELETE FROM blockrfidstud WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param('i', $id);
    
    if ($stmt->execute()) {
        // Return success response if delete is successful
        echo json_encode(['success' => true]);
    } else {
        // Return error response if delete fails
        echo json_encode(['success' => false, 'message' => 'Failed to unblock user.']);
    }
} else {
    // Handle case where ID is not provided
    echo json_encode(['success' => false, 'message' => 'ID parameter missing.']);
}
?>
