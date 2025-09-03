SELECT rental_duration, (SELECT AVG(rental_duration) as avg_rental)
from film
group by film_id;

SELECT COUNT(category_id)
FROM film_category
WHERE category_id IN (
    SELECT category_id
    FROM film_category
    GROUP BY category_id
    HAVING COUNT(film_id) > 60
);


SELECT AVG(amount)
FROM payment
WHERE customer_id IN (
    SELECT customer_id
    FROM customer
    WHERE address_id IN (
        SELECT address_id
        FROM address
        WHERE city_id IN (
            SELECT city_id
            FROM city
            WHERE country_id IN (
                SELECT country_id
                FROM country
                WHERE country = 'Mexico'
            )
        )
    )
);

SELECT AVG(payment.amount)
FROM payment
INNER JOIN customer ON payment.customer_id = customer.customer_id
INNER JOIN address ON customer.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country ON city.country_id = country .country_id
WHERE country.country = 'Mexico';
