Select distinct address.address_id
from address
left join store
    on address.address_id != store.address_id
where district = 'California';

select film.title, count(inventory.store_id)
from film
left join inventory
    on film.film_id = inventory.film_id
group by film.title;

select actor.first_name, actor.last_name, film.title
from actor
left join film_actor
    on actor.actor_id = film_actor.actor_id
left join film
    on film_actor.film_id = film.film_id;

select actor.actor_id, film.film_id
from actor
left join film_actor
    on actor.actor_id = film_actor.actor_id
left join film
    on film_actor.film_id = film.film_id
UNION
Select actor.actor_id, film.film_id
from film
left join film_actor
    on film.film_id = film_actor.film_id
left join actor
    on film_actor.actor_id = actor.actor_id;
