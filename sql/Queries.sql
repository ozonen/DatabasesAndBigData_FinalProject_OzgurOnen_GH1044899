USE ecommerce_db;

SELECT p.product_id, p.name, c.name AS category, p.price, p.stock_qty
FROM products p
JOIN categories c ON p.category_id = c.category_id
ORDER BY c.name, p.name;

SELECT o.order_id,
       CONCAT(c.first_name, ' ', c.last_name) AS customer,
       o.status,
       o.total_amount,
       o.created_at
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

SELECT cat.name AS category,
       COUNT(DISTINCT o.order_id)        AS total_orders,
       SUM(oi.quantity * oi.unit_price)  AS revenue
FROM order_items oi
JOIN products   p   ON oi.product_id = p.product_id
JOIN categories cat ON p.category_id = cat.category_id
JOIN orders     o   ON oi.order_id   = o.order_id
JOIN payments   pay ON o.order_id    = pay.order_id
WHERE pay.status = 'completed'
GROUP BY cat.name
ORDER BY revenue DESC;

SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer,
       COUNT(o.order_id)   AS orders_placed,
       SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status != 'cancelled'
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;

SELECT p.name,
       ROUND(AVG(r.rating), 2) AS avg_rating,
       COUNT(r.review_id)      AS review_count
FROM products p
LEFT JOIN reviews r ON p.product_id = r.product_id
GROUP BY p.product_id, p.name
ORDER BY avg_rating DESC;

SELECT name, stock_qty
FROM products
WHERE stock_qty < 50
ORDER BY stock_qty ASC;

SELECT DATE_FORMAT(paid_at, '%Y-%m') AS month,
       SUM(amount)                   AS monthly_revenue
FROM payments
WHERE status = 'completed'
GROUP BY month
ORDER BY month;

UPDATE orders SET status = 'delivered' WHERE order_id = 3;
UPDATE payments SET status = 'completed', paid_at = CURRENT_TIMESTAMP
WHERE order_id = 3;

UPDATE products SET stock_qty = stock_qty - 1 WHERE product_id = 1;

DELETE FROM orders WHERE order_id = 5 AND status = 'cancelled';
