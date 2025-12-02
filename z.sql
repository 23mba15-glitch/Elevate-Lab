-- WHERE filters rows before grouping
SELECT * FROM orders
WHERE order_amount > 500;

-- HAVING filters after grouping
SELECT customer_id, SUM(order_amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING total_spent > 5000;

SELECT o.order_id, c.customer_name, o.order_amount
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;
SELECT 
    SUM(order_amount) / COUNT(DISTINCT customer_id) AS ARPU
FROM orders;
SELECT customer_id, customer_name
FROM customers

CREATE INDEX idx_orders_customer ON orders(customer_id);

CREATE VIEW customer_sales AS
SELECT c.customer_id, c.customer_name, SUM(o.order_amount) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

SELECT 
    customer_id,
    COALESCE(discount, 0) AS discount_applied
FROM orders;


