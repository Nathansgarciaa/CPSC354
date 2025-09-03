START TRANSACTION;

INSERT INTO actor (actor_id, first_name, last_name, last_update)
VALUES (999, 'NICOLE', 'STREEP', '2021-06-01 12:00:00');

SAVEPOINT savepoint1;

DELETE FROM actor
WHERE first_name = 'CUBA';

SELECT * FROM actor;

ROLLBACK TO savepoint1;

SELECT * FROM actor;

COMMIT;


/* How many actors resulted in your first select statement? 198
   And your second? 201
   How many rows will be in the actor table after the transaction is over? 201
*/