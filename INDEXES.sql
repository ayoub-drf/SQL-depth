/*
-- auto create index for these constraints
-- unique 
-- primary key
-- foreign key
*/

USE testdb;

CREATE TABLE User (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100),
    full_name VARCHAR(150),
    INDEX (full_name),
    UNIQUE (username)
);

CREATE TABLE Post (
    id INT AUTO_INCREMENT,
    title VARCHAR(100),
    user_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES User(id) ON DELETE CASCADE
);

CREATE INDEX idx_title ON Post(title);

INSERT INTO `User` (username, full_name)
VALUES ("dexter", "Dexter Booz"), ("maria", "Maria Booz"); 

INSERT INTO `Post` (title, user_id)
VALUES ("How to learn SQL", 1), ("What is Clustered indexes", 2), ("Nonclustered indexes", 1);

-- UPDATE Post SET title = "Clustered indexes" WHERE user_id = 2 AND id = 2; 

EXPLAIN SELECT * FROM `User` WHERE username LIKE "dexter";

EXPLAIN SELECT * FROM `User` WHERE bio = "SIMPLE";

ALTER TABLE `User` ADD COLUMN bio VARCHAR(100);
UPDATE `User` SET bio = "SIMPLE";

DROP INDEX idx_title ON Post;

