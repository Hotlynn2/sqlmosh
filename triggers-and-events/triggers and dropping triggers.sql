DELIMITER $$

DROP TRIGGER IF EXISTS payment_after_insert;

CREATE TRIGGER  payment_after_insert
	AFTER INSERT ON payments
	FOR EACH ROW
    
BEGIN
	UPDATE invoices i
    SET payment_total = payment_total + NEW.amount
    WHERE inovice_id = new.invoice_id;
END $$

