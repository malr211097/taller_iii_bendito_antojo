-- =========================================
-- CONSULTA DE AGREGACIÓN 1
-- TOTAL DE INGRESOS GENERADOS POR MES
-- =========================================

SELECT
  EXTRACT(YEAR FROM fecha_hora) AS anio,
  EXTRACT(MONTH FROM fecha_hora) AS mes,
  SUM(total_venta) AS total_ingresos
FROM venta
WHERE estado_pago = 'Aprobado'
GROUP BY
  EXTRACT(YEAR FROM fecha_hora),
  EXTRACT(MONTH FROM fecha_hora)
ORDER BY anio, mes;


-- =========================================
-- CONSULTA DE AGREGACIÓN 2
-- NÚMERO DE VENTAS REALIZADAS POR CADA CLIENTE
-- =========================================

SELECT
  c.id_cliente,
  c.nombre_completo,
  COUNT(v.id_venta) AS numero_ventas
FROM cliente c
JOIN venta v
  ON v.id_cliente = c.id_cliente
GROUP BY
  c.id_cliente,
  c.nombre_completo
ORDER BY
  numero_ventas DESC,
  c.nombre_completo;

  -- =========================================
-- CONSULTA DE AGREGACIÓN 3
-- PRODUCTOS VENDIDOS EN MÁS DE 5 UNIDADES
-- =========================================

SELECT
  p.id_producto,
  p.nombre_producto,
  SUM(dv.cantidad_vendida) AS total_unidades_vendidas
FROM producto p
JOIN detalle_venta dv
  ON dv.id_producto = p.id_producto
GROUP BY
  p.id_producto,
  p.nombre_producto
HAVING SUM(dv.cantidad_vendida) > 5
ORDER BY total_unidades_vendidas DESC;

-- =========================================
-- CONSULTA DE AGREGACIÓN 4
-- CLIENTES CON MAYOR GASTO TOTAL ACUMULADO
-- =========================================

SELECT
  c.id_cliente,
  c.nombre_completo,
  SUM(v.total_venta) AS gasto_total
FROM cliente c
JOIN venta v
  ON v.id_cliente = c.id_cliente
WHERE v.estado_pago = 'Aprobado'
GROUP BY
  c.id_cliente,
  c.nombre_completo
ORDER BY gasto_total DESC;

-- =========================================
-- CONSULTA DE AGREGACIÓN 5
-- CLIENTES QUE HAN UTILIZADO MÁS DE UN MEDIO DE PAGO
-- =========================================

SELECT
  c.id_cliente,
  c.nombre_completo,
  COUNT(DISTINCT v.medio_pago) AS medios_pago_utilizados
FROM cliente c
JOIN venta v
  ON v.id_cliente = c.id_cliente
WHERE v.medio_pago IS NOT NULL
GROUP BY
  c.id_cliente,
  c.nombre_completo
HAVING COUNT(DISTINCT v.medio_pago) > 1
ORDER BY medios_pago_utilizados DESC,
         c.nombre_completo;

         -- =========================================
-- CONSULTA DE AGREGACIÓN 6
-- PROMEDIO DE UNIDADES VENDIDAS POR TIPO DE CONJUNTO
-- =========================================

SELECT
  rp.tipo_conjunto,
  ROUND(AVG(dv.cantidad_vendida), 2) AS promedio_unidades_vendidas
FROM referencia_producto rp
JOIN producto p
  ON p.id_referencia = rp.id_referencia
JOIN detalle_venta dv
  ON dv.id_producto = p.id_producto
GROUP BY
  rp.tipo_conjunto
ORDER BY
  promedio_unidades_vendidas DESC;

  -- =========================================
-- CONSULTA DE AGREGACIÓN 7
-- TOTAL DE VENTAS Y MONTO TOTAL POR TIPO DE CONJUNTO
-- =========================================

SELECT
  rp.tipo_conjunto,
  COUNT(DISTINCT v.id_venta) AS total_ventas,
  SUM(dv.cantidad_vendida * dv.precio_unitario_venta) AS monto_total
FROM referencia_producto rp
JOIN producto p
  ON p.id_referencia = rp.id_referencia
JOIN detalle_venta dv
  ON dv.id_producto = p.id_producto
JOIN venta v
  ON v.id_venta = dv.id_venta
WHERE v.estado_pago = 'Aprobado'
GROUP BY
  rp.tipo_conjunto
ORDER BY
  monto_total DESC;

  -- =========================================
-- CONSULTA DE AGREGACIÓN 8
-- TRES CLIENTES CON MAYOR CANTIDAD DE UNIDADES COMPRADAS
-- =========================================

SELECT
  c.id_cliente,
  c.nombre_completo,
  SUM(dv.cantidad_vendida) AS total_unidades_compradas
FROM cliente c
JOIN venta v
  ON v.id_cliente = c.id_cliente
JOIN detalle_venta dv
  ON dv.id_venta = v.id_venta
WHERE v.estado_pago = 'Aprobado'
GROUP BY
  c.id_cliente,
  c.nombre_completo
ORDER BY
  total_unidades_compradas DESC,
  c.nombre_completo
LIMIT 3;

-- =========================================
-- CONSULTA DE AGREGACIÓN 9
-- INGRESO TOTAL POR CADA MEDIO DE PAGO
-- =========================================

SELECT
  medio_pago,
  SUM(total_venta) AS ingreso_total
FROM venta
WHERE estado_pago = 'Aprobado'
  AND medio_pago IS NOT NULL
GROUP BY medio_pago
ORDER BY ingreso_total DESC;

-- =========================================
-- CONSULTA DE AGREGACIÓN 10
-- CLIENTES QUE HAN COMPRADO MÁS DE UN PRODUCTO DIFERENTE
-- =========================================

SELECT
  c.id_cliente,
  c.nombre_completo,
  COUNT(DISTINCT dv.id_producto) AS productos_diferentes
FROM cliente c
JOIN venta v
  ON v.id_cliente = c.id_cliente
JOIN detalle_venta dv
  ON dv.id_venta = v.id_venta
WHERE v.estado_pago = 'Aprobado'
GROUP BY
  c.id_cliente,
  c.nombre_completo
HAVING COUNT(DISTINCT dv.id_producto) > 1
ORDER BY
  productos_diferentes DESC,
  c.nombre_completo;