BEGIN;

-- =========================================
-- DATOS SINTÉTICOS - BENDITO ANTOJO
-- TABLAS INDEPENDIENTES
-- =========================================

-- REFERENCIAS DE PRODUCTO
INSERT INTO referencia_producto
(id_referencia, genero, tipo_conjunto, tipo_tela, talla, diseno, precio)
VALUES
(1001, 'Mujer', 'Short', 'Algodon', 'S', 'Floral rosa', 78000.00),
(1002, 'Mujer', 'Pantalon', 'Seda', 'M', 'Lunares beige', 98000.00),
(1003, 'Mujer', 'Short', 'Satin', 'L', 'Corazones vino', 89000.00),
(1004, 'Hombre', 'Pantalon', 'Algodon', 'M', 'Rayas azul', 85000.00),
(1005, 'Hombre', 'Short', 'Algodon', 'L', 'Clasico gris', 76000.00),
(1006, 'Mujer', 'Pantalon', 'Franela', 'S', 'Estrellas', 92000.00),
(1007, 'Hombre', 'Pantalon', 'Franela', 'XL', 'Cuadros verdes', 95000.00),
(1008, 'Mujer', 'Short', 'Seda', 'M', 'Flores azules', 99000.00),
(1009, 'Mujer', 'Pantalon', 'Algodon', 'L', 'Minimalista crema', 88000.00),
(1010, 'Hombre', 'Short', 'Satin', 'M', 'Negro clasico', 90000.00);

-- MATERIAS PRIMAS
INSERT INTO materia_prima
(id_materia_prima, nombre_materia_prima, tipo_materia_prima, unidad_medida, estado)
VALUES
(2001, 'Tela algodon blanca', 'Tela', 'Metro', 'Activo'),
(2002, 'Tela seda beige', 'Tela', 'Metro', 'Activo'),
(2003, 'Tela satin vino', 'Tela', 'Metro', 'Activo'),
(2004, 'Tela franela gris', 'Tela', 'Metro', 'Activo'),
(2005, 'Hilo blanco', 'Hilo', 'Cono', 'Activo'),
(2006, 'Hilo negro', 'Hilo', 'Cono', 'Activo'),
(2007, 'Elastico 2 cm', 'Elastico', 'Metro', 'Activo'),
(2008, 'Boton nacarado', 'Boton', 'Unidad', 'Activo'),
(2009, 'Etiqueta Bendito Antojo', 'Etiqueta', 'Unidad', 'Activo'),
(2010, 'Empaque individual', 'Empaque', 'Unidad', 'Activo');

-- PROVEEDORES
INSERT INTO proveedor
(id_proveedor, nombre_proveedor, telefono, correo_electronico)
VALUES
(3001, 'Textiles Manizales', '3105551001', 'ventas@textilesmanizales.com'),
(3002, 'Distribuidora La Tela', '3105551002', 'contacto@latela.com'),
(3003, 'Insumos del Eje', '3105551003', 'ventas@insumosdeleje.com'),
(3004, 'Empaques Caldas', '3105551004', 'pedidos@empaquescaldas.com'),
(3005, 'Hilos y Accesorios SAS', '3105551005', 'comercial@hilosyaccesorios.com');

