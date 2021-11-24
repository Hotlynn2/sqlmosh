USE sql_store;

select 
	p.product_id,
    p.name,
    COUNT(*) AS orders,
    if(COUNT(*) > 1, 'Many times', 'Once') AS frequency
from
	products p 
join order_items o
on p.product_id = o.product_id
GROUP BY p.product_id, p.name

    