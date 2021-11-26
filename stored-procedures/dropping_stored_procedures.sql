DROP PROCEDURE IF EXISTS get_invoices_with_balance;

DELIMITER $$
CREATE PROCEDURE get_invoices_with_balance()
BEGIN
SELECT *, invoice_total - payment_total AS balance
FROM invoices;
END $$

DELIMITER ;