-- CLIENTES
INSERT INTO cliente
(id_cliente, nombre_completo, telefono, correo_electronico, direccion)
VALUES
(4001, 'Laura Gomez', '3001110001', 'laura.gomez@example.com', 'Manizales'),
(4002, 'Daniela Rios', '3001110002', 'daniela.rios@example.com', 'Villamaria'),
(4003, 'Camila Lopez', '3001110003', 'camila.lopez@example.com', 'Manizales'),
(4004, 'Sofia Ramirez', '3001110004', 'sofia.ramirez@example.com', 'Chinchina'),
(4005, 'Valentina Ortiz', '3001110005', 'valentina.ortiz@example.com', 'Manizales'),
(4006, 'Andres Perez', '3001110006', 'andres.perez@example.com', 'Neira'),
(4007, 'Juan Herrera', '3001110007', 'juan.herrera@example.com', 'Manizales'),
(4008, 'Natalia Giraldo', '3001110008', 'natalia.giraldo@example.com', 'Palestina'),
(4009, 'Mariana Castro', '3001110009', 'mariana.castro@example.com', 'Manizales'),
(4010, 'Sebastian Torres', '3001110010', 'sebastian.torres@example.com', 'Villamaria'),
(4011, 'Paula Garcia', '3001110011', 'paula.garcia@example.com', 'Manizales'),
(4012, 'Felipe Restrepo', '3001110012', 'felipe.restrepo@example.com', 'Chinchina'),
(4013, 'Juliana Martinez', '3001110013', 'juliana.martinez@example.com', 'Manizales'),
(4014, 'Santiago Ocampo', '3001110014', 'santiago.ocampo@example.com', 'Neira'),
(4015, 'Carolina Salazar', '3001110015', 'carolina.salazar@example.com', 'Manizales'),
(4016, 'Miguel Arias', '3001110016', 'miguel.arias@example.com', 'Villamaria'),
(4017, 'Isabella Vargas', '3001110017', 'isabella.vargas@example.com', 'Manizales'),
(4018, 'Mateo Cardenas', '3001110018', 'mateo.cardenas@example.com', 'Palestina'),
(4019, 'Sara Jimenez', '3001110019', 'sara.jimenez@example.com', 'Manizales'),
(4020, 'Nicolas Bedoya', '3001110020', 'nicolas.bedoya@example.com', 'Chinchina');

COMMIT;



BEGIN;

-- =========================================
-- SEGUNDA CARGA DE DATOS SINTÉTICOS
-- TABLAS DEPENDIENTES
-- =========================================

-- PRODUCTOS
INSERT INTO producto
(id_producto, id_referencia, nombre_producto, fecha_registro)
VALUES
(5001, 1001, 'Pijama mujer short floral rosa', '2026-10-01'),
(5002, 1002, 'Pijama mujer pantalon seda beige', '2026-10-02'),
(5003, 1003, 'Pijama mujer short satin vino', '2026-10-03'),
(5004, 1004, 'Pijama hombre pantalon algodon azul', '2026-10-04'),
(5005, 1005, 'Pijama hombre short clasico gris', '2026-10-05'),
(5006, 1006, 'Pijama mujer pantalon franela estrellas', '2026-10-06'),
(5007, 1007, 'Pijama hombre pantalon franela cuadros', '2026-10-07'),
(5008, 1008, 'Pijama mujer short seda flores azules', '2026-10-08'),
(5009, 1009, 'Pijama mujer pantalon minimalista crema', '2026-10-09'),
(5010, 1010, 'Pijama hombre short satin negro', '2026-10-10');

-- FICHAS TÉCNICAS
INSERT INTO ficha_tecnica
(id_ficha, id_referencia, vigente)
VALUES
(6001, 1001, TRUE),
(6002, 1002, TRUE),
(6003, 1003, TRUE),
(6004, 1004, TRUE),
(6005, 1005, TRUE),
(6006, 1006, TRUE),
(6007, 1007, TRUE),
(6008, 1008, TRUE),
(6009, 1009, TRUE),
(6010, 1010, TRUE);

-- PROVEEDOR - MATERIA PRIMA
INSERT INTO proveedor_materia_prima
(id_proveedor, id_materia_prima)
VALUES
(3001, 2001),
(3001, 2004),
(3002, 2002),
(3002, 2003),
(3003, 2007),
(3003, 2008),
(3003, 2009),
(3004, 2010),
(3005, 2005),
(3005, 2006);

