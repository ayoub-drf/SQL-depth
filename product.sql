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


USE my_database;

CREATE TABLE User (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL
);
INSERT INTO `User` (username) VALUES ("James"), ("Dexter"), ("Maria"), ("Sara");
SELECT * FROM `User`;


CREATE TABLE Profile (
    profile_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNIQUE,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);
INSERT INTO `Profile` (user_id) VALUES (1), (2), (3), (4);
SELECT * FROM `Profile`;

CREATE TABLE Book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    name VARCHAR(100) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);
ALTER TABLE `Book` MODIFY COLUMN user_id INT NULL;

INSERT INTO `Book` (user_id, name) VALUES (1, "Book 1"), (2,  "Book 2"), (3,  "Book 3"), (4,  "Book 4");
SELECT * FROM `Book`;


CREATE TABLE Author (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);
INSERT INTO `Author` (name) VALUES ("Alex"), ("Victor"), ("Kristina"), ("Suzan");
SELECT * FROM `Author`;

CREATE TABLE Book_Authors (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
);
INSERT INTO `Book_Authors` (book_id, author_id) VALUES (1, 2), (1, 3), (1, 4);
SELECT * FROM `Book_Authors`;


