use sakila;


SELECT customer_id, COUNT(rental_id) AS rentals_count FROM rental GROUP BY customer_id;

SELECT customer_id, COUNT(rental_id) FROM rental GROUP BY customer_id ORDER BY COUNT(rental_id) DESC;

SELECT customer_id, SUM(rental_id) AS total_rentals FROM rental GROUP BY customer_id;

SELECT customer_id, MAX(rental_id) AS max_rentals FROM rental GROUP BY customer_id;

SELECT customer_id, MIN(rental_id) AS min_rentals FROM rental GROUP BY customer_id;

SELECT customer_id, AVG(rental_id) AS rental_average FROM rental GROUP BY customer_id;


SELECT customer_id, COUNT(rental_id) FROM rental GROUP BY customer_id HAVING COUNT(rental_id) > 33;



