USE BMDB;

-- Insert sample movies
INSERT INTO Movie (Title, Year, Rating, Director) VALUES
('The Shawshank Redemption', 1994, 'R', 'Frank Darabont'),
('The Godfather', 1972, 'R', 'Francis Ford Coppola'),
('Pulp Fiction', 1994, 'R', 'Quentin Tarantino'),
('The Dark Knight', 2008, 'PG-13', 'Christopher Nolan'),
('Star Wars: Episode IV - A New Hope', 1977, 'PG', 'George Lucas'),
('Dummy Movie', 2024, 'R', 'Test Director'),
('Forrest Gump', 1994, 'PG-13', 'Robert Zemeckis');

-- Insert sample actors
INSERT INTO Actor (FirstName, LastName, Gender, BirthDate) VALUES
('Tim', 'Robbins', 'M', '1958-10-16'),
('Morgan', 'Freeman', 'M', '1937-06-01'),
('Marlon', 'Brando', 'M', '1924-04-03'),
('Al', 'Pacino', 'M', '1940-04-25'),
('John', 'Travolta', 'M', '1954-02-18'),
('Uma', 'Thurman', 'F', '1970-04-29'),
('Christian', 'Bale', 'M', '1974-01-30'),
('Heath', 'Ledger', 'M', '1979-04-04'),
('Mark', 'Hamill', 'M', '1951-09-25'),
('Tom', 'Hanks', 'M', '1956-07-09');

-- Insert sample credits
INSERT INTO Credit (MovieId, ActorId, Role) VALUES
(1, 1, 'Andy Dufresne'),
(1, 2, 'Ellis Boyd ''Red'' Redding'),
(2, 3, 'Don Vito Corleone'),
(2, 4, 'Michael Corleone'),
(3, 5, 'Vincent Vega'),
(3, 6, 'Mia Wallace'),
(4, 7, 'Bruce Wayne / Batman'),
(4, 8, 'Joker'),
(5, 9, 'Luke Skywalker'),
(7, 10, 'Forrest Gump');

-- Insert sample users
INSERT INTO UserAccount (Username, Password, FirstName, LastName, PhoneNumber, Email)
VALUES 
    ('jsmith123', 'hashed_password_here', 'John', 'Smith', '5551234567', 'john.smith@email.com'),
    ('mjohnson85', 'hashed_password_here', 'Mary', 'Johnson', '5559876543', 'mary.johnson@email.com');