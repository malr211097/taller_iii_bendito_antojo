-- =========================================
-- VISTA 1
-- DETALLE GENERAL DE VENTAS
-- =========================================

CREATE OR REPLACE VIEW vista_detalle_ventas AS
SELECT
  v.id_venta,
  v.fecha_hora,
  c.nombre_completo AS cliente,
  v.canal_venta,
  v.medio_pago,
  v.estado_pago,
  p.nombre_producto,
  dv.cantidad_vendida,
  dv.precio_unitario_venta,
  (dv.cantidad_vendida * dv.precio_unitario_venta) AS subtotal
FROM venta v
LEFT JOIN cliente c
  ON c.id_cliente = v.id_cliente
JOIN detalle_venta dv
  ON dv.id_venta = v.id_venta
JOIN producto p
  ON p.id_producto = dv.id_producto;

  -- =========================================
-- VISTA 2
-- INGRESOS GENERADOS POR MES
-- =========================================

CREATE OR REPLACE VIEW vista_ingresos_mensuales AS
SELECT
  EXTRACT(YEAR FROM fecha_hora) AS anio,
  EXTRACT(MONTH FROM fecha_hora) AS mes,
  SUM(total_venta) AS total_ingresos
FROM venta
WHERE estado_pago = 'Aprobado'
GROUP BY
  EXTRACT(YEAR FROM fecha_hora),
  EXTRACT(MONTH FROM fecha_hora);