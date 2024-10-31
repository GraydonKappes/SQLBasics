-- Check if the database exists and drop it if it does
DROP DATABASE IF EXISTS BMDB;

-- Create the database
CREATE DATABASE BMDB;

-- Use the newly created database
USE BMDB;

-- Create Movie table
CREATE TABLE Movie (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    year INT,
    Rating VARCHAR(5) CHECK (Rating IN('PG','R','G', 'NC-17', 'PG-13')),
    Director VARCHAR(255),
    CONSTRAINT UQ_Movie_Title_Year UNIQUE (Title, Year)
);

-- Create Actor table
CREATE TABLE Actor (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Gender VARCHAR(1) NOT NULL,
    Birthdate DATE NOT NULL,
    CONSTRAINT UQ_Actor_fn_ln_bd UNIQUE (FirstName, LastName, Birthdate)
);

-- Create Credit table
CREATE TABLE Credit (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    MovieId INT NOT NULL,
    ActorId INT NOT NULL,
    Role VARCHAR(255) NOT NULL,
    FOREIGN KEY (MovieId) REFERENCES Movie(Id),
    FOREIGN KEY (ActorId) REFERENCES Actor(Id),
    CONSTRAINT UQ_Credit_Movie_Actor UNIQUE (ActorId, MovieId)
);

-- Create User table (renamed to avoid reserved keyword issues)
CREATE TABLE UserAccount (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(20) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(75) NOT NULL
);