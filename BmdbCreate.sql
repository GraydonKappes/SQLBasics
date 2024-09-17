USE MASTER;
GO

-- Check if the database exists
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'BMDB')
BEGIN
    -- Set database to single user mode and close existing connections
    ALTER DATABASE BMDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    
    -- Now drop the database
    DROP DATABASE BMDB;
END
GO

CREATE DATABASE BMDB;
GO

USE BMDB;
GO

CREATE TABLE Movie (
	Id int PRIMARY KEY IDENTITY(1,1),
	title VARCHAR(255) NOT NULL,
	year INT,
	Rating VARCHAR(5) CHECK (Rating IN('PG','R','G', 'NC-17', 'PG-13')),
	Director VARCHAR(255),
	CONSTRAINT UQ_Movie_Title_Year UNIQUE (Title, Year)
	);

CREATE TABLE Actor (
	Id int PRIMARY KEY IDENTITY(1,1),
	FirstName VARCHAR(255)			NOT NULL,
	LastName  VARCHAR(255)			NOT NULL,
	Gender    VARCHAR(1)			NOT NULL,
	Birthdate date					NOT NULL,
	CONSTRAINT UQ_Actor_fn_ln_bd UNIQUE (FirstName, LastName, Birthdate)

	);

CREATE TABLE Credit (
	Id			int				PRIMARY KEY IDENTITY(1,1),
	MovieId		int				NOT NULL,
	ActorId		int				NOT NULL,
	Role VARCHAR(255)			NOT NULL,
	FOREIGN KEY (MovieId) REFERENCES Movie(Id),
	FOREIGN KEY (ActorId) REFERENCES Actor(Id),
	CONSTRAINT UQ_Credit_Movie_Actor UNIQUE (ActorId ,MovieId)
	);