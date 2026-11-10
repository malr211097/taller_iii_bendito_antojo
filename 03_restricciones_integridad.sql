BEGIN;

ALTER TABLE referencia_producto
ADD CONSTRAINT ck_referencia_producto_precio
CHECK (precio > 0);

ALTER TABLE inventario
ADD CONSTRAINT ck_inventario_cantidad
CHECK (cantidad >= 0);

ALTER TABLE stock_materia_prima
ADD CONSTRAINT ck_stock_cantidad_disponible
CHECK (cantidad_disponible >= 0);

ALTER TABLE stock_materia_prima
ADD CONSTRAINT ck_stock_nivel_minimo
CHECK (nivel_minimo >= 0);

ALTER TABLE produccion
ADD CONSTRAINT ck_produccion_cantidad
CHECK (cantidad_producida > 0);

ALTER TABLE detalle_venta
ADD CONSTRAINT ck_detalle_venta_cantidad
CHECK (cantidad_vendida > 0);

ALTER TABLE detalle_venta
ADD CONSTRAINT ck_detalle_venta_precio
CHECK (precio_unitario_venta > 0);

ALTER TABLE detalle_ficha
ADD CONSTRAINT ck_detalle_ficha_consumo
CHECK (consumo_por_unidad > 0);

ALTER TABLE inventario_movimiento
ADD CONSTRAINT ck_movimiento_cantidad
CHECK (cantidad_movimiento > 0);

ALTER TABLE inventario_movimiento
ADD CONSTRAINT ck_movimiento_tipo
CHECK (tipo_movimiento IN ('Entrada', 'Salida'));

COMMIT;