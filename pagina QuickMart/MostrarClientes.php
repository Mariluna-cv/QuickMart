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

  <h2>Lista de Clientes</h2>
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

    // Obtener todos los clientes
    $sql = "SELECT * FROM clientes";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        echo "<table border='1'>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Correo Electrónico</th>
                    <th>Dirección</th>
                    <th>Ciudad</th>
                    <th>Estado</th>
                    <th>País</th>
                    <th>Teléfono</th>
                    <th>Fecha de Nacimiento</th>
                    <th>Género</th>
                    <th>Acciones</th>
                </tr>";
        while($row = $result->fetch_assoc()) {
            echo "<tr>
                    <td>" . $row["ClienteID"] . "</td>
                    <td>" . $row["Nombre"] . "</td>
                    <td>" . $row["Apellido"] . "</td>
                    <td>" . $row["CorreoElectronico"] . "</td>
                    <td>" . $row["Direccion"] . "</td>
                    <td>" . $row["Ciudad"] . "</td>
                    <td>" . $row["Estado"] . "</td>
                    <td>" . $row["Pais"] . "</td>
                    <td>" . $row["Telefono"] . "</td>
                    <td>" . $row["FechaNacimiento"] . "</td>
                    <td>" . $row["Genero"] . "</td>
                    <td>
                        <form action='eliminarcliente.php' method='post'>
                            <input type='hidden' name='cliente_id' value='" . $row["ClienteID"] . "'>
                            <button type='submit'>Eliminar</button>
                        </form>
                    </td>
                </tr>";
        }
        echo "</table>";
    } else {
        echo "No se encontraron clientes";
    }

    $conn->close();
    ?>

    <h2>Insertar Datos en BD QuickMart</h2>
    <form action="insertar.php" method="post">
        <div class="form-group">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required>
        </div>
        <div class="form-group">
            <label for="apellido">Apellido:</label>
            <input type="text" id="apellido" name="apellido" required>
        </div>
        <div class="form-group">
            <label for="correo">Correo Electrónico:</label>
            <input type="email" id="correo" name="correo" required>
        </div>
        <div class="form-group">
            <label for="direccion">Dirección:</label>
            <input type="text" id="direccion" name="direccion" required>
        </div>
        <div class="form-group">
            <label for="ciudad">Ciudad:</label>
            <input type="text" id="ciudad" name="ciudad" required>
        </div>
        <div class="form-group">
            <label for="estado">Estado:</label>
            <input type="text" id="estado" name="estado" required>
        </div>
        <div class="form-group">
            <label for="pais">País:</label>
            <input type="text" id="pais" name="pais" required>
        </div>
        <div class="form-group">
            <label for="telefono">Teléfono:</label>
            <input type="text" id="telefono" name="telefono" required>
        </div>
        <div class="form-group">
            <label for="fecha_nacimiento">Fecha de Nacimiento:</label>
            <input type="date" id="fecha_nacimiento" name="fecha_nacimiento" required>
        </div>
        <div class="form-group">
            <label for="genero">Género:</label>
            <input type="text" id="genero" name="genero" required>
        </div>
        <div class="form-group">
            <button type="submit">Insertar</button>
        </div>
    </form>
  </div>
</body>
</html>



