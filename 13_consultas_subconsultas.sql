-- =========================================
-- SUBCONSULTA 1
-- PRODUCTOS CON PRECIO SUPERIOR AL PRECIO PROMEDIO
-- =========================================

SELECT
  id_referencia,
  tipo_conjunto,
  tipo_tela,
  talla,
  precio
FROM referencia_producto
WHERE precio > (
  SELECT AVG(precio)
  FROM referencia_producto
)
ORDER BY precio DESC;

-- =========================================
-- SUBCONSULTA 2
-- CLIENTE QUE REALIZÓ LA VENTA MÁS COSTOSA
-- =========================================

SELECT
  c.id_cliente,
  c.nombre_completo,
  v.id_venta,
  v.total_venta
FROM cliente c
JOIN venta v
  ON v.id_cliente = c.id_cliente
WHERE v.total_venta = (
  SELECT MAX(total_venta)
  FROM venta
  WHERE id_cliente IS NOT NULL
    AND estado_pago = 'Aprobado'
)
AND v.estado_pago = 'Aprobado';

-- =========================================
-- SUBCONSULTA 3
-- PRODUCTOS QUE NUNCA HAN SIDO VENDIDOS
-- =========================================

SELECT
  p.id_producto,
  p.nombre_producto
FROM producto p
WHERE p.id_producto NOT IN (
  SELECT dv.id_producto
  FROM detalle_venta dv
)
ORDER BY p.nombre_producto;

-- =========================================
-- SUBCONSULTA 4
-- VENTAS QUE NO TIENEN DETALLES REGISTRADOS
-- =========================================

SELECT
  v.id_venta,
  v.fecha_hora,
  v.id_cliente,
  v.total_venta
FROM venta v
WHERE NOT EXISTS (
  SELECT 1
  FROM detalle_venta dv
  WHERE dv.id_venta = v.id_venta
)
ORDER BY v.fecha_hora;

-- =========================================
-- SUBCONSULTA 5
-- PRODUCTO DE MAYOR PRECIO COMPRADO POR CADA CLIENTE
-- =========================================

SELECT
  c.id_cliente,
  c.nombre_completo,
  p.id_producto,
  p.nombre_producto,
  dv.precio_unitario_venta
FROM cliente c
JOIN venta v
  ON v.id_cliente = c.id_cliente
JOIN detalle_venta dv
  ON dv.id_venta = v.id_venta
JOIN producto p
  ON p.id_producto = dv.id_producto
WHERE dv.precio_unitario_venta = (
  SELECT MAX(dv2.precio_unitario_venta)
  FROM venta v2
  JOIN detalle_venta dv2
    ON dv2.id_venta = v2.id_venta
  WHERE v2.id_cliente = c.id_cliente
)
ORDER BY
  c.nombre_completo;