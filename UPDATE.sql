UPDATE t2 SET first_name = 'Dexter' WHERE id = 2;

UPDATE t2 SET first_name = 'James UP' WHERE first_name = "James" LIMIT 2;

UPDATE t2 SET first_name = 'James' WHERE first_name = 'James UP' ORDER BY id DESC LIMIT 2;

SELECT * FROM t2 WHERE first_name LIKE "Jame%";
