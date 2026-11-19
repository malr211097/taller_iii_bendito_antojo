-- =========================================
-- TRANSACCIÓN BÁSICA
-- REGISTRO DE UNA VENTA Y SU DETALLE
-- =========================================

BEGIN;

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
  9012,
  '2026-11-18 19:30:00',
  4002,
  'Web',
  'Transferencia',
  'Aprobado',
  98000.00
);

INSERT INTO detalle_venta (
  id_venta,
  id_producto,
  cantidad_vendida,
  precio_unitario_venta
)
VALUES (
  9012,
  5002,
  1,
  98000.00
);

COMMIT;

-- =========================================
-- PRUEBA DE ROLLBACK
-- =========================================

BEGIN;

UPDATE cliente
SET telefono = '3000000000'
WHERE id_cliente = 4002;

ROLLBACK;