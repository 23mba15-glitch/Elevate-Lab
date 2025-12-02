CREATE TABLE online_sales (
    order_id INT,
    order_date DATE,
    amount NUMERIC(10,2),
    product_id INT
);

EXTRACT(MONTH FROM order_date)
EXTRACT(YEAR FROM order_date)

SELECT
    EXTRACT(YEAR FROM order_date) AS YEAR,
    EXTRACT(MONTH FROM order_date) AS MONTH,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM
    online_sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    YEAR,
    MONTH;

SELECT
    EXTRACT(YEAR FROM order_date) AS YEAR,
    EXTRACT(MONTH FROM order_date) AS MONTH,
    SUM(amount) AS monthly_revenue
FROM online_sales
GROUP BY YEAR, MONTH
ORDER BY monthly_revenue DESC
LIMIT 3;

CREATE TABLE monthly_sales_summary AS
SELECT
    EXTRACT(YEAR FROM order_date) AS YEAR,
    EXTRACT(MONTH FROM order_date) AS MONTH,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
GROUP BY YEAR, MONTH
ORDER BY YEAR, MONTH;
