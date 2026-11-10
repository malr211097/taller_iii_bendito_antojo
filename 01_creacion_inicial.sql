BEGIN;

CREATE TABLE referencia_producto (
  id_referencia INTEGER PRIMARY KEY,
  genero VARCHAR(10) NOT NULL,
  tipo_conjunto VARCHAR(40) NOT NULL,
  tipo_tela VARCHAR(20) NOT NULL,
  talla VARCHAR(10) NOT NULL,
  diseno VARCHAR(100) NOT NULL,
  precio NUMERIC(12,2) NOT NULL
);

CREATE TABLE producto (
  id_producto INTEGER PRIMARY KEY,
  id_referencia INTEGER NOT NULL,
  nombre_producto VARCHAR(100) NOT NULL,
  fecha_registro DATE NOT NULL
);

CREATE TABLE materia_prima (
  id_materia_prima INTEGER PRIMARY KEY,
  nombre_materia_prima VARCHAR(100) NOT NULL,
  tipo_materia_prima VARCHAR(50) NOT NULL,
  unidad_medida VARCHAR(20) NOT NULL,
  estado VARCHAR(10) NOT NULL
);

CREATE TABLE proveedor (
  id_proveedor INTEGER PRIMARY KEY,
  nombre_proveedor VARCHAR(120) NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  correo_electronico VARCHAR(254) NOT NULL
);

CREATE TABLE ficha_tecnica (
  id_ficha INTEGER PRIMARY KEY,
  id_referencia INTEGER NOT NULL,
  vigente BOOLEAN NOT NULL
);

CREATE TABLE produccion (
  id_produccion INTEGER PRIMARY KEY,
  id_referencia INTEGER NOT NULL,
  id_ficha INTEGER NOT NULL,
  fecha_hora TIMESTAMP NOT NULL,
  cantidad_producida INTEGER NOT NULL
);

CREATE TABLE inventario (
  id_inventario INTEGER PRIMARY KEY,
  id_referencia INTEGER NOT NULL,
  cantidad INTEGER NOT NULL
);

CREATE TABLE stock_materia_prima (
  id_materia_prima INTEGER PRIMARY KEY,
  cantidad_disponible NUMERIC(12,2) NOT NULL,
  nivel_minimo NUMERIC(12,2) NOT NULL,
  fecha_actualizacion TIMESTAMP NOT NULL
);

CREATE TABLE cliente (
  id_cliente INTEGER PRIMARY KEY,
  nombre_completo VARCHAR(120) NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  correo_electronico VARCHAR(254) NOT NULL,
  direccion VARCHAR(200)
);

CREATE TABLE venta (
  id_venta INTEGER PRIMARY KEY,
  fecha_hora TIMESTAMP NOT NULL,
  id_cliente INTEGER,
  canal_venta VARCHAR(15) NOT NULL,
  medio_pago VARCHAR(30),
  estado_pago VARCHAR(15) NOT NULL,
  total_venta NUMERIC(12,2)
);

CREATE TABLE detalle_venta (
  id_venta INTEGER NOT NULL,
  id_producto INTEGER NOT NULL,
  cantidad_vendida INTEGER NOT NULL,
  precio_unitario_venta NUMERIC(12,2) NOT NULL,
  PRIMARY KEY (id_venta, id_producto)
);

CREATE TABLE detalle_ficha (
  id_ficha INTEGER NOT NULL,
  id_materia_prima INTEGER NOT NULL,
  consumo_por_unidad NUMERIC(12,2) NOT NULL,
  PRIMARY KEY (id_ficha, id_materia_prima)
);

CREATE TABLE proveedor_materia_prima (
  id_proveedor INTEGER NOT NULL,
  id_materia_prima INTEGER NOT NULL,
  PRIMARY KEY (id_proveedor, id_materia_prima)
);

CREATE TABLE inventario_movimiento (
  id_movimiento INTEGER PRIMARY KEY,
  id_inventario INTEGER NOT NULL,
  id_venta INTEGER,
  id_produccion INTEGER,
  tipo_movimiento VARCHAR(10) NOT NULL,
  cantidad_movimiento INTEGER NOT NULL
);

COMMIT;