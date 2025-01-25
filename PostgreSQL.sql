CREATE TABLE "User" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(60) UNIQUE NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "User" (username, email) VALUES
('john_doe', 'john@example.com'),
('jane_smith', 'jane@example.com'),
('alice_wonder', 'alice@example.com');


CREATE TABLE "Customer" (
    id SERIAL PRIMARY KEY,
    bio TEXT NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INT UNIQUE NOT NULL REFERENCES "User"(id) ON DELETE CASCADE
);
INSERT INTO "Customer" (bio, user_id) VALUES
('Tech enthusiast and blogger', 1),
('Fitness expert and trainer', 2),
('Fashion designer and influencer', 3);


CREATE TABLE "Category" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "Category" (name) VALUES 
('Electronics'),
('Books'),
('Clothing');


CREATE TABLE "Product" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    category_id INT NOT NULL REFERENCES "Category"(id) ON DELETE CASCADE
);
INSERT INTO "Product" (name, description, price, stock, category_id) VALUES 
('Smartphone', 'Latest model with advanced features', 699.99, 50, 1),
('Laptop', 'Powerful gaming laptop', 1299.99, 20, 1),
('Python Programming Book', 'Learn Python from scratch', 39.99, 100, 2),
('T-shirt', 'Cotton t-shirt with logo', 19.99, 200, 3);


ALTER TABLE "Product"
ALTER COLUMN category_id DROP NOT NULL;

UPDATE "Product" SET category_id = NULL WHERE id = 1;

SELECT * FROM "Product" WHERE id = 1;

SELECT "User".id, "User".username, "Customer".bio, "Customer".user_id
FROM "User" INNER JOIN "Customer" ON "User".id = "Customer".user_id;

SELECT "Product".category_id, "Product".name, "Category".id AS "category", "Category".name
FROM "Product" LEFT JOIN "Category" ON "Product".category_id = "Category".id;


SELECT "Product".category_id, "Product".name, "Category".id AS "category", "Category".name
FROM "Product" RIGHT JOIN "Category" ON "Product".category_id = "Category".id;



SELECT version();

SHOW server_version;

SHOW data_directory;

create database testdb;

select current_database();


SELECT * FROM "User";

