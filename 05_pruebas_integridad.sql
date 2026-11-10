BEGIN;

-- Prueba positiva 1:
-- Registrar una referencia de producto con datos válidos.
INSERT INTO referencia_producto (
  id_referencia,
  genero,
  tipo_conjunto,
  tipo_tela,
  talla,
  diseno,
  precio
)
VALUES (
  900001,
  'Mujer',
  'Pantalon',
  'Algodon',
  'M',
  'Estampado floral',
  85000.00
)
RETURNING *;


-- Prueba positiva 2:
-- Registrar un producto asociado a una referencia existente.
INSERT INTO producto (
  id_producto,
  id_referencia,
  nombre_producto,
  fecha_registro
)
VALUES (
  900001,
  900001,
  'Pijama mujer algodon',
  '2026-11-09'
)
RETURNING *;


-- Prueba positiva 3:
-- Registrar un cliente con datos válidos.
INSERT INTO cliente (
  id_cliente,
  nombre_completo,
  telefono,
  correo_electronico,
  direccion
)
VALUES (
  900001,
  'Cliente de prueba',
  '3001234567',
  'cliente.prueba@example.com',
  'Manizales'
)
RETURNING *;

COMMIT;