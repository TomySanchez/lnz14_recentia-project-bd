-- Este script crea la base de datos, las tablas y las relaciones entre ellas.

CREATE DATABASE BDSoderia;

USE BDSoderia;

-- Crear tablas:

CREATE TABLE Localidades(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(40) NOT NULL
);

CREATE TABLE Barrios(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(40) NOT NULL,
	idLocalidad INT NOT NULL
);

CREATE TABLE Direcciones(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	calle VARCHAR(40) NOT NULL,
	numero INT NOT NULL,
	piso INT,
	departamento VARCHAR(10),
	idBarrio INT NOT NULL
);

CREATE TABLE Clientes(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(40) NOT NULL,
	telefono VARCHAR(20),
	cuit_cuil VARCHAR(20),
	observaciones VARCHAR(100),
	idDireccion INT NOT NULL,
	activo TINYINT NOT NULL DEFAULT 1
);

CREATE TABLE Pedidos(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	fechaRegistro DATE NOT NULL,
	esRecurrente TINYINT(1) NOT NULL,
	cantSemanas INT,
	estado VARCHAR(20) NOT NULL,
	idCliente INT NOT NULL,
	activo TINYINT NOT NULL DEFAULT 1
);

CREATE TABLE DetallesDePedidos(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	cantidad INT NOT NULL,
	idPedido INT NOT NULL,
	idProducto INT NOT NULL
);

CREATE TABLE Productos(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(40) NOT NULL,
	descripcion VARCHAR(100),
	estado VARCHAR(20) NOT NULL
);

CREATE TABLE Precios(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	descripcion VARCHAR(40) NOT NULL,
	valor DECIMAL(10, 2) NOT NULL,
	idProducto INT NOT NULL
);

CREATE TABLE Entregas(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	fechaEntrega DATE,
	estado VARCHAR(20) NOT NULL,
	idPedido INT NOT NULL,
	idRecorrido INT,
	idPago INT
);

CREATE TABLE DetallesDeEntregas(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	cantidad INT NOT NULL,
	idEntrega INT NOT NULL,
	idProducto INT NOT NULL
);

CREATE TABLE Recorridos(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	fecha DATE,
	estado VARCHAR(20) NOT NULL
);

CREATE TABLE Pagos(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	fechaPago DATE,
	estado VARCHAR(20) NOT NULL,
	idMetodoDePago INT
);

CREATE TABLE MetodosDePago(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(20) NOT NULL,
	observaciones VARCHAR(100)
);

CREATE TABLE DetallesDePagos(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	idPago INT NOT NULL,
	idDetalleDeEntrega INT NOT NULL,
	idPrecio INT NOT NULL
);

CREATE TABLE Usuarios(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	alias VARCHAR(20) NOT NULL,
	contrasenia VARCHAR(40) NOT NULL
);

-- Crear relaciones:

ALTER TABLE Barrios
ADD CONSTRAINT fk_barrio_localidad
FOREIGN KEY (idLocalidad) REFERENCES Localidades(id);

ALTER TABLE Direcciones
ADD CONSTRAINT fk_direccion_barrio
FOREIGN KEY (idBarrio) REFERENCES Barrios(id);

ALTER TABLE Clientes
ADD CONSTRAINT fk_cliente_direccion
FOREIGN KEY (idDireccion) REFERENCES Direcciones(id);

ALTER TABLE Pedidos
ADD CONSTRAINT fk_pedido_cliente
FOREIGN KEY (idCliente) REFERENCES Clientes(id);

ALTER TABLE DetallesDePedidos
ADD CONSTRAINT fk_detalleDePedido_pedido
FOREIGN KEY (idPedido) REFERENCES Pedidos(id);

ALTER TABLE DetallesDePedidos
ADD CONSTRAINT fk_detalleDePedido_producto
FOREIGN KEY (idProducto) REFERENCES Productos(id);

ALTER TABLE Precios
ADD CONSTRAINT fk_precio_producto
FOREIGN KEY (idProducto) REFERENCES Productos(id); 

ALTER TABLE Entregas
ADD CONSTRAINT fk_entrega_pedido
FOREIGN KEY (idPedido) REFERENCES Pedidos(id);

ALTER TABLE Entregas
ADD CONSTRAINT fk_entrega_recorrido
FOREIGN KEY (idRecorrido) REFERENCES Recorridos(id);

ALTER TABLE Entregas
ADD CONSTRAINT fk_entrega_pago
FOREIGN KEY (idPago) REFERENCES Pagos(id);

ALTER TABLE DetallesDeEntregas
ADD CONSTRAINT fk_detalleDeEntrega_entrega
FOREIGN KEY (idEntrega) REFERENCES Entregas(id);

ALTER TABLE DetallesDeEntregas
ADD CONSTRAINT fk_detalleDeEntrega_producto
FOREIGN KEY (idProducto) REFERENCES Productos(id);

ALTER TABLE Pagos
ADD CONSTRAINT fk_pago_metodoDePago
FOREIGN KEY (idMetodoDePago) REFERENCES MetodosDePago(id);

ALTER TABLE DetallesDePagos
ADD CONSTRAINT fk_detalleDePago_pago
FOREIGN KEY (idPago) REFERENCES Pagos(id);

ALTER TABLE DetallesDePagos
ADD CONSTRAINT fk_detalleDePago_detalleDeEntrega
FOREIGN KEY (idDetalleDeEntrega) REFERENCES DetallesDeEntregas(id);

ALTER TABLE DetallesDePagos
ADD CONSTRAINT fk_detalleDePago_precio
FOREIGN KEY (idPrecio) REFERENCES Precios(id);
