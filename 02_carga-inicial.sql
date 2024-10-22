-- Este script inserta datos en las tablas.

USE BDSoderia;

INSERT INTO Usuarios (alias, contrasenia)
VALUES ('admin', 'admin123456');

INSERT INTO Localidades (nombre) 
VALUES 
	('Villa María'),
	('Villa Nueva');
	
INSERT INTO Barrios (nombre, idLocalidad) VALUES
('Almirante Brown', 1),
('Barrancas del Río', 1),
('Bello Horizonte', 1),
('Bernardino Rivadavia', 1),
('Carlos Pellegrini', 1),
('Centro Este', 1),
('Centro Norte', 1),
('Centro Oeste', 1),
('Centro Sur', 1),
('Domingo F. Sarmiento', 1),
('Eva Perón', 1),
('Felipe Neri Botta', 1),
('Florentino Ameghino', 1),
('General Güemes', 1),
('General Lamadrid', 1),
('General Paz', 1),
('General Roca - La Calera', 1),
('Industrial', 1),
('Las Acacias', 1),
('Las Playas', 1),
('Los Olmos', 1),
('Malvinas Argentinas', 1),
('Manuel Belgrano', 1),
('Mariano Moreno', 1),
('Nicolás Avellaneda', 1),
('Padre Carlos Mugica', 1),
('Palermo', 1),
('Parque Norte', 1),
('Ramón Carrillo', 1),
('Roque Sáenz Peña', 1),
('San Juan Bautista', 1),
('San Justo', 1),
('San Martín', 1),
('San Nicolás', 1),
('Santa Ana', 1),
('Trinitarios', 1),
('Villa Albertina', 1),
('Villa del Sur', 1),
('Vista Verde', 1),
('Ctalamochita', 2),
('Floresta', 2),
('Florida', 2);

INSERT INTO Direcciones (calle, numero, piso, departamento, idBarrio)
VALUES
	('Italia', 1743, NULL, NULL, 2),
	('E. Gálvez', 2456, NULL, NULL, 7),
	('Avenida Libertador', 1789, NULL, NULL, 39),
	('Mitre', 2101, 4, 'D', 34),
	('Corrientes', 102, 5, 'E', 5),
	('San Martín', 1103, NULL, NULL, 12),
	('Avenida Santa Fe', 104, 7, 'G', 5),
	('Moreno', 705, NULL, NULL, 8),
	('Avenida Rivadavia', 164, NULL, NULL, 2),
	('Lavalle', 1607, 10, 'J', 22);
	
INSERT INTO Clientes (nombre, telefono, cuit_cuil, observaciones, idDireccion)
VALUES
	('Marcos Pérez', '1123456789', '20345678901', NULL, 1),
	('María González', '1129876543', NULL, NULL, 2),
	('Damián Gutiérrez', '1123456785', '27345678915', 'Llamarlo antes de realizar entrega', 3),
	('Roberto Páez', '1123456784', '20345678916', NULL, 4),
	('Silvia Martínez', '1123456795', NULL, NULL, 5),
	('Pedro López', '1123456792', '20345678920', 'Tiene prioridad', 6),
	('Andrés González', NULL, NULL, NULL, 7),
	('Despensa Grandía', '1123456784', '27345678917', NULL, 8),
	('Restobar Mónaco', '1123456794', '20345678914', NULL, 9),
	('Juan Martínez', '1123456788', '27345678919', NULL, 10);
	
INSERT INTO Productos (nombre, descripcion, estado)
VALUES
	('Soda', 'Sifón de 1250 cc.', 'Activo'),
	('Agua', 'Botella de 1250 cc.', 'Activo'),
	('Jugo de naranja', 'Botella de 1000 cc.', 'Descontinuado');
	
INSERT INTO Precios (idProducto, descripcion, valor)
VALUES
    (1, 'Minorista', 1500),
    (1, 'Mayorista', 1200),
    (2, 'Minorista', 1000),
    (2, 'Mayorista', 800),
    (3, 'Minorista', 2000),
    (3, 'Mayorista', 1800);

INSERT INTO MetodosDePago (nombre, observaciones)
VALUES
	('Efectivo', NULL),
	('Transferencia', NULL);

INSERT INTO Pagos (fechaPago, estado, idMetodoDePago)
VALUES
    ('2024-07-05', 'Pagado', 1),
    ('2024-07-05', 'Pagado', 2),
    ('2024-07-10', 'Pagado', 1),
    ('2024-07-17', 'Pagado', 1),
    ('2024-07-25', 'Pagado', 2),
    ('2024-08-04', 'Pagado', 2),
    (NULL, 'Pendiente', NULL),
    (NULL, 'Pendiente', NULL),
    ('2024-07-31', 'Pagado', 2),
    ('2024-07-31', 'Pagado', 2),
    ('2024-07-31', 'Pagado', 2),
    ('2024-07-31', 'Pagado', 2),
    (NULL, 'Pendiente', NULL),
    (NULL, 'Pendiente', NULL),
    ('2024-07-09', 'Pagado', 1),
    ('2024-07-09', 'Pagado', 2),
    ('2024-07-18', 'Pagado', 2),
    ('2024-07-15', 'Pagado', 2),
    ('2024-07-23', 'Pagado', 1),
    ('2024-07-25', 'Pagado', 1),
    (NULL, 'Pendiente', NULL),
    (NULL, 'Pendiente', NULL);