-- STOCK DE MATERIA PRIMA
INSERT INTO stock_materia_prima
(id_materia_prima, cantidad_disponible, nivel_minimo, fecha_actualizacion)
VALUES
(2001, 120.00, 20.00, '2026-11-12 09:00:00'),
(2002, 80.00, 15.00, '2026-11-12 09:00:00'),
(2003, 75.00, 15.00, '2026-11-12 09:00:00'),
(2004, 100.00, 20.00, '2026-11-12 09:00:00'),
(2005, 25.00, 5.00, '2026-11-12 09:00:00'),
(2006, 25.00, 5.00, '2026-11-12 09:00:00'),
(2007, 90.00, 15.00, '2026-11-12 09:00:00'),
(2008, 200.00, 30.00, '2026-11-12 09:00:00'),
(2009, 250.00, 40.00, '2026-11-12 09:00:00'),
(2010, 250.00, 40.00, '2026-11-12 09:00:00');

COMMIT;


BEGIN;

-- =========================================
-- TERCERA CARGA DE DATOS SINTÉTICOS
-- DETALLE DE FICHAS, PRODUCCIÓN E INVENTARIO
-- =========================================

-- DETALLE DE FICHAS TÉCNICAS
INSERT INTO detalle_ficha
(id_ficha, id_materia_prima, consumo_por_unidad)
VALUES
(6001, 2001, 1.80),
(6001, 2005, 0.05),
(6001, 2007, 0.70),
(6001, 2009, 1.00),

(6002, 2002, 2.20),
(6002, 2005, 0.05),
(6002, 2008, 4.00),
(6002, 2009, 1.00),

(6003, 2003, 1.70),
(6003, 2006, 0.05),
(6003, 2007, 0.70),
(6003, 2009, 1.00),

(6004, 2001, 2.30),
(6004, 2005, 0.05),
(6004, 2008, 4.00),
(6004, 2009, 1.00),

(6005, 2001, 1.80),
(6005, 2006, 0.05),
(6005, 2007, 0.80),
(6005, 2009, 1.00),

(6006, 2004, 2.20),
(6006, 2005, 0.05),
(6006, 2008, 4.00),
(6006, 2009, 1.00),

(6007, 2004, 2.40),
(6007, 2006, 0.05),
(6007, 2008, 4.00),
(6007, 2009, 1.00),

(6008, 2002, 1.70),
(6008, 2005, 0.05),
(6008, 2007, 0.70),
(6008, 2009, 1.00),

(6009, 2001, 2.20),
(6009, 2005, 0.05),
(6009, 2008, 4.00),
(6009, 2009, 1.00),

(6010, 2003, 1.80),
(6010, 2006, 0.05),
(6010, 2007, 0.80),
(6010, 2009, 1.00);

-- PRODUCCIONES
INSERT INTO produccion
(id_produccion, id_referencia, id_ficha, fecha_hora, cantidad_producida)
VALUES
(7001, 1001, 6001, '2026-10-15 08:00:00', 20),
(7002, 1002, 6002, '2026-10-16 08:30:00', 15),
(7003, 1003, 6003, '2026-10-17 09:00:00', 18),
(7004, 1004, 6004, '2026-10-18 08:00:00', 20),
(7005, 1005, 6005, '2026-10-19 09:30:00', 16),
(7006, 1006, 6006, '2026-10-20 08:30:00', 14),
(7007, 1007, 6007, '2026-10-21 09:00:00', 12),
(7008, 1008, 6008, '2026-10-22 08:00:00', 18),
(7009, 1009, 6009, '2026-10-23 08:30:00', 16),
(7010, 1010, 6010, '2026-10-24 09:00:00', 15);

-- INVENTARIO DE PRODUCTOS TERMINADOS
INSERT INTO inventario
(id_inventario, id_referencia, cantidad)
VALUES
(8001, 1001, 20),
(8002, 1002, 15),
(8003, 1003, 18),
(8004, 1004, 20),
(8005, 1005, 16),
(8006, 1006, 14),
(8007, 1007, 12),
(8008, 1008, 18),
(8009, 1009, 16),
(8010, 1010, 15);

COMMIT;

BEGIN;

-- =========================================
-- CUARTA CARGA DE DATOS SINTÉTICOS
-- VENTAS, DETALLES Y MOVIMIENTOS
-- =========================================

