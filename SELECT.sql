SELECT 11 + 1;

SELECT 'Iam, SQL';

SELECT 'Iam, "SQL"' AS def;

SELECT "The", "Best", 1E6;

SELECT "CWD: \n /home/x/Desktop/SQL-depth";

SELECT 100 % 2;

SELECT 10 / 5;

SELECT 10 - 5;

SELECT 10 * 5;

SELECT 10 = 10;

SELECT 10 != 10;

SELECT 10 <> 10;

SELECT "Hello" = "hello";

SELECT "Hello" = "Hi";

SELECT "Hello" LIKE "%ll%";

SELECT "Hello" LIKE "hello";

SELECT "Hello" LIKE "h_l__";

SELECT 'a' = 'ä';

SELECT 'a' LIKE 'ä';

SELECT 'a' =  'ä' COLLATE utf8mb4_german2_ci;

SELECT 'a' LIKE 'ä' COLLATE utf8mb4_german2_ci;

SELECT 'a' = 'ä' COLLATE utf8mb4_bin;

SELECT 'a' = 'A' COLLATE utf8mb4_bin;

SELECT BINARY 'a' = 'A';

SELECT ABS(-5);

SELECT ASCII('a'), ASCII('ä');

SELECT CHAR(57);

SELECT CHAR(ASCII('d'));

SELECT ADDDATE('2024-12-08', 2); -- Add two days

SELECT
    DAY('2024-12-08'),
    DAYNAME("2025-01-17"),
    MONTH("2025-01-17"),
    MONTHNAME("2025-01-17");

SELECT
    CURDATE(),
    CURRENT_DATE(),
    CURTIME(),
    CURRENT_TIME(),
    CURRENT_TIMESTAMP(),
    CURRENT_USER();

SELECT CONCAT("I am " "a " "python ", "developer");

SELECT CONCAT_WS(" | ", "Linux", "is", "the", "best");

SELECT LENGTH("Dexter");

SELECT LENGTH(CONCAT_WS(" | ", "Linux", "is", "the", "best"));

SELECT LOWER("DEXTER");

SELECT UPPER("dexter");

SELECT LEFT('Hello sir', 5); -- left split

SELECT RIGHT('Hello sir', 3); -- right split

SELECT SUBSTR('Hello sir How are you doing', 7, 3); -- slicing(index, count)

SELECT TRIM('  Hello   ');

SELECT TRIM(LEADING 'a' FROM 'aabcdaa'); -- remove a from left

SELECT TRIM(TRAILING 'a' FROM 'aabcdaa'); -- remove a from right

SELECT TRIM(BOTH 'a' FROM 'aabcdaa');

SELECT TRUE, FALSE;

SELECT 'd' IN ('a' , 'b', 'c', 'd', 'e');

SELECT 'x' NOT IN ('a' , 'b', 'c', 'd', 'e');

SELECT INSTR("abcdefg", "a");

SELECT INSTR("abcdefg", "a") IS TRUE;

SELECT 
    ISNULL(NULL),
    ISNULL(1/0),
    ISNULL('');

SELECT 3 between 2 AND 8; -- Is 3 in range(2, 8)

SELECT IF(1 > 18, "YES", "NO");

SET @name = "Dexter";
SET @email := "dexter@aol.it"; -- := preferred

SELECT CONCAT_WS(" ", "Hi my name is", @name, "and my email is", @email);

SELECT @var1 = 1; -- Null

SELECT @var2 := 2; -- := create a new variable and assign a value to it and print it

SELECT actor_id FROM sakila.actor LIMIT 10;

SELECT COUNT(actor_id) FROM sakila.actor;

SELECT DISTINCT first_name FROM sakila.actor ORDER BY first_name;

USE sakila;

SELECT CURRENT_DATE, first_name FROM actor;

SELECT CONCAT_WS(' ', first_name, last_name) AS full_name FROM actor;

SELECT actor_id FROM actor ORDER BY actor_id LIMIT 2;

SELECT actor_id FROM actor ORDER BY actor_id LIMIT 99, 3;

(SELECT actor_id FROM actor ORDER BY actor_id LIMIT 2) UNION
(SELECT actor_id FROM actor ORDER BY actor_id LIMIT 99, 2);

-- TABLE actor;


SELECT * FROM film_text WHERE film_id BETWEEN 7 and 10;

SELECT * FROM film_text WHERE film_id <= 2;

SELECT * FROM film_text WHERE LENGTH(title) > 26;

SELECT * FROM film_text WHERE LOWER(title) LIKE 'ac%';

SELECT * FROM film_text WHERE LOWER(title) LIKE 'br%' and LOWER(description) LIKE "a b%";


SELECT * FROM film_text WHERE LOCATE("beautiful", description);


PREPARE sql_statement_1 FROM 'SELECT CONCAT_WS(" ", first_name, last_name) AS full_name FROM actor WHERE first_name LIKE ? OR last_name LIKE ?';

SET @first_name := 'ed', @last_name := "DAV%";
EXECUTE sql_statement_1 USING @first_name, @last_name;

DROP PREPARE sql_statement_1;