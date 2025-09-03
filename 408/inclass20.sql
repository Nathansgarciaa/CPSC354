
ALTER TABLE film
ADD CONSTRAINT title UNIQUE (title);


ALTER TABLE film
DROP CONSTRAINT title;


CREATE VIEW ATitlesFrom2006 AS
SELECT title
FROM film
WHERE release_year = 2006 AND title LIKE 'A%';

SELECT *
FROM ATitlesFrom2006;



CREATE TABLE rating_log(
user VARCHAR(50),
action VARCHAR(120)
);

DELIMITER $$
CREATE TRIGGER ratedR
    AFTER INSERT ON film
    FOR EACH ROW
BEGIN
    IF NEW.rating = 'R' THEN
        INSERT INTO rating_log VALUES (USER(), 'Rated R movie inserted');
    END IF;
END$$

INSERT INTO film (title, language_id, original_language_id, rating)
VALUES ('RRATEDMOVIE', 1, NULL, 'R');

DELIMITER $$
CREATE PROCEDURE ReleaseYear(
    IN theMovie VARCHAR(50),
    OUT release_year INT)
BEGIN
    SELECT release_year INTO release_year
    FROM film
    WHERE title = theMovie;
END$$

CALL ReleaseYear('ACADEMY DINOSAUR', @total);
SELECT @total AS ReleaseYear;