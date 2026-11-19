-- =========================================
-- ANÁLISIS DE RENDIMIENTO 1
-- CONSULTA DE INGRESOS POR MEDIO DE PAGO
-- =========================================

EXPLAIN (ANALYZE, BUFFERS, FORMAT TEXT)
SELECT
  medio_pago,
  SUM(total_venta) AS ingreso_total
FROM venta
WHERE estado_pago = 'Aprobado'
  AND medio_pago IS NOT NULL
GROUP BY medio_pago
ORDER BY ingreso_total DESC;

-- =========================================
-- ANÁLISIS DE RENDIMIENTO 2
-- CLIENTES QUE COMPRARON PIJAMAS TIPO PANTALON
-- =========================================

EXPLAIN (ANALYZE, BUFFERS, FORMAT TEXT)
SELECT DISTINCT
  c.id_cliente,
  c.nombre_completo,
  c.telefono,
  c.correo_electronico
FROM cliente c
JOIN venta v
  ON v.id_cliente = c.id_cliente
JOIN detalle_venta dv
  ON dv.id_venta = v.id_venta
JOIN producto p
  ON p.id_producto = dv.id_producto
JOIN referencia_producto rp
  ON rp.id_referencia = p.id_referencia
WHERE rp.tipo_conjunto = 'Pantalon'
ORDER BY c.nombre_completo;