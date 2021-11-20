USE sql_store;

SELECT 
CONCAT(first_name, ' ', last_name) AS customer,
IFNULL(phone, 'Unkwown')
-- COALESCE(phone, state, 'Unknown')
FROM customers

