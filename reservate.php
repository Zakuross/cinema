<?php
global $host, $user, $passwd, $db;
$data = json_decode(file_get_contents('php://input'), true);
include('./hidden.php');

// session_start();
if (isset($data['screening_id']) && isset($data['places']) && isset($data["user_id"])) {
    // Create connection
    $conn = new mysqli($host, $user, $passwd, $db);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    $max = sizeof($data['places']);
    for ($i = 0; $i < $max; $i++) {
        $place = $data["places"][$i];
        $sql = "INSERT INTO reservations (user_id, screening_id, place) VALUES ('$data[user_id]', '$data[screening_id]', $place)";
        echo ($sql);
        $conn->query($sql);
    }
    echo "ok";
    $conn->close();
}
