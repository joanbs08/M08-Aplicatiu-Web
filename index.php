<?php
session_start();

if (isset($_SESSION["profe"])) {
    if ($_SESSION["profe"]==0){
        header("location: Pagina_inicial_alumne.php");
    } 
    if ($_SESSION["profe"]==1){
        header("location: Pagina_inicial_profe.php");
    }     
} else {
    include "login.html";
}
?>
