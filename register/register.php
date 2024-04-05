<?php
// print_r($_POST); // $_GET;
// echo json_encode($_POST);

global $host, $user, $passwd, $db;
$data = json_decode(file_get_contents('php://input'), true);
include('../hidden.php');

if (isset($data['login']) && isset($data['password']) && isset($data['number'])) {
    // Create connection
    $conn = new mysqli($host, $user, $passwd, $db);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    $sql = "SELECT * FROM users WHERE users.login='$data[login]'";
    $result = $conn->query($sql);
    if ($result->num_rows) {
        echo "{\"stworzono\": false}";
    } else {
        $sql = "INSERT INTO users (login, password, number) VALUES ('$data[login]', SHA1('$data[password]'), '$data[number]')";
        if ($conn->query($sql) === true)
            echo "{\"stworzono\": true}";
    }

    $conn->close();
}
