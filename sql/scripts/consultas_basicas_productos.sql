-- Formatear la salida para una mejor visualización
.headers ON
.mode column

-- Seleccionar productos con precio > 100
.print '========================================'
.print '=== Productos con precio mayor a 100 ==='
.print '========================================'
SELECT nombre, precio FROM productos WHERE precio > 100;
.print ''

-- Productos de categoría 'Electrónica' ordenados por precio descendente
.print '==========================================================================='
.print '=== Productos de categoría Electrónica ordenados por precio descendente ==='
.print '==========================================================================='
SELECT nombre, precio, categoria FROM productos
WHERE categoria = 'Electrónica'
ORDER BY precio DESC;
.print ''

-- Productos con stock entre 10 y 40, ordenados por stock ascendente
.print '========================================================================'
.print '=== Productos con stock entre 10 y 40 ordenados por stock ascendente ==='
.print '========================================================================'
SELECT nombre, stock, precio FROM productos
WHERE stock BETWEEN 10 AND 40
ORDER BY stock ASC;
.print ''

-- Nombres que contienen 'a' ordenados alfabéticamente
.print '=========================================================================='
.print '=== Productos que contienen "a" en el nombre ordenados alfabéticamente ==='
.print '=========================================================================='
SELECT nombre, precio FROM productos
WHERE nombre LIKE '%a%'
ORDER BY nombre ASC;
