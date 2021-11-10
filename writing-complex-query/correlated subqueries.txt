USE sql_invoicing;

SELECT client_id 
FROM invoices i
WHERE invoice_total > (SELECT
						AVG(invoice_total) FROM
                        invoices 
                        WHERE invoices.client_id = i.client_id
                        )