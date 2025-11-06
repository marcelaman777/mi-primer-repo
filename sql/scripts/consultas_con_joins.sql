-- Formatear la salida para una mejor visualización
.headers ON
.mode column

-- INNER JOIN: Solo clientes con pedidos
.print '============================================='
.print '=== INNER JOIN: Solo clientes con pedidos ==='
.print '============================================='
SELECT c.nombre, p.fecha_pedido, p.total
FROM clientes c
INNER JOIN pedidos p ON c.id = p.cliente_id;
.print ''

-- LEFT JOIN: Todos los clientes, con pedidos si existen
.print '============================================================='
.print '=== LEFT JOIN: Todos los clientes, con pedidos si existen ==='
.print '============================================================='
SELECT c.nombre, COUNT(p.id) as num_pedidos, SUM(p.total) as total_compras
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.id, c.nombre;
.print ''

-- Clientes de Madrid con sus pedidos
.print '=========================================='
.print '=== Clientes de Madrid con sus pedidos ==='
.print '=========================================='
SELECT c.nombre, c.ciudad, p.fecha_pedido, p.total
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id
WHERE c.ciudad = 'Madrid';