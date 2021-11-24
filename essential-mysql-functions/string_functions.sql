/*SELECT LENGTH('Hotspot') AS length,
		LOWER('Hotspot') AS lower_case,
        UPPER('Hotspot') AS upper_case,
        LTRIM('   Hotspot') AS left_trim,
        RTRIM('Hotspot   ') AS right_trim,
        TRIM('   Hotspot   ') AS lead_lag_spaces,
        LEFT('Hotspot', 3) AS first_letters_left,
        RIGHT('Hotspot', 4) AS last_letters_right,
        SUBSTRING('Hotspot', 4) AS substring1,
        SUBSTRING('Hotspot', 3, 6) AS substring2,
        LOCATE('t', 'Hotspot') AS locate,
        REPLACE('Hotspot', 'Hot', 'Fire') AS replace_string,
        CONCAT('Hot', ' spot') AS concat*/
        
USE sql_store;

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM customers

-- https://dev.mysql.com/doc/refman/8.0/en/string-functions.html
-- link to all mysql string functions
        
