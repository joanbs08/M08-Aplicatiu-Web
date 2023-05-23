<?php
    $servername = "localhost";
    $username = "villarroya";
    $password = "alumne";
    $database = "CentreEducatiu";
    // Create connection
    $conn = mysqli_connect($servername, $username, $password, $database);
​
    // Check connection
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }
?>