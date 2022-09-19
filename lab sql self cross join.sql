-- 1Get all pairs of actors that worked together.
select * from actor; -- actor_id,
select * from film_actor; -- actor_id, film_id

select a.actor_id , fa.film_id, rank() over(partition by a.actor_id order by film_id)
from actor a 
cross join film_actor fa on a.actor_id =fa.actor_id
order by a.actor_id;
-- it's not completed

-- 2Get all pairs of customers that have rented the same film more than 3 times.


select * from rental;			-- customer_id, inventory_id
select * from inventory;		 -- inventory_id, film_id
select r.customer_id as customer, re.customer_id as customer2, count(fi.film_id) as film_rented
from rental r
join inventory fi on r.inventory_id = fi.inventory_id
join rental re on fi.inventory_id= re.inventory_id
group by r.customer_id, re.customer_id
having film_rented > 3;

-- 3Get all possible pairs of actors and films.
select * from actor; -- actor_id
select * from film -- film_id

select actor_id, film_id
from (select distinct actor.actor_id from actor) a
cross join (select distinct film_id from film) f
ORDER BY actor_id, film_id;


