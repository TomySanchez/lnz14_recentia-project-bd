-- Este script trunca todas las tablas de la base de datos de la sodería.

USE BDSoderia;

-- ELIMINAR FOREIGN KEYS
ALTER TABLE Barrios DROP FOREIGN KEY fk_barrio_localidad;
ALTER TABLE Direcciones DROP FOREIGN KEY fk_direccion_barrio;
ALTER TABLE Clientes DROP FOREIGN KEY fk_cliente_direccion;
ALTER TABLE Pedidos DROP FOREIGN KEY fk_pedido_cliente;
ALTER TABLE Pagos DROP FOREIGN KEY fk_pago_metodoDePago;
ALTER TABLE DetallesDePagos DROP FOREIGN KEY fk_detalleDePago_pago;
ALTER TABLE DetallesDePagos DROP FOREIGN KEY fk_detalleDePago_detalleDeEntrega;
ALTER TABLE DetallesDePagos DROP FOREIGN KEY fk_detalleDePago_precio;
ALTER TABLE Entregas DROP FOREIGN KEY fk_entrega_pago;
ALTER TABLE Entregas DROP FOREIGN KEY fk_entrega_pedido;
ALTER TABLE Entregas DROP FOREIGN KEY fk_entrega_recorrido;
ALTER TABLE Precios DROP FOREIGN KEY fk_precio_producto;
ALTER TABLE DetallesDePedidos DROP FOREIGN KEY fk_detalleDePedido_pedido;
ALTER TABLE DetallesDePedidos DROP FOREIGN KEY fk_detalleDePedido_producto;
ALTER TABLE DetallesDeEntregas DROP FOREIGN KEY fk_detalleDeEntrega_entrega;
ALTER TABLE DetallesDeEntregas DROP FOREIGN KEY fk_detalleDeEntrega_producto;

-- TRUNCAR TABLAS
TRUNCATE TABLE Localidades;
TRUNCATE TABLE Barrios;
TRUNCATE TABLE Direcciones;
TRUNCATE TABLE Clientes;
TRUNCATE TABLE Pedidos;
TRUNCATE TABLE DetallesDePedidos;
TRUNCATE TABLE Entregas;
TRUNCATE TABLE DetallesDeEntregas;
TRUNCATE TABLE Pagos;
TRUNCATE TABLE DetallesDePagos;
TRUNCATE TABLE MetodosDePago;
TRUNCATE TABLE Productos;
TRUNCATE TABLE Precios;
TRUNCATE TABLE Usuarios;
TRUNCATE TABLE Recorridos;

-- RELACIONAR TABLAS:
ALTER TABLE Barrios ADD CONSTRAINT fk_barrio_localidad
FOREIGN KEY (idLocalidad) REFERENCES Localidades(id);
ALTER TABLE Direcciones ADD CONSTRAINT fk_direccion_barrio
FOREIGN KEY (idBarrio) REFERENCES Barrios(id);
ALTER TABLE Clientes ADD CONSTRAINT fk_cliente_direccion
FOREIGN KEY (idDireccion) REFERENCES Direcciones(id);
ALTER TABLE Pedidos ADD CONSTRAINT fk_pedido_cliente
FOREIGN KEY (idCliente) REFERENCES Clientes(id);
ALTER TABLE Pagos ADD CONSTRAINT fk_pago_metodoDePago
FOREIGN KEY (idMetodoDePago) REFERENCES MetodosDePago(id);
ALTER TABLE DetallesDePagos ADD CONSTRAINT fk_detalleDePago_pago
FOREIGN KEY (idPago) REFERENCES Pagos(id);
ALTER TABLE DetallesDePagos ADD CONSTRAINT fk_detalleDePago_detalleDeEntrega
FOREIGN KEY (idDetalleDeEntrega) REFERENCES DetallesDeEntregas(id);
ALTER TABLE DetallesDePagos ADD CONSTRAINT fk_detalleDePago_precio
FOREIGN KEY (idPrecio) REFERENCES Precios(id);
ALTER TABLE Entregas ADD CONSTRAINT fk_entrega_pago
FOREIGN KEY (idPago) REFERENCES Pagos(id);
ALTER TABLE Entregas ADD CONSTRAINT fk_entrega_pedido
FOREIGN KEY (idPedido) REFERENCES Pedidos(id);
ALTER TABLE Entregas ADD CONSTRAINT fk_entrega_recorrido
FOREIGN KEY (idRecorrido) REFERENCES Recorridos(id);
ALTER TABLE Precios ADD CONSTRAINT fk_precio_producto
FOREIGN KEY (idProducto) REFERENCES Productos(id);
ALTER TABLE DetallesDePedidos ADD CONSTRAINT fk_detalleDePedido_pedido
FOREIGN KEY (idPedido) REFERENCES Pedidos(id);
ALTER TABLE DetallesDePedidos ADD CONSTRAINT fk_detalleDePedido_producto
FOREIGN KEY (idProducto) REFERENCES Productos(id);
ALTER TABLE DetallesDeEntregas ADD CONSTRAINT fk_detalleDeEntrega_entrega
FOREIGN KEY (idEntrega) REFERENCES Entregas(id);
ALTER TABLE DetallesDeEntregas ADD CONSTRAINT fk_detalleDeEntrega_producto
FOREIGN KEY (idProducto) REFERENCES Productos(id);
