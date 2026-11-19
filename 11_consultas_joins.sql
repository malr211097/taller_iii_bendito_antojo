-- =========================================
-- CONSULTA JOIN 1
-- CLIENTES QUE HAN COMPRADO PIJAMAS TIPO PANTALON
-- =========================================

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


-- =========================================
-- CONSULTA JOIN 2
-- CLIENTES DE MANIZALES QUE HAN REALIZADO COMPRAS
-- =========================================

SELECT DISTINCT
  c.id_cliente,
  c.nombre_completo,
  c.direccion,
  v.id_venta,
  v.fecha_hora
FROM cliente c
JOIN venta v
  ON v.id_cliente = c.id_cliente
WHERE c.direccion ILIKE '%Manizales%'
ORDER BY c.nombre_completo;