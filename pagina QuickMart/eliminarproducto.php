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

// Obtener el ID del producto a eliminar
$id_producto = $_POST['id_producto'];

// Preparar la consulta SQL
$sql = "DELETE FROM producto WHERE id_producto = $id_producto";

// Ejecutar la consulta
if ($conn->query($sql) === TRUE) {
    echo "Producto eliminado exitosamente";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Cerrar la conexión
$conn->close();
?>
