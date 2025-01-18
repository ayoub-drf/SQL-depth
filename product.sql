CREATE TABLE product (
    pk INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

INSERT INTO product (name, price, stock) VALUES
("Laptop", 1999.99, 100),
("Watch", 19.19, 10),
("Keyboard", 1999.99, 30),
("phone", 999.99, 400);

SELECT * FROM product WHERE pk < 3 and stock >= 10;

UPDATE product SET name = "Smart Watch" WHERE pk = 2;

UPDATE product SET name = "Smart Watch V2", price = 277.21 WHERE pk = 2;

UPDATE product SET stock = stock - 5 WHERE stock IN (100, 400);

DELETE FROM product WHERE name = "phone";

SELECT * FROM product WHERE name LIKE "%2";

SELECT * FROM product WHERE name LIKE "%t%";

SELECT * FROM product ORDER BY name DESC;

ALTER TABLE product ADD COLUMN created TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE product ADD COLUMN description VARCHAR(200);

ALTER TABLE product MODIFY COLUMN description TEXT;

ALTER TABLE product CHANGE COLUMN description bio VARCHAR(200);

UPDATE product set bio = 'The Best Laptop Ever' WHERE pk = 1;

ALTER TABLE product ADD COLUMN img BLOB;

ALTER TABLE product DROP COLUMN img;

DESCRIBE product;


SELECT * FROM product;