<?php 
   //session_start();
    require "conexiodb.php";

    $sql = "SELECT Assignacions.id, Assignacions.idAlumne, Usuaris.nom
            FROM Usuaris
            INNER JOIN Assignacions ON Usuaris.id = Assignacions.idAlumne";

    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        // output data of each row
        while($row = $result->fetch_assoc()) {
            echo "
                <tr>
                    <td>".$row["id"]."</td>
                    <td>".$row["idAlumne"]."</td>
                    <td>".$row["nom"]."</td>
                </tr>
            ";
        }
    } else {
        echo "0 results";
    } 
    $conn->close();
?>
