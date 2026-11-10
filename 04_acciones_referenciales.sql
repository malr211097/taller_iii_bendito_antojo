BEGIN;

ALTER TABLE producto
ADD CONSTRAINT fk_producto_referencia
FOREIGN KEY (id_referencia)
REFERENCES referencia_producto(id_referencia)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE ficha_tecnica
ADD CONSTRAINT fk_ficha_referencia
FOREIGN KEY (id_referencia)
REFERENCES referencia_producto(id_referencia)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE produccion
ADD CONSTRAINT fk_produccion_referencia
FOREIGN KEY (id_referencia)
REFERENCES referencia_producto(id_referencia)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE produccion
ADD CONSTRAINT fk_produccion_ficha
FOREIGN KEY (id_ficha)
REFERENCES ficha_tecnica(id_ficha)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE inventario
ADD CONSTRAINT fk_inventario_referencia
FOREIGN KEY (id_referencia)
REFERENCES referencia_producto(id_referencia)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE stock_materia_prima
ADD CONSTRAINT fk_stock_materia_prima
FOREIGN KEY (id_materia_prima)
REFERENCES materia_prima(id_materia_prima)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE venta
ADD CONSTRAINT fk_venta_cliente
FOREIGN KEY (id_cliente)
REFERENCES cliente(id_cliente)
ON UPDATE CASCADE
ON DELETE SET NULL;

ALTER TABLE detalle_venta
ADD CONSTRAINT fk_detalle_venta_venta
FOREIGN KEY (id_venta)
REFERENCES venta(id_venta)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE detalle_venta
ADD CONSTRAINT fk_detalle_venta_producto
FOREIGN KEY (id_producto)
REFERENCES producto(id_producto)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE detalle_ficha
ADD CONSTRAINT fk_detalle_ficha_ficha
FOREIGN KEY (id_ficha)
REFERENCES ficha_tecnica(id_ficha)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE detalle_ficha
ADD CONSTRAINT fk_detalle_ficha_materia_prima
FOREIGN KEY (id_materia_prima)
REFERENCES materia_prima(id_materia_prima)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE proveedor_materia_prima
ADD CONSTRAINT fk_proveedor_materia_proveedor
FOREIGN KEY (id_proveedor)
REFERENCES proveedor(id_proveedor)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE proveedor_materia_prima
ADD CONSTRAINT fk_proveedor_materia_prima
FOREIGN KEY (id_materia_prima)
REFERENCES materia_prima(id_materia_prima)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE inventario_movimiento
ADD CONSTRAINT fk_movimiento_inventario
FOREIGN KEY (id_inventario)
REFERENCES inventario(id_inventario)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE inventario_movimiento
ADD CONSTRAINT fk_movimiento_venta
FOREIGN KEY (id_venta)
REFERENCES venta(id_venta)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE inventario_movimiento
ADD CONSTRAINT fk_movimiento_produccion
FOREIGN KEY (id_produccion)
REFERENCES produccion(id_produccion)
ON UPDATE CASCADE
ON DELETE RESTRICT;

COMMIT;