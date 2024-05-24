<?php
$servername = "localhost";
$username = "root";  
$password = "";      
$dbname = "quickmart";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Obtener datos del formulario
$nombre = $_POST['nombre'];
$apellido = $_POST['apellido'];
$correo = $_POST['correo'];
$direccion = $_POST['direccion'];
$ciudad = $_POST['ciudad'];
$estado = $_POST['estado'];
$pais = $_POST['pais'];
$telefono = $_POST['telefono'];
$fecha_nacimiento = $_POST['fecha_nacimiento'];
$genero = $_POST['genero'];

// Preparar la consulta SQL
$sql = "INSERT INTO Clientes (Nombre, Apellido, CorreoElectronico, Direccion, Ciudad, Estado, Pais, Telefono, FechaNacimiento, Genero) 
        VALUES ('$nombre', '$apellido', '$correo', '$direccion', '$ciudad', '$estado', '$pais', '$telefono', '$fecha_nacimiento', '$genero')";

// Ejecutar la consulta
if ($conn->query($sql) === TRUE) {
    echo "Nuevo registro creado exitosamente";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Cerrar la conexión
$conn->close();
?>
