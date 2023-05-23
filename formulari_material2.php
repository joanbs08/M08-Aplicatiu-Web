<?php
session_start();

require "conexiodb.php";

$sql = "CREATE TABLE IF NOT EXISTS Material2 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    etiquetaDepInf VARCHAR(255) NOT NULL,
    numSerie VARCHAR(255) NOT NULL,
    macEthernet VARCHAR(255) NOT NULL,
    macWifi VARCHAR(255) NOT NULL,
    SACE VARCHAR(255) NOT NULL,
    dataAdquisicio VARCHAR(255) NOT NULL,
    idUbicacio VARCHAR(255) NOT NULL,
    idTipus VARCHAR(255) NOT NULL,
    dia TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtener los valores del formulario
    $etiquetaDepInf = $_POST["etiquetaDepInf"];
    $numSerie = $_POST["numSerie"];
    $macEthernet = $_POST["macEthernet"];
    $macWifi = $_POST["macWifi"];
    $SACE = $_POST["SACE"];
    $dataAdquisicio = $_POST["dataAdquisicio"];
    $ubicacio = $_POST["Ubicacio"];
    $dispositiu = $_POST["dispositiu"];

    // Preparar la consulta SQL
    $sql = "INSERT INTO Material2 (etiquetaDepInf, numSerie, macEthernet, macWifi, SACE, dataAdquisicio, idUbicacio, idTipus)
            VALUES ('$etiquetaDepInf', '$numSerie', '$macEthernet', '$macWifi', '$SACE', '$dataAdquisicio', '$ubicacio', '$dispositiu')";

    if ($conn->query($sql) === TRUE) {
        echo "dades enviades correctament.";
    } else {
        echo "error al enviar les dades: " . $conn->error;
    }
}

$conn->close();

?>
