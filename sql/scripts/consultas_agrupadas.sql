-- Formatear la salida para una mejor visualización
.headers ON
.mode column

-- Consultas de agregación básica
.print '==================================='
.print '=== Ventas totales por producto ==='
.print '==================================='
SELECT producto_id, SUM(cantidad) as total_vendido, SUM(cantidad * precio_unitario) as ingresos_totales
FROM detalle_pedidos
GROUP BY producto_id;
.print ''

.print '==============================='
.print '=== Estadísticas por pedido ==='
.print '==============================='
SELECT pedido_id, COUNT(*) as items_diferentes, SUM(cantidad) as cantidad_total, AVG(precio_unitario) as precio_promedio
FROM detalle_pedidos
GROUP BY pedido_id;
.print ''

-- Consultas con HAVING
.print '==================================================='
.print '=== Productos con más de 1 unidad vendida total ==='
.print '==================================================='
SELECT producto_id, SUM(cantidad) as total_vendido
FROM detalle_pedidos
GROUP BY producto_id
HAVING SUM(cantidad) > 1;
.print ''

.print '====================================='
.print '=== Pedidos con valor total > 150 ==='
.print '====================================='
SELECT pedido_id, SUM(cantidad * precio_unitario) as valor_total
FROM detalle_pedidos
GROUP BY pedido_id
HAVING SUM(cantidad * precio_unitario) > 150;
.print ''

-- Análisis combinado con joins
.print '================================================'
.print '=== Ventas por ciudad usando JOIN + GROUP BY (CONSULTA CON ERROR) ==='
.print '================================================'
SELECT c.ciudad, COUNT(p.id) as num_pedidos, SUM(dp.cantidad * dp.precio_unitario) as ingresos_ciudad
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id
LEFT JOIN detalle_pedidos dp ON p.id = dp.pedido_id
GROUP BY c.ciudad
HAVING SUM(dp.cantidad * dp.precio_unitario) > 0;
.print ''

.print '===================================================================='
.print '=== Ventas por ciudad usando JOIN + GROUP BY (CONSULTA CORRECTA) ==='
.print '===================================================================='
SELECT c.ciudad, COUNT(DISTINCT p.id) as num_pedidos, SUM(dp.cantidad * dp.precio_unitario) as ingresos_ciudad
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id
LEFT JOIN detalle_pedidos dp ON p.id = dp.pedido_id
GROUP BY c.ciudad
HAVING SUM(dp.cantidad * dp.precio_unitario) > 0;
.print ''

.print '=============================================='
.print '=== DISCREPANCIA EN VALOR TOTAL DEL PEDIDO ==='
.print '=============================================='
SELECT p.id as id_pedido, p.total as total_segun_pedidos, SUM(dp.cantidad * dp.precio_unitario) as total_segun_detalle_pedidos
FROM pedidos p
INNER JOIN detalle_pedidos dp ON dp.pedido_id = p.id
GROUP BY id_pedido;
