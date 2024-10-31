USE BMDB;

-- Create User table
CREATE TABLE User (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(20) NOT NULL UNIQUE,
    Password VARCHAR(10) NOT NULL,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    PhoneNumber VARCHAR(12) NOT NULL,
    Email VARCHAR(75) NOT NULL
);

-- Insert sample users
INSERT INTO User (Username, Password, FirstName, LastName, PhoneNumber, Email)
VALUES 
    ('jsmith123', 'pass1234', 'John', 'Smith', '555-123-4567', 'john.smith@email.com'),
    ('mjohnson85', 'secureP@ss', 'Mary', 'Johnson', '555-987-6543', 'mary.johnson@email.com');