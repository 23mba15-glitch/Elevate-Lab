CREATE TABLE sales (
    product TEXT,
    quantity INTEGER,
    price REAL
);

INSERT INTO sales (product, quantity, price) VALUES
('Pen', 10, 5),
('Pen', 20, 5),
('Notebook', 15, 20),
('Notebook', 10, 20),
('Pencil', 30, 2);

SELECT 
    product,
    SUM(quantity) AS total_quantity,
    SUM(quantity * price) AS revenue
FROM sales
GROUP BY product;

SELECT 
    product, 
    SUM(quantity) AS total_qty,
    SUM(quantity * price) AS revenue
FROM sales
GROUP BY product;
