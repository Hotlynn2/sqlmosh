START TRANSACTION;

INSERT INTO orders (customer_id, order_date, status)
VALUES (11, '2019-07-21', 2);

INSERT INTO order_items
VALUES (last_insert_id(), 8, 4, 5.25);

COMMIT;