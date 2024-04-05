<?php
global $host, $user, $passwd, $db;
$data = json_decode(file_get_contents('php://input'), true);
include('./hidden.php');

if (isset($data['id'])) {
    // Create connection
    $conn = new mysqli($host, $user, $passwd, $db);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sql = "SELECT * FROM reservations WHERE reservations.screening_id='$data[id]'";
    $result = $conn->query($sql);
    if ($result->num_rows) {
        $tab = [];
        while ($row = $result->fetch_assoc()) {
            $tab[] = $row;
        }
        echo "{\"reservations\":true, \"tab\":" . json_encode($tab) . "}";
    } else echo "{\"reservations\":false}";

    $conn->close();
}
