/*-- DELETE STATEMENT
SELECT *
	FROM SalesPerson;

-- CRUD: Create, Read, Update, Delete
--SELECT *
DELETE
	FROM SalesPerson
  WHERE Id= 1;

  --Delete em all!
DELETE
	FROM SalesPerson;

-- bmdb crud stuff
-- Insert a Movie

DELETE
	FROM Movie
SELECT * 
	FROM Actor;

	--UPDATE Statement
UPDATE Movie	
	SET Title = 'Super Dumb Movie'
  WHERE Id = 5;
*/
-- Join 3 tables to show the movie - actor - and role info
SELECT *
	FROM Credit C
	JOIN Movie M ON C.MovieId = M.Id
	Join Actor A ON C.ActorId = A.Id
	WHERE MovieId = 7
	ORDER BY MovieId;

	SELECT C.*, M.Title, A.FirstName, A.LastName
FROM Credit C
JOIN Movie M ON C.MovieId = M.Id
JOIN Actor A ON C.ActorId = A.Id
WHERE M.Title = 'Forrest Gump'

