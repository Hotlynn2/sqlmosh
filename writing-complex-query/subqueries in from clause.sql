USE sql_invoicing;

SELECT *
FROM (SELECT client_id,
		name ,
        (SELECT invoice_total 
        FROM invoices
		WHERE client_id = c.client_id) AS total_sales,
        (SELECT AVG(invoice_total) FROM invoices) AS average
		FROM clients c) AS Summary_sales
WHERE total_sales IS NOT NULL