-- =========================================
-- CONSULTA BÁSICA 1
-- PRODUCTOS DISPONIBLES EN INVENTARIO
-- =========================================

SELECT
  p.id_producto,
  p.nombre_producto,
  rp.tipo_conjunto,
  rp.tipo_tela,
  rp.talla,
  i.cantidad
FROM producto p
JOIN referencia_producto rp
  ON rp.id_referencia = p.id_referencia
JOIN inventario i
  ON i.id_referencia = rp.id_referencia
WHERE i.cantidad > 0
ORDER BY p.nombre_producto;

-- =========================================
-- CONSULTA BÁSICA 2
-- VENTAS CON ESTADO DE PAGO APROBADO
-- =========================================

SELECT
  id_venta,
  fecha_hora,
  id_cliente,
  canal_venta,
  medio_pago,
  estado_pago,
  total_venta
FROM venta
WHERE estado_pago = 'Aprobado'
ORDER BY fecha_hora;

-- =========================================
-- CONSULTA BÁSICA 3
-- VENTAS CON MÁS DE UNA UNIDAD VENDIDA
-- =========================================

SELECT
  v.id_venta,
  v.fecha_hora,
  p.nombre_producto,
  dv.cantidad_vendida,
  dv.precio_unitario_venta
FROM venta v
JOIN detalle_venta dv
  ON dv.id_venta = v.id_venta
JOIN producto p
  ON p.id_producto = dv.id_producto
WHERE dv.cantidad_vendida > 1
ORDER BY dv.cantidad_vendida DESC,
         v.fecha_hora;