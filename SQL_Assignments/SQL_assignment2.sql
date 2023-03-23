use sakila;
select count(*)as deleted_documentaries 
 from film
 join film_category on film.film_id=film_category.film_id
 join category on film_category.category_id=category.category_id
 where category.name="Documentary"
and film.special_features like "%Deleted Scenes%";
 
  
select sum(payment.amount)as sales
 from payment
 join rental on payment.rental_id=rental.rental_id 
 join inventory on rental.inventory_id=inventory.inventory_id
 join film on inventory.film_id = film.film_id
 join film_category on film.film_id = film_category.film_id
 join category on film_category.category_id = category.category_id
 where category.name = "Animation";
 
 
 
select category.name,  count( * ) as rented
from rental
join inventory on rental.inventory_id = inventory.inventory_id
join film_category on inventory.film_id = film_category.film_id
join category on film_category.category_id = category.category_id
join customer on rental.customer_id = customer.customer_id
where customer.first_name = "PATRICIA"
and customer.last_name = "JOHNSON"
group by category.name
order by count( * ) desc
limit 3;


select count( * ) as rented
from rental
join inventory on rental.inventory_id = inventory.inventory_id
join film on inventory.film_id = film.film_id
join customer on rental.customer_id = customer.customer_id
where customer.first_name = "SUSAN"
and customer.last_name = "WILSON"
and film.rating = "R"

