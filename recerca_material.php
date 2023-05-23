<?php
require "conexiodb.php";

$sql = "SELECT *
        FROM Material";

$result = $conn->query($sql);
if ($result->num_rows > 0) {
    $counter = $result->num_rows;
    // output data of each row
    while ($row = $result->fetch_assoc()) { 
        echo "
            <tr>
                <td>" . $row["id"] . "</td>
                <td>" . $row["idTipus"] . "</td>
                <td>" . $row["idInventari"] . "</td>
                <td>" . $row["etiquetaDepInf"] . "</td>
                <td>" . $row["numSerie"] . "</td>
                <td>" . $row["macEthernet"] . "</td>
                <td>" . $row["macWifi"] . "</td>
                <td>" . $row["SACE"] . "</td>
                <td>" . $row["dataAdquisicio"] . "</td>
                <td>" . $row["idUbicacio"] . "</td>
            </tr>";
    }
    echo '<br>';
    echo "Total de registres trobats: " . $counter;
} else {
    echo "0 results";
}
$conn->close();
?>
