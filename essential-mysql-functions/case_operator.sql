SELECT 
	CONCAT(first_name, ' ', last_name) AS customer,
    points,
    CASE
		WHEN points > 3000 THEN 'Gold'
        WHEN points >= 2000 AND points <= 3000 THEN 'Silver'
        WHEN points < 2000 THEN 'Bronze'
	END AS category
FROM customers
ORDER BY points DESC, category