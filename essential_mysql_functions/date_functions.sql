USE sql_store;

SELECT * 
FROM orders
WHERE YEAR(order_date) = YEAR(NOW()) - 2

-- SELECT NOW()
-- SELECT  YEAR(NOW()) - 2