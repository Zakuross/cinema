<?php
// print_r($_POST); // $_GET;
// echo json_encode($_POST);

$data = json_decode(file_get_contents('php://input'), true);
include('../hidden.php');

if (isset($data['login']) && isset($data['password'])) {
    // Create connection
    $conn = new mysqli($host, $user, $passwd, $db);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sql = "SELECT * FROM users WHERE users.login='$data[login]' and users.password=SHA1('$data[password]')";
    $result = $conn->query($sql);
    if ($result->num_rows) {
        $row = $result->fetch_assoc();
        session_start();
        $_SESSION["id"] = $row["id"];

        echo "{\"zalogowano\": true}";
    } else {
        echo "{\"zalogowano\": false}";
    }

    $conn->close();
}
