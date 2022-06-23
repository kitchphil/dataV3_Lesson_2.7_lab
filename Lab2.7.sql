USE sakila;

#1 How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT 
	T3.name AS Category
    , COUNT(DISTINCT T1.title) AS Films
FROM
	sakila.film AS T1
INNER JOIN sakila.film_category AS T2 ON T1.film_id = T2.film_id
INNER JOIN sakila.category AS T3 ON T2.category_id = T3.category_id
GROUP BY
	Category
;



#2 Display the total amount rung up by each staff member in August of 2005.

SELECT 
	CONCAT(T1.First_Name, ' ',  T1.Last_Name) AS Person
    , SUM(T2.amount) AS Amount
FROM
	sakila.staff AS T1
INNER JOIN sakila.payment AS T2 ON T1.staff_id = T2.staff_id
INNER JOIN sakila.rental AS T3 ON T2.rental_id = T3.rental_id    
WHERE
	T3.rental_date LIKE '2005-08%'
GROUP BY
	Person	
;



#3 Which actor has appeared in the most films?

SELECT 
	CONCAT(T3.first_name, ' ', T3.last_name) AS Actor_Name
    , COUNT(DISTINCT T1.film_id) AS Films
FROM
	sakila.Film AS T1
INNER JOIN sakila.film_actor AS T2 ON T1.film_id = T2.film_id 
INNER JOIN sakila.actor AS T3 ON T2.actor_id = T3.actor_id
GROUP BY
	Actor_Name
ORDER BY
	Films DESC
LIMIT
	1
;
	


#4 Most active customer (the customer that has rented the most number of films)

SELECT 
	T1.first_name AS FirstName
    , T1.last_name AS LastName
    , COUNT(T3.rental_id) AS Rentals
FROM
	sakila.customer AS T1
INNER JOIN sakila.payment AS T2 ON T1.customer_id = T2.customer_id
INNER JOIN sakila.rental AS T3 ON T2.rental_id = T3.rental_id
GROUP BY
	T1.first_name
    , T1.last_name
ORDER BY
	Rentals DESC
LIMIT
	1
;    



#5 Display the first and last names, as well as the address, of each staff member.

SELECT 
	T1.first_name 
	, T1.last_name
	, T2.address
    , T2.postal_code
    , T3.city
    , T4.country
FROM
	sakila.staff AS T1 
INNER JOIN sakila.address AS T2 on T1.address_id = T2.address_id
LEFT JOIN sakila.city AS T3 on T2.city_id = T3.city_id
LEFT JOIN sakila.country AS T4 ON T3.country_id = T4.country_id 
;



#6 List each film and the number of actors who are listed for that film.

SELECT 
	film.title AS Film
    , count(film_actor.actor_id) AS Actors
FROM 
	sakila.Film
INNER JOIN sakila.film_actor ON sakila.film.film_id = sakila.film_actor.film_id
GROUP BY 
	Film
ORDER BY
	Actors DESC
;



#7 Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT
	sakila.customer.First_Name AS First_Name
    , sakila.customer.Last_Name AS Last_Name
    , SUM(sakila.payment.amount) AS Total_Amount
FROM
	sakila.customer
JOIN sakila.payment ON sakila.customer.customer_id = sakila.payment.customer_id  
GROUP BY
	First_Name
    , Last_Name
ORDER BY
	Last_Name
;
	


#8 List number of films per category.

SELECT 
	T3.name AS Category
    , COUNT(DISTINCT T1.title) AS Films
FROM
	sakila.film AS T1
INNER JOIN sakila.film_category AS T2 ON T1.film_id = T2.film_id
INNER JOIN sakila.category AS T3 ON T2.category_id = T3.category_id
GROUP BY
	Category
;