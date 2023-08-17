<?php
session_start();
if (isset($_SESSION["id"])) {
    echo "{\"logged\": true, \"user_id\":" . $_SESSION["id"] . "}";
} else {
    echo '{"logged": false}';
}
