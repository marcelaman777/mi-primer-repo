-- Tabla de categorías
CREATE TABLE categorias (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    descripcion TEXT
);

-- Agregar categoría a productos
ALTER TABLE productos ADD COLUMN categoria_id INTEGER REFERENCES categorias(id);

INSERT INTO categorias VALUES
(1, 'Electrónica', 'Productos electrónicos y tecnología'),
(2, 'Accesorios', 'Accesorios para computadoras'),
(3, 'Audio', 'Productos de audio y sonido');

UPDATE productos SET categoria_id = 1 WHERE nombre LIKE '%Laptop%' OR nombre LIKE '%Monitor%';
UPDATE productos SET categoria_id = 2 WHERE nombre LIKE '%Mouse%' OR nombre LIKE '%Teclado%';
UPDATE productos SET categoria_id = 3 WHERE nombre LIKE '%Audífonos%';
