-- =========================================
-- VERIFICACIÓN DE DATOS SINTÉTICOS
-- BENDITO ANTOJO
-- =========================================

-- 1. Verificar cantidad de registros por tabla
SELECT 'referencia_producto' AS tabla, COUNT(*) AS total
FROM referencia_producto

UNION ALL

SELECT 'producto', COUNT(*)
FROM producto

UNION ALL

SELECT 'materia_prima', COUNT(*)
FROM materia_prima

UNION ALL

SELECT 'proveedor', COUNT(*)
FROM proveedor

UNION ALL

SELECT 'cliente', COUNT(*)
FROM cliente

UNION ALL

SELECT 'ficha_tecnica', COUNT(*)
FROM ficha_tecnica

UNION ALL

SELECT 'produccion', COUNT(*)
FROM produccion

UNION ALL

SELECT 'inventario', COUNT(*)
FROM inventario

UNION ALL

SELECT 'stock_materia_prima', COUNT(*)
FROM stock_materia_prima

UNION ALL

SELECT 'venta', COUNT(*)
FROM venta

UNION ALL

SELECT 'detalle_venta', COUNT(*)
FROM detalle_venta

UNION ALL

SELECT 'inventario_movimiento', COUNT(*)
FROM inventario_movimiento;


-- 2. Verificar productos y sus referencias
SELECT
  p.id_producto,
  p.nombre_producto,
  r.id_referencia,
  r.genero,
  r.tipo_conjunto,
  r.precio
FROM producto p
JOIN referencia_producto r
  ON r.id_referencia = p.id_referencia
ORDER BY p.id_producto;


-- 3. Verificar ventas con cliente
SELECT
  v.id_venta,
  v.fecha_hora,
  c.nombre_completo,
  v.canal_venta,
  v.medio_pago,
  v.estado_pago,
  v.total_venta
FROM venta v
LEFT JOIN cliente c
  ON c.id_cliente = v.id_cliente
ORDER BY v.id_venta;


-- 4. Verificar detalle de ventas
SELECT
  dv.id_venta,
  p.nombre_producto,
  dv.cantidad_vendida,
  dv.precio_unitario_venta,
  dv.cantidad_vendida * dv.precio_unitario_venta AS subtotal
FROM detalle_venta dv
JOIN producto p
  ON p.id_producto = dv.id_producto
ORDER BY dv.id_venta;


-- 5. Verificar movimientos de inventario
SELECT
  im.id_movimiento,
  im.id_inventario,
  im.id_venta,
  im.id_produccion,
  im.tipo_movimiento,
  im.cantidad_movimiento
FROM inventario_movimiento im
ORDER BY im.id_movimiento;