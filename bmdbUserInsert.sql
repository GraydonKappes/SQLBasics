-- add user table to bmdbUSE bmdb;GOCREATE TABLE [User] (	Id				int PRIMARY KEY IDENTITY(1,1),	Username		varchar(20) NOT NULL UNIQUE,	Password		varchar(10) NOT NULL,	FirstName		varchar(20) NOT NULL,	LastName		varchar(20) NOT NULL,	PhoneNumber		varchar(12) NOT NULL,	Email			varchar(75) NOT NULL);INSERT INTO [User] (Username, Password, FirstName, LastName, PhoneNumber, Email)
VALUES 
    ('jsmith123', 'pass1234', 'John', 'Smith', '555-123-4567', 'john.smith@email.com'),
    ('mjohnson85', 'secureP@ss', 'Mary', 'Johnson', '555-987-6543', 'mary.johnson@email.com');