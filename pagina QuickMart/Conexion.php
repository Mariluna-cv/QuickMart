<?php

$server = "localhost";
$user = "root";
$pass = "";
$DB = "quickmart";

$Conexion = new mysqli($server, $user, $pass, $DB);

if($Conexion->connect_errno){

    die("conexion fallida" . $Conexion->connect_errno);
} else {

    echo"conectado";
}

?>