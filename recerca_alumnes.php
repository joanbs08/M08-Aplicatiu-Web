<?php 
//    session_start();
    require "conexiodb.php";

    $sql = "SELECT id, nom, cognom1, cognom2, grup_classe, correu
            FROM Usuaris WHERE rol = 0";
            

    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        $counter = $result->num_rows;
        // output data of each row
        while ($row = $result->fetch_assoc()) { 
            echo "
                <tr>
                    <td>".$row["id"]."</td>
                    <td>".$row["nom"]."</td>
                    <td>".$row["cognom1"]."</td>
                    <td>".$row["cognom2"]."</td>
                    <td>".$row["grup_classe"]."</td>
                    <td>".$row["correu"]."</td>
                </tr>";
        }
        echo '<br>';
        echo "Total de registres trobats: ".$counter;
    } else {
        echo "0 results";
    } 
    $conn->close();
?>
