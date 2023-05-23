<?php
    session_start();
    
    if (($_SESSION["profe"] == 0) && (isset($_SESSION["user"]))) {
        require "Pagina_inicial_alumne.html";
    } else {
        if (($_SESSION["profe"] == 1) && (isset($_SESSION["user"]))) {
          header("location: Pagina_inicial_profe.php");
        } else {
          header("location: index.php");
      }       
    }    
?>