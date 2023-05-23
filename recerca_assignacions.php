<?php
require "conexiodb.php";

$sql = "SELECT *
        FROM Assignacions";

$result = $conn->query($sql);
if ($result->num_rows > 0) {
    $counter = $result->num_rows;
    // output data of each row
    while ($row = $result->fetch_assoc()) { 
        echo "
            <tr>
                <td>" . $row["id"] . "</td>
                <td>" . $row["idAlumne"] . "</td>
                <td>" . $row["idMaterial"] . "</td>
                <td>" . $row["dataInici"] . "</td>
                <td>" . $row["dataFinal"] . "</td>
            </tr>";
    }
    echo '<br>';
    echo "Total de registres trobats: " . $counter;
} else {
    echo "0 results";
}
$conn->close();
?>