INSERT INTO Recorridos (fecha, estado)
VALUES
    ('2024-07-05', 'Realizado'),
    ('2024-07-03', 'Realizado'),
    ('2024-07-10', 'Realizado'),
    ('2024-07-17', 'Realizado'),
    ('2024-07-24', 'Realizado'),
    ('2024-07-31', 'Realizado'),
    ('2024-08-07', 'Pendiente'),
    ('2024-07-09', 'Realizado'),
    ('2024-07-16', 'Realizado'),
    ('2024-07-23', 'Realizado'),
    ('2024-07-30', 'Realizado'),
    ('2024-08-06', 'Pendiente'),
    ('2024-07-15', 'Realizado'),
    ('2024-08-17', 'Pendiente');

   
INSERT INTO Pedidos (fechaRegistro, esRecurrente, cantSemanas, estado, idCliente)
VALUES
    ('2024-07-01', false, NULL, 'Realizado', 1),
    ('2024-07-01', true, 1, 'Activo', 2),
    ('2024-07-02', true, 1, 'Activo', 3),
    ('2024-07-03', false, NULL, 'Realizado', 4),
    ('2024-07-08', false, NULL, 'Realizado', 5),
    ('2024-07-09', false, NULL, 'Realizado', 8),
    ('2024-07-11', false, NULL, 'Realizado', 10),
    ('2024-07-17', false, NULL, 'Realizado', 6),
    ('2024-07-23', false, NULL, 'Realizado', 10),
    ('2024-07-25', false, NULL, 'Realizado', 10),
    ('2024-07-12', false, NULL, 'Pendiente', 6);

INSERT INTO DetallesDePedidos (cantidad, idPedido, idProducto)
VALUES
    (2, 1, 1),
    (2, 1, 2),
    (6, 3, 1),
    (2, 4, 1),
    (1, 4, 2),
    (3, 5, 1),
    (36, 6, 1),
    (12, 6, 2),
    (4, 7, 1),
    (3, 8, 2),
    (5, 9, 1),
    (4, 10, 1),
    (3, 11, 1);
   
INSERT INTO Entregas (fechaEntrega, estado, idPedido, idRecorrido, idPago)
VALUES
    ('2024-07-05', 'Realizada', 1, 1, NULL),
    ('2024-07-03', 'Realizada', 2, 2, NULL),
    ('2024-07-10', 'Realizada', 2, 3, NULL),
    ('2024-07-17', 'Realizada', 2, 4, NULL),
    ('2024-07-24', 'Realizada', 2, 5, NULL),
    ('2024-07-31', 'Realizada', 2, 6, NULL),
    ('2024-08-07', 'Pendiente', 2, 7, NULL),
    (NULL, 'Sin programar', 2, NULL, NULL),
    ('2024-07-09', 'Realizada', 3, 9, NULL),
    ('2024-07-16', 'Realizada', 3, 10, NULL),
    ('2024-07-23', 'Realizada', 3, 11, NULL),
    ('2024-07-30', 'Realizada', 3, 12, NULL),
    ('2024-08-06', 'Pendiente', 3, 13, NULL),
    (NULL, 'Sin programar', 3, NULL, NULL),
    ('2024-07-09', 'Realizada', 4, 9, NULL),
    ('2024-07-09', 'Realizada', 5, 9, NULL),
    ('2024-07-16', 'Realizada', 6, 11, NULL),
    ('2024-07-15', 'Realizada', 7, 14, NULL),
    ('2024-07-23', 'Realizada', 8, 11, NULL),
    ('2024-07-23', 'Realizada', 9, 11, NULL),
    ('2024-08-06', 'Pendiente', 10, 13, NULL),
    (NULL, 'Sin programar', 11, NULL, NULL);

INSERT INTO DetallesDeEntregas (cantidad, idEntrega, idProducto)
VALUES
    (2, 1, 1),
    (2, 1, 2),
    (2, 2, 1),
    (2, 3, 1),
    (4, 4, 1),
    (3, 5, 1),
    (2, 6, 1),
    (2, 7, 1),
    (6, 9, 1),
    (6, 10, 1),
    (3, 11, 1),
    (1, 11, 2),
    (6, 12, 1),
    (6, 13, 1),
    (6, 14, 1),
    (2, 15, 1),
    (1, 15, 2),
    (3, 16, 1),
    (36, 17, 1),
    (12, 17, 2),
    (4, 18, 1),
    (3, 19, 2),
    (5, 20, 1),
    (4, 21, 1),
    (3, 22, 1);

INSERT INTO DetallesDePagos (idPago, idDetalleDeEntrega, idPrecio)
VALUES
    (1, 1, 1),
    (1, 2, 3),
    (2, 3, 1),
    (3, 4, 1),
    (4, 5, 1),
    (5, 6, 1),
    (6, 7, 1),
    (7, 8, 1),
    (8, 9, 1),
    (9, 9, 1),
    (10, 10, 1),
    (11, 11, 1),
    (11, 12, 3),
    (12, 13, 1),
    (13, 14, 1),
    (14, 14, 1),
    (15, 16, 1),
    (15, 17, 3),
    (16, 18, 1),
    (17, 19, 2),
    (17, 20, 4),
    (18, 21, 1),
    (19, 22, 3),
    (20, 23, 1),
    (21, 24, 1),
    (22, 25, 1);
