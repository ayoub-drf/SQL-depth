use my_database;

SELECT * FROM `User`;

-- Get only tables that match both.
SELECT `User`.username, `Book`.name FROM `User`
INNER JOIN `Book` ON `User`.user_id = `Book`.user_id;

-- Get only tables that match both.
SELECT `User`.username, `Book`.name FROM `User`
INNER JOIN `Book` USING (user_id);

-- Get all tables from left and match them with right and if there is no match, put Null
SELECT `User`.username, `Book`.name FROM `User`
LEFT JOIN `Book` USING (user_id);

-- Get all tables from the right and match them with left and If there is no match, put Null
SELECT `User`.username, `Book`.name FROM `User`
RIGHT JOIN `Book` USING (user_id);

-- FULL OUTER
SELECT `User`.username, `Book`.name FROM `User`
LEFT JOIN `Book` USING (user_id)
UNION
SELECT `User`.username, `Book`.name FROM `User`
RIGHT JOIN `Book` USING (user_id);


SELECT * from `User` LEFT JOIN `Profile` ON `User`.user_id = `Profile`.user_id
LEFT JOIN `Book` ON `User`.user_id = `Book`.user_id
UNION
SELECT * from `User` RIGHT JOIN `Profile` ON `User`.user_id = `Profile`.user_id
RIGHT JOIN `Book` ON `User`.user_id = `Book`.user_id;


SELECT `User`.username, COUNT(`Book`.name) as User_Books
from `User` 
LEFT JOIN `Book` ON `User`.user_id = `Book`.user_id
GROUP BY `User`.user_id;

SELECT User.user_id, User.username, `Book`.name, `Book`.user_id FROM `User` CROSS JOIN `Book`;


use sakila;

SELECT cy.category_id, cy.name, fm_cy.film_id FROM category AS cy
INNER JOIN film_category AS fm_cy
ON fm_cy.category_id  = cy.category_id;

SELECT cy.category_id, cy.name, fm_cy.film_id FROM category AS cy
INNER JOIN film_category AS fm_cy
USING (category_id);
