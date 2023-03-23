use sakila;
SELECT film.film_id,film.title ,film.rating
FROM film 
INNER JOIN film_category ON film.film_id = film_category.film_id 
INNER JOIN category ON film_category.category_id = category.category_id 
WHERE category.name = 'Comedy' AND film.rating = 'PG-13';


SELECT film.title,category.name, COUNT(*) as rental_count 
FROM film 
INNER JOIN inventory ON film.film_id = inventory.film_id 
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id 
INNER JOIN film_category ON film.film_id = film_category.film_id 
INNER JOIN category ON film_category.category_id = category.category_id 
WHERE category.name = 'Horror' 
GROUP BY film.film_id
ORDER BY rental_count DESC 
LIMIT 3;


select customer.customer_id, customer.first_name, customer.last_name,country
from customer
join rental on customer.customer_id = rental.customer_id
join inventory on rental.inventory_id = inventory.inventory_id
join film_category on inventory.film_id = film_category.film_id
join category on film_category.category_id = category.category_id
join address on customer.address_id = address.address_id
join city on address.city_id = city.city_id
join country on city.country_id = country.country_id
where category.name = "Sports"
and country.country = "India";


select customer.customer_id, customer.first_name, customer.last_name,actor.first_name as actor_fname,actor.last_name as actor_lname,country 
from customer
join rental on customer.customer_id = rental.customer_id
join inventory on rental.inventory_id = inventory.inventory_id
join film_actor on inventory.film_id = film_actor.film_id
join actor on film_actor.actor_id = actor.actor_id
join address on customer.address_id = address.address_id
join city on address.city_id = city.city_id
join country on city.country_id = country.country_id
where country.country = "Canada"
and actor.first_name = "NICK"
and actor.last_name = "WAHLBERG";


select count(*)as total_films 
 from actor
 join film_actor on actor.actor_id =film_actor.actor_id
 join film on film_actor.film_id=film.film_id
where first_name="SEAN"
and last_name="WILLIAMS"
group by actor.actor_id;

