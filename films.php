<?php
$data = json_decode(file_get_contents('php://input'), true);
include('./hidden.php');

// Create connection
$conn = new mysqli($host, $user, $passwd, $db);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM films";
$result = $conn->query($sql);
if ($result->num_rows) {
    $tab = [];
    while ($row = $result->fetch_assoc()) {
        $tab[] = $row;
    }
    echo json_encode($tab);
}

$conn->close();
