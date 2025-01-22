USE sakila;

SELECT title,
    price,
    if(price>3,'high','low') as rental_rate_status 
FROM film_list;


SELECT title,
    price,
    CASE 
        WHEN price > 3 THEN 'high'
        WHEN price < 3 AND price > 2 THEN 'medium'
        ELSE 'low'
    END AS rental_rate_status
FROM film_list;



DELIMITER $$
CREATE FUNCTION fnComparePrice(p_price1 DECIMAL(5,2))
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
    DECLARE v_result VARCHAR(30);

    SET @avg = (SELECT AVG(price) FROM film_list);
    IF p_price1 > @avg THEN
        SET v_result = 'price1 is greater';
    ELSE 
        SET v_result = 'price1 is less';
    END IF;
    RETURN v_result;
END $$
DELIMITER ;

SELECT fnComparePrice(2);

DELIMITER $$
CREATE FUNCTION fnComparePrice2(p_price1 DECIMAL(5,2))
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
    DECLARE v_result VARCHAR(30);

    SET @avg = (SELECT AVG(price) FROM film_list);
    SET v_result = CASE 
        WHEN p_price1 > @avg THEN 'price1 is greater'
        WHEN p_price1 < @avg THEN 'price1 is less'
        ELSE 'price1 is equal'
    END;
    RETURN v_result;
END $$
DELIMITER ;

SELECT fnComparePrice2(2.2);

CREATE PROCEDURE dowhile()
BEGIN 
    DECLARE v_counter INT DEFAULT 0;
    WHILE v_counter < 5 DO
        SET v_counter = v_counter + 1;
        SELECT v_counter;
    END WHILE;
END;


CALL dowhile();