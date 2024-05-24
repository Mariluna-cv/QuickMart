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
$nombre_producto = $_POST['nombre_producto'];
$descripcion_producto = $_POST['descripcion_producto'];
$precio_producto = $_POST['precio_producto'];
$unidad_medida_producto = $_POST['unidad_medida_producto'];
$id_tipo_producto = $_POST['id_tipo_producto'];

// Preparar la consulta SQL
$sql = "INSERT INTO producto (nombre_producto, descripcion_producto, precio_producto, unidad_medida_producto, id_tipo_producto) 
        VALUES ('$nombre_producto', '$descripcion_producto', '$precio_producto', '$unidad_medida_producto', '$id_tipo_producto')";

// Ejecutar la consulta
if ($conn->query($sql) === TRUE) {
    echo "Nuevo producto creado exitosamente";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Cerrar la conexión
$conn->close();
?>

