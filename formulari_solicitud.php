<?php
session_start();

require "conexiodb.php";

$sql = "CREATE TABLE IF NOT EXISTS MaterialSolicitud (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(50) NOT NULL,
  primer_cognom VARCHAR(50) NOT NULL,
  segon_cognom VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  cicle VARCHAR(50) NOT NULL,
  nom_cicle VARCHAR(100) NOT NULL,
  localitat VARCHAR(50) NOT NULL,
  direccio VARCHAR(100) NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  codi_postal VARCHAR(10) NOT NULL,
  prioridad VARCHAR(10) NOT NULL,
  motiu TEXT NOT NULL,
  dia TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)";

// Obtén los valores enviados desde el formulario
$nom = $_POST['nom'];
$primer_cognom = $_POST['primer_cognom'];
$segon_cognom = $_POST['segon_cognom'];
$email = $_POST['email'];
$cicle = $_POST['cicle'];
$nom_cicle = $_POST['nom_cicle'];
$localitat = $_POST['localitat'];
$direccio = $_POST['direccio'];
$telefono = $_POST['telefono'];
$codi_postal = $_POST['codi_postal'];
$prioridad = $_POST['prioridad'];
$motiu = $_POST['motiu'];

// Prepara la consulta SQL para insertar los datos en la base de datos
$sql = "INSERT INTO MaterialSolicitud (nom, primer_cognom, segon_cognom, email, cicle, nom_cicle, localitat, direccio, telefono, codi_postal, prioridad, motiu)
        VALUES ('$nom', '$primer_cognom', '$segon_cognom', '$email', '$cicle', '$nom_cicle', '$localitat', '$direccio', '$telefono', '$codi_postal', '$prioridad', '$motiu')";

// Ejecuta la consulta y verifica si se insertaron los datos correctamente
if ($conn->query($sql) === TRUE) {
    echo "dades enviades correctament.";
} else {
    echo "Error al enviar les dades: " . $conn->error;
}

// Cierra la conexión a la base de datos
mysqli_close($conn);

?>
