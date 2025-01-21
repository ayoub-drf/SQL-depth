
CREATE DATABASE IF NOT EXISTS bookDB;

USE bookDB;

CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE
);

--PRIMARY KEY == NOT NULL and UNIQUE
CREATE TABLE Product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    category_id INT DEFAULT NULL,
    title VARCHAR(120) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(10) DEFAULT 'active',
    FOREIGN KEY (category_id) REFERENCES Category(id) ON DELETE SET DEFAULT,
    INDEX (title),
    ChECK (price > 0)
);

CREATE TABLE Category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
)


CREATE TABLE t1 (
    id INT UNIQUE, 
    first_name VARCHAR(20)
);

DESC t1;

INSERT INTO t1 VALUES (1, 'dexter'), (2, 'maria'), (3, 'john');

TABLE t1;

CREATE TABLE t2 (
    id INT, 
    first_name VARCHAR(20),
    UNIQUE (id)
);

CREATE TABLE t3 (
    id INT, 
    first_name VARCHAR(20),
    CONSTRAINT id_unique UNIQUE (id)
);


CREATE TABLE t4 (
    id INT AUTO_INCREMENT, 
    first_name VARCHAR(20),
    CONSTRAINT id_unique UNIQUE (id)
);

DESC t4;

INSERT INTO t4 (first_name) VALUES ('james');

SHOW VARIABLES;

SHOW VARIABLES LIKE 'auto_increment%';

CREATE TABLE t5 (
    id INT AUTO_INCREMENT UNIQUE,
    status VARCHAR(10),
    CHECK (LOWER(status) IN ('yes', 'no'))
);

INSERT INTO t5 (status) VALUES ("no");

SELECT * FROM t5;