-- VENTAS
INSERT INTO venta
(id_venta, fecha_hora, id_cliente, canal_venta, medio_pago, estado_pago, total_venta)
VALUES
(9001, '2026-10-25 10:00:00', 4001, 'Web', 'Transferencia', 'Aprobado', 156000.00),
(9002, '2026-10-25 11:30:00', 4002, 'Presencial', 'Efectivo', 'Aprobado', 98000.00),
(9003, '2026-10-26 09:15:00', 4003, 'Web', 'Tarjeta', 'Aprobado', 178000.00),
(9004, '2026-10-26 14:00:00', 4004, 'Presencial', 'Efectivo', 'Aprobado', 85000.00),
(9005, '2026-10-27 16:20:00', 4005, 'Web', 'Transferencia', 'Aprobado', 152000.00),
(9006, '2026-10-28 10:45:00', 4006, 'Presencial', 'Tarjeta', 'Aprobado', 92000.00),
(9007, '2026-10-29 12:00:00', 4007, 'Web', 'Transferencia', 'Aprobado', 190000.00),
(9008, '2026-10-30 15:10:00', 4008, 'Presencial', 'Efectivo', 'Aprobado', 99000.00),
(9009, '2026-10-31 17:30:00', 4009, 'Web', 'Tarjeta', 'Aprobado', 176000.00),
(9010, '2026-11-01 09:40:00', 4010, 'Presencial', 'Efectivo', 'Aprobado', 90000.00);

-- DETALLE DE VENTAS
INSERT INTO detalle_venta
(id_venta, id_producto, cantidad_vendida, precio_unitario_venta)
VALUES
(9001, 5001, 2, 78000.00),
(9002, 5002, 1, 98000.00),
(9003, 5003, 2, 89000.00),
(9004, 5004, 1, 85000.00),
(9005, 5005, 2, 76000.00),
(9006, 5006, 1, 92000.00),
(9007, 5007, 2, 95000.00),
(9008, 5008, 1, 99000.00),
(9009, 5009, 2, 88000.00),
(9010, 5010, 1, 90000.00);

-- MOVIMIENTOS DE INVENTARIO POR PRODUCCIÓN
INSERT INTO inventario_movimiento
(id_movimiento, id_inventario, id_venta, id_produccion, tipo_movimiento, cantidad_movimiento)
VALUES
(10001, 8001, NULL, 7001, 'Entrada', 20),
(10002, 8002, NULL, 7002, 'Entrada', 15),
(10003, 8003, NULL, 7003, 'Entrada', 18),
(10004, 8004, NULL, 7004, 'Entrada', 20),
(10005, 8005, NULL, 7005, 'Entrada', 16),
(10006, 8006, NULL, 7006, 'Entrada', 14),
(10007, 8007, NULL, 7007, 'Entrada', 12),
(10008, 8008, NULL, 7008, 'Entrada', 18),
(10009, 8009, NULL, 7009, 'Entrada', 16),
(10010, 8010, NULL, 7010, 'Entrada', 15);

-- MOVIMIENTOS DE INVENTARIO POR VENTA
INSERT INTO inventario_movimiento
(id_movimiento, id_inventario, id_venta, id_produccion, tipo_movimiento, cantidad_movimiento)
VALUES
(11001, 8001, 9001, NULL, 'Salida', 2),
(11002, 8002, 9002, NULL, 'Salida', 1),
(11003, 8003, 9003, NULL, 'Salida', 2),
(11004, 8004, 9004, NULL, 'Salida', 1),
(11005, 8005, 9005, NULL, 'Salida', 2),
(11006, 8006, 9006, NULL, 'Salida', 1),
(11007, 8007, 9007, NULL, 'Salida', 2),
(11008, 8008, 9008, NULL, 'Salida', 1),
(11009, 8009, 9009, NULL, 'Salida', 2),
(11010, 8010, 9010, NULL, 'Salida', 1);

COMMIT;