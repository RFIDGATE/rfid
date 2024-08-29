<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

include '../Includes/dbcon.php';  // Adjust path as per your directory structure
include '../Includes/session.php';  // Adjust path as per your directory structure

$limit = isset($_GET['limit']) ? $_GET['limit'] : 10;
$page = isset($_GET['page']) ? $_GET['page'] : 1;
$start = ($page - 1) * $limit;

try {
    $sql = "SELECT r.registeredstudentid, r.idpicture, rc.uid as rfid_uid, sl.student_id_number, sl.student_name, sl.year, sl.course
            FROM registeredrfid_student r
            LEFT JOIN student_list sl ON r.student_id = sl.student_id
            LEFT JOIN rfid_cards rc ON r.rfid_card_id = rc.id
            ORDER BY r.registeredstudentid DESC
            LIMIT $start, $limit";
    $result = mysqli_query($conn, $sql);

    if ($result) {
        $data = array();
        while ($row = mysqli_fetch_assoc($result)) {
            // Adjust the image path according to your folder structure and database stored path
            $row['idpicture'] = '../../idpic/' . $row['idpicture'];
            $data[] = $row;
        }
        echo json_encode($data);
    } else {
        throw new Exception(mysqli_error($conn));
    }
} catch (Exception $e) {
    echo json_encode(array('error' => 'Error fetching data: ' . $e->getMessage()));
}
?>
