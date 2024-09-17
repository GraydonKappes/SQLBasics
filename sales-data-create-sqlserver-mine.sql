USE MASTER;
GO

-- Check if the database exists
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'SALESDB')
BEGIN
    -- Set database to single user mode and close existing connections
    ALTER DATABASE SALESDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    
    -- Now drop the database
    DROP DATABASE SALESDB;
END
GO

CREATE DATABASE SALESDB;
GO

USE SALESDB;
GO
CREATE TABLE Sales_Denormalized (
	Id int PRIMARY KEY IDENTITY(1,1),
	SalesPersonId int NOT NULL,
	SalesPersonFirstName varchar(25) NOT NULL,
	SalesPersonLastName varchar(25) NOT NULL,
	Region varchar(20) NOT NULL,
	SalesDate date NOT NULL,
	SalesAmount decimal(10,2),
	Customer varchar(50)
);

CREATE TABLE Region (
	Id int PRIMARY KEY IDENTITY(1,1),
	name VARCHAR(25) NOT NULL
	CONSTRAINT UQ_Region_Name UNIQUE (NAME)
	);

CREATE TABLE Customer (
	Id int PRIMARY KEY IDENTITY(1,1),
	name VARCHAR(50) NOT NULL,
	CONSTRAINT UQ_Customer_Name UNIQUE (NAME)
	);

CREATE TABLE SalesPerson (
	Id int PRIMARY KEY IDENTITY(1,1),
	FirstName VARCHAR(25) NOT NULL,
	LastName VARCHAR(25) NOT NULL,
	RegionId INT NOT NULL,
	FOREIGN KEY (RegionId) REFERENCES Region(Id)
	);

CREATE TABLE Sales (
	Id int PRIMARY KEY IDENTITY(1,1),
	SalesPersonId int NOT NULL,
	SalesDate date NOT NULL,
	SalesAmount decimal(10,2) NOT NULL,
	CustomerId int NOT NULL,
	FOREIGN KEY (SalesPersonId) REFERENCES SalesPerson(Id),
	FOREIGN KEY (CustomerId) REFERENCES Customer(Id)
	);



