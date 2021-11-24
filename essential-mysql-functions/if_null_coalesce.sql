USE sql_store;

SELECT 
CONCAT(first_name, ' ', last_name) AS customer,
IFNULL(phone, 'Unkwown') AS phone
-- COALESCE(phone, state, 'Unknown')
FROM customers

