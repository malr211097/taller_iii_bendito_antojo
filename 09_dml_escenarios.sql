BEGIN;

-- =========================================
-- ESCENARIO DML 1
-- CAMBIO DE ESTADO DE UNA MATERIA PRIMA
-- =========================================

UPDATE materia_prima
SET estado = 'Inactivo'
WHERE id_materia_prima = 2008;

-- Verificación del cambio
SELECT
  id_materia_prima,
  nombre_materia_prima,
  estado
FROM materia_prima
WHERE id_materia_prima = 2008;

COMMIT;

BEGIN;

-- =========================================
-- ESCENARIO DML 2
-- REGISTRO DE UNA VENTA PRESENCIAL SIN CLIENTE
-- =========================================

INSERT INTO venta (
  id_venta,
  fecha_hora,
  id_cliente,
  canal_venta,
  medio_pago,
  estado_pago,
  total_venta
)
VALUES (
  9011,
  '2026-11-17 18:30:00',
  NULL,
  'Presencial',
  'Efectivo',
  'Aprobado',
  78000.00
);

INSERT INTO detalle_venta (
  id_venta,
  id_producto,
  cantidad_vendida,
  precio_unitario_venta
)
VALUES (
  9011,
  5001,
  1,
  78000.00
);

COMMIT;

BEGIN;

-- =========================================
-- ESCENARIO DML 3
-- ACTUALIZACIÓN DE DATOS DE UN CLIENTE
-- =========================================

UPDATE cliente
SET telefono = '3102223344',
    direccion = 'Manizales - Caldas'
WHERE id_cliente = 4001;

-- Verificación del cambio
SELECT
  id_cliente,
  nombre_completo,
  telefono,
  direccion
FROM cliente
WHERE id_cliente = 4001;

COMMIT;