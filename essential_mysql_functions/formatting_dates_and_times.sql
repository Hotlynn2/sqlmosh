SELECT TIME(now()) AS updated_time, DATE(NOW()) AS updated_date, 
DATE_FORMAT(NOW(), '%M-%D-%Y') as format_date, TIME_FORMAT(NOW(), '%H,%i,%s')