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

// Verificar si se ha enviado un ID de cliente
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['cliente_id'])) {
    $cliente_id = $_POST['cliente_id'];

    // Eliminar cliente
    $sql = "DELETE FROM clientes WHERE ClienteID = $cliente_id";

    if ($conn->query($sql) === TRUE) {
        echo "Cliente eliminado exitosamente";
    } else {
        echo "Error al eliminar el cliente: " . $conn->error;
    }
} else {
    echo "ID de cliente no especificado";
}

// Cerrar la conexión
$conn->close();
?>
