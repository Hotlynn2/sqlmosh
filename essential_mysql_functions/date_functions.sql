USE sql_store;

SELECT * 
FROM orders
WHERE order_date > YEAR(NOW())

-- SELECT NOW()
