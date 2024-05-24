<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quick Mart</title>
  <link rel="stylesheet" href="style.css">
</head>
<body class="product-page">
  <header>
    <img src="img/QuickMart_Logo (1).png" alt="Icono Quick Mart">
    <h1>Quick Mart</h1>
  </header>
  <nav class="menu">
    <ul>
      <li><a href="index2.html">Inicio</a></li>
      <li><a href="index.html">Productos</a></li>
      <li><a href="carrito.html">Carrito</a></li>
      <li><a href="MostrarProductos.php">Mostrar Productos</a></li>
      <li><a href="MostrarClientes.php">Mostrar Clientes</a></li>
    </ul>
  </nav>

  <h1>Lista de Productos</h1>
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

    // Obtener todos los productos
    $sql = "SELECT * FROM producto";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        echo "<table border='1'>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>Precio</th>
                    <th>Unidad de Medida</th>
                    <th>Tipo de Producto</th>
                    <th>Acciones</th>
                </tr>";
        while($row = $result->fetch_assoc()) {
            echo "<tr>
                    <td>" . $row["id_producto"] . "</td>
                    <td>" . $row["nombre_producto"] . "</td>
                    <td>" . $row["descripcion_producto"] . "</td>
                    <td>" . $row["precio_producto"] . "</td>
                    <td>" . $row["unidad_medida_producto"] . "</td>
                    <td>" . $row["id_tipo_producto"] . "</td>
                    <td><form action='eliminarproducto.php' method='post'>
                            <input type='hidden' name='id_producto' value='" . $row["id_producto"] . "'>
                            <button type='submit'>Eliminar</button>
                        </form></td>
                </tr>";
        }
        echo "</table>";
    } else {
        echo "No se encontraron productos";
    }

    $conn->close();
    ?>


<h2>Insertar Producto en BD QuickMart</h2>
    <form action="insertar_Pro.php" method="post">
        <div class="form-group">
            <label for="nombre_producto">Nombre del Producto:</label>
            <input type="text" id="nombre_producto" name="nombre_producto" required>
        </div>
        <div class="form-group">
            <label for="descripcion_producto">Descripción del Producto:</label>
            <input type="text" id="descripcion_producto" name="descripcion_producto">
        </div>
        <div class="form-group">
            <label for="precio_producto">Precio del Producto:</label>
            <input type="text" id="precio_producto" name="precio_producto" required>
        </div>
        <div class="form-group">
            <label for="unidad_medida_producto">Unidad de Medida del Producto:</label>
            <input type="text" id="unidad_medida_producto" name="unidad_medida_producto" required>
        </div>
        <div class="form-group">
            <label for="id_tipo_producto">ID Tipo de Producto:</label>
            <input type="text" id="id_tipo_producto" name="id_tipo_producto" required>
        </div>
        <div class="form-group">
            <button type="submit">Insertar</button>
        </div>
    </form>


</body>
</html>


