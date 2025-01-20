CREATE DATABASE IF NOT EXISTS testdb;

-- create table
USE testdb;

CREATE TABLE t1 (id INT, first_name VARCHAR(20));

SHOW COLUMNS FROM t1;

DESC t1;

INSERT INTO t1 VALUES (2, 'James'), (3, 'john');

CREATE TABLE t2 LIKE t1;

INSERT INTO t2 SELECT * FROM t1;

INSERT INTO t2 (first_name, id) VALUES ('Hany', '11');

INSERT INTO t2 SET id = 100, first_name = "dexter";

INSERT INTO t2 (id, first_name) VALUES ROW(101, "Maria"), ROW(102, "James");


SELECT * from t2 ORDER BY id DESC;
