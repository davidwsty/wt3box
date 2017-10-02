<?php
    echo "Hello from the Box!";

    $servername = "127.0.0.1";
    $username = "root";
    $password = "root";

    // Create connection
    $conn = new mysqli($servername, $username, $password);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } else {
        echo "Successfully connected to Database";
    }

    phpinfo();
?>
