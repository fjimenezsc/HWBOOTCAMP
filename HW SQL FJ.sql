use sakila;

# 1a

SELECT first_name, last_name
FROM actor;

# 1b

SELECT UPPER(CONCAT(first_name, ' ', last_name)) AS `Actor Name`
FROM actor;

#2a

SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = "Joe";

#2b

SELECT actor_id, first_name, last_name
FROM actor
WHERE last_name like '%GEN%';

#2c

SELECT actor_id, last_name, first_name
FROM actor
WHERE last_name like '%LI%';

#2d

SELECT country_id, country
FROM country 
WHERE country IN 
('Afghanistan', 'Bangladesh', 'China');

#3a

ALTER TABLE actor
ADD COLUMN middle_name VARCHAR(25) AFTER first_name;

#3b

ALTER TABLE actor
MODIFY COLUMN middle_name BLOB;

#3c

ALTER TABLE actor
DROP COLUMN middle_name;

#4a


#4b

#4c

UPDATE actor 
SET first_name = 'HARPO'
WHERE First_name = "Groucho" AND last_name = "Williams";

#4d

UPDATE actor 
SET first_name = 'GROUCHO'
WHERE actor_id = 172;

#5a

DESCRIBE sakila.address;

#6a

SELECT first_name, last_name, address
FROM staff s 
JOIN address a
ON s.address_id = a.address_id;

#6b

SELECT payment.staff_id, staff.first_name, staff.last_name, payment.amount, payment.payment_date
FROM staff INNER JOIN payment ON
staff.staff_id = payment.staff_id AND payment_date LIKE '2005-08%'; 


#6c

#6d. 

SELECT title, (
SELECT COUNT(*) FROM inventory
WHERE film.film_id = inventory.film_id
) AS 'Number of Copies'
FROM film
WHERE title = "Hunchback Impossible";

#6e

#7a

SELECT title
FROM film WHERE title 
LIKE 'K%' OR title LIKE 'Q%'
AND title IN 
(
SELECT title 
FROM film 
WHERE language_id = 1
);


-- 7b. Use subqueries to display all actors who appear in the film `Alone Trip`.

SELECT first_name, last_name
FROM actor
WHERE actor_id IN
(
Select actor_id
FROM film_actor
WHERE film_id IN 
(
SELECT film_id
FROM film
WHERE title = 'Alone Trip'
));
#7c

SELECT customer.first_name, customer.last_name, customer.email 
FROM customer
JOIN address
ON (customer.address_id = address.address_id)
JOIN city
ON (city.city_id = address.city_id)
JOIN country
ON (country.country_id = city.country_id)
WHERE country.country= 'Canada';

#7d

SELECT title, description FROM film 
WHERE film_id IN
(
SELECT film_id FROM film_category
WHERE category_id IN
(
SELECT category_id FROM category
WHERE name = "Family"
));




