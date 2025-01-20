use my_database;


CREATE VIEW UserBooks AS SELECT `User`.username, `Book`.name FROM `User`
LEFT JOIN `Book` USING (user_id);
SELECT * FROM UserBooks;

CREATE OR REPLACE VIEW UserBooks AS SELECT `User`.username, COUNT(`Book`.name) AS Books_count FROM `User`
LEFT JOIN `Book` USING (user_id) GROUP BY user_id;




