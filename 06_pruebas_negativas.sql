BEGIN;

-- Prueba negativa 1:
-- Intentar registrar una referencia con precio negativo.
INSERT INTO referencia_producto (
  id_referencia,
  genero,
  tipo_conjunto,
  tipo_tela,
  talla,
  diseno,
  precio
)
VALUES (
  910001,
  'Mujer',
  'Short',
  'Algodon',
  'M',
  'Prueba precio negativo',
  -50000.00
);

BEGIN;

-- Prueba negativa 2:
-- Intentar asociar la misma referencia a un segundo producto.
INSERT INTO producto (
  id_producto,
  id_referencia,
  nombre_producto,
  fecha_registro
)
VALUES (
  910002,
  900001,
  'Segundo producto misma referencia',
  '2026-11-09'
);

BEGIN;

-- Prueba negativa 3:
-- Intentar registrar una cantidad negativa en inventario.
INSERT INTO inventario (
  id_inventario,
  id_referencia,
  cantidad
)
VALUES (
  910003,
  900001,
  -10
);