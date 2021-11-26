CREATE FUNCTION RISKFACTOR(
	client_id INT
)
RETURNS INTEGER
READS SQL DATA

BEGIN
	DECLARE risk_factor DECIMAL(9,2) DEFAULT 0;
    DECLARE invoices_total DECIMAL(9,2);
    DECLARE invoices_count INT;
    
    SELECT COUNT(*), SUM(invoices_total)
    INTO invoices_count, invoices_total
    FROM invoices
    
    SET risk_factor = invoices_total / invoices_count * 5;
    
	
    RETURN risk_factor;
END
