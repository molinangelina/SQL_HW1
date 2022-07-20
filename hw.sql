-- 1. How many actors are there with the last name ‘Wahlberg’?
    # of actors w/ last_name "Wahlberg" = 2

    SELECT last_name
    FROM actor
    WHERE last_name = 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99?
    # of payments made btwn $3.99 and $5.99 = 4764

    SELECT COUNT(amount)
    FROM payment
    WHERE amount BETWEEN 3.99 AND 5.99;

-- 3. What film does the store have the most of? (search in inventory)
    film_id that has the most # of copies = 200 has 9 copies

    SELECT film_id, COUNT(film_id)
    FROM inventory
    GROUP BY film_id
    ORDER BY COUNT(film_id) DESC;

-- 4. How many customers have the last name ‘William’?
    # of customers have the last name "william" = 0

    SELECT COUNT(last_name)
    FROM customer
    WHERE last_name = 'William';

-- 5. What store employee (get the id) sold the most rentals?
    store employee id = 1

    SELECT COUNT(staff_id) as top_seller
    FROM rental
    WHERE staff_id = 1;

    SELECT COUNT(staff_id) as not_top_seller
    FROM rental
    WHERE staff_id = 2;

-- 6. How many different district names are there?
    # of district names = 603

    SELECT COUNT(district)
    FROM address;

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
    film_id with most actors in it = 508

    SELECT film_id, COUNT(actor_id) as num_of_actors
    FROM film_actor
    GROUP BY film_id
    ORDER BY COUNT(actor_id) DESC;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
-- This question is so confusing... how would I be able to count last names from store_id?? That makes no sense to me. And what do you mean by "store_id 1"?? Where is the 1 coming from??
    # of customers that have a last name ending with "es" = 21

    SELECT COUNT(last_name)
    FROM customer
    WHERE last_name LIKE '_%es';

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
    answer = 1257

    SELECT customer_id, amount, rental_id
    FROM payment
    WHERE customer_id BETWEEN 380 AND 430
    GROUP BY amount, customer_id, rental_id
    HAVING rental_id > 250
    ORDER BY rental_id ASC;

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
    # of rating categories = 5
    rating w/ most movies = PG-13 has 223 movies

    SELECT rating, COUNT(rating)
    FROM film
    GROUP BY rating
    ORDER BY COUNT(rating) ASC;