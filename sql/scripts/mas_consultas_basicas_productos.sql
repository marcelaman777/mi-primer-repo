-- Formatear la salida para una mejor visualización
.headers ON
.mode column

.print '=============================================================================================================='
.print '=== Productos en Audio o Electrónica con stock >= 10 ordenados por categoría ascendente, stock descendente ==='
.print '=============================================================================================================='
SELECT categoria, nombre, stock 
FROM productos 
WHERE categoria IN ('Audio', 'Electrónica')
AND stock >= 10	
ORDER BY categoria ASC, stock DESC;
.print ''

.print '===================================================================================================='
.print '=== Productos con stock * precio >= 1500 ordenados por categoria ascendente y precio descendente ==='
.print '===================================================================================================='
SELECT categoria, nombre, precio, stock, precio * stock as valor_stock 
FROM productos
WHERE precio * stock >= 1500 
ORDER BY categoria ASC, precio DESC;
.print ''

.print '=============================================================================================================================================='
.print '=== Productos con LENGTH(nombre) * LENGTH(categoria) entre 120 y 180 ordenados por LENGTH(nombre) * LENGTH(categoria) y nombre ascendentes ==='
.print '=============================================================================================================================================='
SELECT nombre, LENGTH(nombre) as largo_nombre, categoria, LENGTH(categoria) as largo_categoria, LENGTH(nombre) * LENGTH(categoria) as producto_largo
FROM productos
WHERE LENGTH(nombre) * LENGTH(categoria) BETWEEN 120 AND 180
ORDER BY producto_largo ASC, nombre ASC;
.print ''

.print '========================================================================================================================'
.print '=== Productos que contienen "la" en el nombre o "d" en la categoria ordenados alfabéticamente por categoria y nombre ==='
.print '========================================================================================================================'
SELECT nombre, categoria 
FROM productos
WHERE nombre LIKE '%la%'
OR categoria LIKE '%d%'
ORDER BY categoria ASC, nombre ASC;
