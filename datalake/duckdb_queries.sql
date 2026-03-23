-- Q1: List all customers with total number of orders

SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders
FROM read_csv_auto('datasets/customers.csv') c
LEFT JOIN read_json_auto('datasets/orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_orders DESC;



-- Q2: Top 3 customers by total order value

SELECT
    c.name,
    SUM(o.total_amount) AS total_spent
FROM read_csv_auto('datasets/customers.csv') c
JOIN read_json_auto('datasets/orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 3;



-- Q3: Customers from Bangalore and their order IDs

SELECT
    c.name,
    o.order_id,
    o.total_amount
FROM read_csv_auto('datasets/customers.csv') c
JOIN read_json_auto('datasets/orders.json') o
ON c.customer_id = o.customer_id
WHERE c.city = 'Bangalore';



-- Q4: Join view — customer name, order date, total amount, items count

SELECT
    c.name,
    o.order_date,
    o.total_amount,
    o.num_items
FROM read_csv_auto('datasets/customers.csv') c
JOIN read_json_auto('datasets/orders.json') o
ON c.customer_id = o.customer_id
ORDER BY o.order_date;
