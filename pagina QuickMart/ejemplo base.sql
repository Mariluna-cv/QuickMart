CREATE TABLE tipo_de_producto (
  id_tipo_producto INT PRIMARY KEY AUTO_INCREMENT,
  nombre_tipo_producto VARCHAR(50) NOT NULL,
  descripcion_tipo_producto VARCHAR(255)
);
CREATE TABLE producto (
  id_producto INT PRIMARY KEY AUTO_INCREMENT,
  nombre_producto VARCHAR(50) NOT NULL,
  descripcion_producto VARCHAR(255),
  precio_producto DECIMAL(10,2) NOT NULL,
  unidad_medida_producto VARCHAR(10) NOT NULL,
  id_tipo_producto INT NOT NULL,
  FOREIGN KEY (id_tipo_producto) REFERENCES tipo_de_producto(id_tipo_producto)
);
CREATE TABLE seccion (
  id_seccion INT PRIMARY KEY AUTO_INCREMENT,
  nombre_seccion VARCHAR(50) NOT NULL,
  descripcion_seccion VARCHAR(255)
);
CREATE TABLE ubicacion_producto (
  id_ubicacion_producto INT PRIMARY KEY AUTO_INCREMENT,
  id_producto INT NOT NULL,
  id_seccion INT NOT NULL,
  numero_estante INT NOT NULL,
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
  FOREIGN KEY (id_seccion) REFERENCES seccion(id_seccion)
);
INSERT INTO tipo_de_producto (nombre_tipo_producto, descripcion_tipo_producto)
VALUES
  ("Frutas", "Productos frescos de origen vegetal"),
  ("Verduras", "Productos frescos de origen vegetal, excluyendo las frutas"),
  ("Carnes", "Productos frescos de origen animal"),
  ("Lacteos", "Productos derivados de la leche"),
  ("Bebidas", "Líquidos para consumo humano"),
  ("Snacks", "Alimentos ligeros para consumo entre comidas");
INSERT INTO producto (nombre_producto, descripcion_producto, precio_producto, unidad_medida_producto, id_tipo_producto)
VALUES
  ("Manzanas", "Fruta roja dulce y crujiente", 1.50, "kg", 1),
  ("Lechuga", "Hortaliza de hojas verdes utilizada en ensaladas", 2.00, "unidad", 2),
  ("Carne de res molida", "Carne molida de vaca para preparar hamburguesas, albóndigas, etc.", 4.50, "kg", 3),
  ("Leche entera", "Leche de vaca sin desnatada", 2.20, "litro", 4),
  ("Agua mineral", "Agua embotellada con minerales", 1.00, "litro", 5),
  ("Papas fritas", "Snack crujiente elaborado con papas", 2.50, "bolsa", 6);
INSERT INTO seccion (nombre_seccion, descripcion_seccion)
VALUES
  ("Frutas y verduras", "Sección con productos frescos de origen vegetal"),
  ("Carnes y pescados", "Sección con productos frescos de origen animal"),
  ("Lacteos y huevos", "Sección con productos derivados de la leche y huevos"),
  ("Bebidas", "Sección con bebidas de todo tipo"),
  ("Snacks y golosinas", "Sección con alimentos ligeros y dulces");
