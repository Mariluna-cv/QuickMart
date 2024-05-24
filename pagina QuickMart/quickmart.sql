-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-05-2024 a las 04:32:31
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `quickmart`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ClienteID` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `CorreoElectronico` varchar(255) NOT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Ciudad` varchar(100) DEFAULT NULL,
  `Estado` varchar(100) DEFAULT NULL,
  `Pais` varchar(100) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `FechaRegistro` timestamp NOT NULL DEFAULT current_timestamp(),
  `FechaNacimiento` date DEFAULT NULL,
  `Genero` enum('Masculino','Femenino','Otro') DEFAULT NULL,
  `EstadoCuenta` enum('Activo','Inactivo') DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ClienteID`, `Nombre`, `Apellido`, `CorreoElectronico`, `Direccion`, `Ciudad`, `Estado`, `Pais`, `Telefono`, `FechaRegistro`, `FechaNacimiento`, `Genero`, `EstadoCuenta`) VALUES
(1, 'Andrés', 'Gómez', 'andres.gomez@example.com', 'Calle 123', 'Bogotá', 'Cundinamarca', 'Colombia', '3101234567', '2024-05-23 23:56:42', '1985-04-22', 'Masculino', 'Activo'),
(2, 'Lucía', 'Martínez', 'lucia.martinez@example.com', 'Carrera 45 # 26-89', 'Medellín', 'Antioquia', 'Colombia', '3202345678', '2024-05-23 23:56:42', '1990-07-15', 'Femenino', 'Activo'),
(3, 'Carlos', 'Rodríguez', 'carlos.rodriguez@example.com', 'Avenida 7 # 54-32', 'Cali', 'Valle del Cauca', 'Colombia', '3003456789', '2024-05-23 23:56:42', '1978-11-30', 'Masculino', 'Activo'),
(4, 'María', 'López', 'maria.lopez@example.com', 'Calle 9 # 27-65', 'Barranquilla', 'Atlántico', 'Colombia', '3504567890', '2024-05-23 23:56:42', '1992-02-18', 'Femenino', 'Activo'),
(6, 'Emanuel', 'Negret lopez', 'emanuel.lopez.@example.com', 'Carrera 2a', 'Monteria', 'Cordoba', 'Colombia', '3136568531', '2024-05-24 01:08:10', '2003-09-03', 'Masculino', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(50) NOT NULL,
  `descripcion_producto` varchar(255) DEFAULT NULL,
  `precio_producto` decimal(10,2) NOT NULL,
  `unidad_medida_producto` varchar(10) NOT NULL,
  `id_tipo_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre_producto`, `descripcion_producto`, `precio_producto`, `unidad_medida_producto`, `id_tipo_producto`) VALUES
(1, 'Manzanas', 'Fruta roja dulce y crujiente', 1.50, 'kg', 1),
(2, 'Lechuga', 'Hortaliza de hojas verdes utilizada en ensaladas', 2.00, 'unidad', 2),
(3, 'Carne de res molida', 'Carne molida de vaca para preparar hamburguesas, albóndigas, etc.', 4.50, 'kg', 3),
(4, 'Leche entera', 'Leche de vaca sin desnatada', 2.20, 'litro', 4),
(5, 'Agua mineral', 'Agua embotellada con minerales', 1.00, 'litro', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

CREATE TABLE `seccion` (
  `id_seccion` int(11) NOT NULL,
  `nombre_seccion` varchar(50) NOT NULL,
  `descripcion_seccion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `seccion`
--

INSERT INTO `seccion` (`id_seccion`, `nombre_seccion`, `descripcion_seccion`) VALUES
(1, 'Frutas y verduras', 'Sección con productos frescos de origen vegetal'),
(2, 'Carnes y pescados', 'Sección con productos frescos de origen animal'),
(3, 'Lacteos y huevos', 'Sección con productos derivados de la leche y huevos'),
(4, 'Bebidas', 'Sección con bebidas de todo tipo'),
(5, 'Snacks y golosinas', 'Sección con alimentos ligeros y dulces');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_producto`
--

CREATE TABLE `tipo_de_producto` (
  `id_tipo_producto` int(11) NOT NULL,
  `nombre_tipo_producto` varchar(50) NOT NULL,
  `descripcion_tipo_producto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_de_producto`
--

INSERT INTO `tipo_de_producto` (`id_tipo_producto`, `nombre_tipo_producto`, `descripcion_tipo_producto`) VALUES
(1, 'Frutas', 'Productos frescos de origen vegetal'),
(2, 'Verduras', 'Productos frescos de origen vegetal, excluyendo las frutas'),
(3, 'Carnes', 'Productos frescos de origen animal'),
(4, 'Lacteos', 'Productos derivados de la leche'),
(5, 'Bebidas', 'Líquidos para consumo humano'),
(6, 'Snacks', 'Alimentos ligeros para consumo entre comidas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion_producto`
--

CREATE TABLE `ubicacion_producto` (
  `id_ubicacion_producto` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_seccion` int(11) NOT NULL,
  `numero_estante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ClienteID`),
  ADD UNIQUE KEY `CorreoElectronico` (`CorreoElectronico`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_tipo_producto` (`id_tipo_producto`);

--
-- Indices de la tabla `seccion`
--
ALTER TABLE `seccion`
  ADD PRIMARY KEY (`id_seccion`);

--
-- Indices de la tabla `tipo_de_producto`
--
ALTER TABLE `tipo_de_producto`
  ADD PRIMARY KEY (`id_tipo_producto`);

--
-- Indices de la tabla `ubicacion_producto`
--
ALTER TABLE `ubicacion_producto`
  ADD PRIMARY KEY (`id_ubicacion_producto`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_seccion` (`id_seccion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ClienteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `seccion`
--
ALTER TABLE `seccion`
  MODIFY `id_seccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo_de_producto`
--
ALTER TABLE `tipo_de_producto`
  MODIFY `id_tipo_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ubicacion_producto`
--
ALTER TABLE `ubicacion_producto`
  MODIFY `id_ubicacion_producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_tipo_producto`) REFERENCES `tipo_de_producto` (`id_tipo_producto`);

--
-- Filtros para la tabla `ubicacion_producto`
--
ALTER TABLE `ubicacion_producto`
  ADD CONSTRAINT `ubicacion_producto_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `ubicacion_producto_ibfk_2` FOREIGN KEY (`id_seccion`) REFERENCES `seccion` (`id_seccion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
