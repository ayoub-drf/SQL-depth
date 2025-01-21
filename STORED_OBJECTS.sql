CREATE DATABASE storedOBJ;
USE storedOBJ;
CREATE TABLE User (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(120) NOT NULL,
    email VARCHAR(140) NOT NULL,
    status VARCHAR(10) NOT NULL,
    UNIQUE(username, email),
    CHECK (LOWER(status) IN ('yes', 'no'))
);

INSERT INTO `User` (username, email, status) VALUES
("dexter", "dexter@aol.com", 'yes'),
("maria", "maria@aol.com", 'yes'),
("james", "james@aol.com", 'no'),
("john", "john@aol.com", 'yes');

-- Stored Procedures

DELIMITER $$
CREATE PROCEDURE GetAllUsers()
BEGIN
    SELECT * FROM `User`;
END $$
DELIMITER ;

-- EXEC - EXECUTE
CALL GetAllUsers;

DROP PROCEDURE IF EXISTS GetAllUsers;

CREATE PROCEDURE GetTarget(IN val VARCHAR(255))
BEGIN
    SELECT * FROM `User` WHERE username = val;
END;

CALL GetTarget("maria");


-- Functions

--Scalar Functions

CREATE FUNCTION isEven(num INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    IF num % 2 = 0 THEN
        RETURN 'Yes';
    ELSE
        RETURN 'NO';
    END IF;
END;

SELECT isEven(1) AS isEven;

DROP FUNCTION isEven;




-- TRIGGER

DELIMITER $$

CREATE TRIGGER before_user_insert
BEFORE INSERT ON User
FOR EACH ROW
BEGIN
    -- If the status is not provided, set it to 'no'
    IF NEW.status IS NULL OR NEW.status = '' THEN
        SET NEW.status = 'no';
    END IF;
END $$

DELIMITER ;

INSERT INTO User (username, email) 
VALUES ('john_doe', 'john.doe@example.com');


SELECT * FROM `User`;




