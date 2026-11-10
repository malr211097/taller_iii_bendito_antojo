BEGIN;

ALTER TABLE producto
ADD CONSTRAINT uq_producto_id_referencia
UNIQUE (id_referencia);

ALTER TABLE inventario
ADD CONSTRAINT uq_inventario_id_referencia
UNIQUE (id_referencia);

COMMIT;