-- Formatear la salida para una mejor visualización
.headers ON
.mode column

.print '*******************************************'
.print '********** Subconsultas en WHERE **********'
.print '*******************************************'
.print ''

.print '----------------------------------------------------------'
.print '--- Clientes que han comprado productos de Electrónica ---'
.print '----------------------------------------------------------'
SELECT DISTINCT c.nombre, c.email
FROM clientes c
WHERE c.id IN (
    SELECT DISTINCT p.cliente_id
    FROM pedidos p
    JOIN detalle_pedidos dp ON p.id = dp.pedido_id
    JOIN productos prod ON dp.producto_id = prod.id
    JOIN categorias cat ON prod.categoria_id = cat.id
    WHERE cat.nombre = 'Electrónica'
);
.print ''

.print '--------------------------------------------------------------------'
.print '--- Productos con precio por encima del promedio de su categoría ---'
.print '--------------------------------------------------------------------'
SELECT p.nombre, p.precio, cat.nombre as categoria
FROM productos p
JOIN categorias cat ON p.categoria_id = cat.id
WHERE p.precio > (
    SELECT AVG(p2.precio)
    FROM productos p2
    WHERE p2.categoria_id = p.categoria_id
);
.print ''

.print '**************************************************'
.print '********** Subconsultas correlacionadas **********'
.print '**************************************************'
.print ''

.print '---------------------------------------------------------'
.print '--- Para cada cliente, mostrar su pedido más reciente ---'
.print '---------------------------------------------------------'
-- Para cada cliente, mostrar su pedido más reciente
SELECT c.nombre, p.fecha_pedido, p.total
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id
WHERE p.fecha_pedido = (
    SELECT MAX(p2.fecha_pedido)
    FROM pedidos p2
    WHERE p2.cliente_id = c.id
);
.print ''

.print '***********************************'
.print '********** Uso de EXISTS **********'
.print '***********************************'
.print ''

.print '--------------------------------------------------------------'
.print '--- Clientes que tienen pedidos con productos caros (>200) ---'
.print '--------------------------------------------------------------'
SELECT c.nombre, c.ciudad
FROM clientes c
WHERE EXISTS (
    SELECT 1
    FROM pedidos p
    JOIN detalle_pedidos dp ON p.id = dp.pedido_id
    WHERE p.cliente_id = c.id
    AND dp.precio_unitario > 200
);
