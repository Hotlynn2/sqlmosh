USE sql_store;

-- solution1
/* SELECT * 
FROM products
WHERE product_id NOT IN (SELECT product_id
						FROM order_items
                        )
*/

-- solution2
SELECT * 
FROM products p
WHERE NOT EXISTS (SELECT product_id
					FROM order_items
                    WHERE product_id = p.product_id
                    )
					
 