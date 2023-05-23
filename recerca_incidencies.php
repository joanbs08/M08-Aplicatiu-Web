<?php
require "conexiodb.php";

$sql = "SELECT *
        FROM Incidencies";

$result = $conn->query($sql);
if ($result->num_rows > 0) {
    $counter = $result->num_rows;
    // output data of each row
    while ($row = $result->fetch_assoc()) { 
        echo "
            <tr>
                <td>" . $row["id"] . "</td>
                <td>" . $row["idAlumne"] . "</td>
                <td>" . $row["idDispositiu"] . "</td>
                <td>" . $row["idEstat"] . "</td>
                <td>" . $row["dataOberta"] . "</td>
                <td>" . $row["dataTancada"] . "</td>                    
                <td>" . $row["informacio"] . "</td>
            </tr>";
    }
    echo '<br>';
    echo "Total de registres trobats: " . $counter;
} else {
    echo "0 results";
}
$conn->close();
?>