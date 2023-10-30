-- 1.Write a SQL query to count the number of characters except for the spaces for each actor. Return the first 10 actors' name lengths along with their names--
SELECT CONCAT(actor.first_name,SPACE(1),actor.last_name)AS Actors,
LENGTH(CONCAT(actor.first_name,actor.last_name))AS Lengthoftheirnames FROM actor LIMIT 10;
-- 2.List all Oscar awardees(Actors who received the Oscar award) with their full names and the length of their names.
SELECT CONCAT(actor_award.first_name,SPACE(1),actor_award.last_name)AS oscarawardees,
LENGTH(CONCAT(actor_award.first_name,actor_award.last_name))AS Lengthoftheirnames FROM actor_award WHERE actor_award.awards='Oscar';
-- 3. Find the actors who have acted in the film ‘Frost Head.’--7 rows returned
SELECT FI.title as filmsacted,CONCAT(A.first_name,SPACE(1),A.last_name) Actorname FROM Film_actor FA
INNER JOIN FILM FI ON FI.film_id=FA.film_id
INNER JOIN Actor A ON A.actor_id=FA.actor_id
Where FI.title='frost head';
-- 4. Pull all the films acted by the actor ‘Will Wilson.’
SELECT FI.title as filmsacted,CONCAT(A.first_name,SPACE(1),A.last_name) Actorname FROM Film_actor FA
INNER JOIN FILM FI ON FI.film_id=FA.film_id
INNER JOIN Actor A ON A.actor_id=FA.actor_id
WHERE A.first_name='Will' AND A.last_name='WILson';
-- 5. Pull all the films which were rented and return them in the month of May.
SELECT Fi.title,RE.rental_date FROM Rental RE
INNER JOIN Inventory I ON RE.inventory_id=I.inventory_id
INNER JOIN Film Fi ON Fi.film_id=I.film_id
WHERE extract(month from return_date) = 5;
-- 6.Pull all the films with ‘Comedy’ category.
SELECT Fi.Title,CA.name as categoryname from film_category FC
INNER JOIN category CA ON CA.category_id=FC.category_id
INNER JOIN Film Fi ON FC.film_id=Fi.film_id
Where CA.name='comedy';