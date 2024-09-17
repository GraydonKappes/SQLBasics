USE SALESDB;
GO

-- Region table
SET IDENTITY_INSERT dbo.Region ON;
GO
INSERT INTO dbo.Region (Id, name)
VALUES
(1, 'North'),
(2, 'South'),
(3, 'East'),
(4, 'West');
GO
SET IDENTITY_INSERT dbo.Region OFF;
GO
SELECT *
	FROM Region
  ORDER BY Id;
-- SalesPerson table
SET IDENTITY_INSERT dbo.SalesPerson ON;
GO
INSERT INTO dbo.SalesPerson (Id, FirstName, LastName, RegionId)
VALUES
(1, 'John', 'Doe', 1),
(2, 'Jane', 'Smith', 2),
(3, 'Alice', 'Brown', 3),
(4, 'Bob', 'Johnson', 4),
(5, 'Eve', 'Davis', 1);
GO
SET IDENTITY_INSERT dbo.SalesPerson OFF;
GO
/*SELECT DISTINCT SalesPersonFirstName, SalesPersonLastName, R.Id
	FROM Sales_Denormalized SD
	JOIN Region R ON SD.Region = R.Name;*/
-- Customer table

INSERT INTO Customer (Name)
SELECT DISTINCT Customer  
  FROM Sales_Denormalized;

SELECT *
  FROM Customer
ORDER BY Id;
SET IDENTITY_INSERT dbo.Customer ON;
GO
INSERT INTO dbo.Customer (Id, Name)
VALUES
(1, 'Acme Corp'),
(2, 'Beta Inc'),
(3, 'Delta Co'),
(4, 'Epsilon Ltd'),
(5, 'Gamma LLC'),
(6, 'Omega Enterprises'),
(7, 'Sigma Solutions'),
(8, 'Zeta Partners');
GO
SET IDENTITY_INSERT dbo.Customer OFF;
GO

-- Sales table
INSERT INTO Sales (SalesPersonId, SalesDate, SalesAmount, CustomerId)
SELECT SP.Id, SalesDate, SalesAmount, C.Id
	FROM Sales_Denormalized SD
JOIN SalesPerson SP ON SD.SalesPersonFirstName = SP.FirstName AND SD.SalesPersonFirstName = SP.LastName
JOIN Customer C ON SD.CUstomer = C.Name;
SET IDENTITY_INSERT dbo.Sales ON;
GO
INSERT INTO dbo.Sales (Id, SalesPersonId, SalesDate, SalesAmount, CustomerId)
VALUES
(1, 5, '2023-09-23', 1546.00, 5),
(2, 5, '2024-02-04', 1601.00, 1),
(3, 5, '2023-11-26', 2091.00, 3),
(4, 5, '2024-08-15', 3382.00, 1),
(5, 4, '2023-10-23', 1866.00, 2),
(6, 3, '2024-04-09', 1692.00, 2),
(7, 3, '2024-04-28', 2757.00, 6),
(8, 3, '2024-01-08', 3738.00, 7),
(9, 3, '2024-05-12', 4040.00, 2),
(10, 3, '2023-10-04', 4341.00, 2),
(11, 3, '2024-01-10', 4581.00, 6),
(12, 3, '2024-04-22', 4809.00, 8),
(13, 2, '2024-01-21', 1246.00, 7),
(14, 2, '2024-02-29', 1438.00, 1),
(15, 2, '2024-04-06', 3722.00, 6),
(16, 2, '2023-12-24', 4833.00, 4),
(17, 2, '2024-07-01', 4930.00, 6),
(18, 1, '2024-05-27', 1336.00, 5),
(19, 1, '2023-12-08', 3090.00, 2),
(20, 1, '2024-07-10', 4263.00, 6);
GO
SET IDENTITY_INSERT dbo.Sales OFF;
GO

-- Insert data into sales_denormalized
INSERT INTO dbo.Sales_Denormalized (SalesPersonId, SalesPersonFirstName, SalesPersonLastName, Region, SalesDate, SalesAmount, Customer)
VALUES
(4, 'Bob', 'Johnson', 'West', '2023-10-23', 1866, 'Beta Inc'),
(5, 'Eve', 'Davis', 'North', '2024-08-15', 3382, 'Acme Corp'),
(3, 'Alice', 'Brown', 'East', '2024-01-10', 4581, 'Omega Enterprises'),
(5, 'Eve', 'Davis', 'North', '2023-11-26', 2091, 'Delta Co'),
(2, 'Jane', 'Smith', 'South', '2024-01-21', 1246, 'Sigma Solutions'),
(3, 'Alice', 'Brown', 'East', '2024-04-16', 2899, 'Gamma LLC'),
(2, 'Jane', 'Smith', 'South', '2023-12-19', 1825, 'Acme Corp'),
(4, 'Bob', 'Johnson', 'West', '2023-09-10', 3005, 'Epsilon Ltd'),
(1, 'John', 'Doe', 'North', '2023-11-03', 1882, 'Zeta Partners'),
(5, 'Eve', 'Davis', 'North', '2024-07-05', 1444, 'Beta Inc'),
(3, 'Alice', 'Brown', 'East', '2023-12-12', 1323, 'Omega Enterprises'),
(1, 'John', 'Doe', 'North', '2024-02-18', 4870, 'Gamma LLC'),
(1, 'John', 'Doe', 'North', '2023-11-27', 1162, 'Delta Co'),
(4, 'Bob', 'Johnson', 'West', '2024-04-05', 3081, 'Acme Corp'),
(5, 'Eve', 'Davis', 'North', '2024-03-18', 2654, 'Sigma Solutions'),
(2, 'Jane', 'Smith', 'South', '2024-08-05', 3569, 'Epsilon Ltd'),
(3, 'Alice', 'Brown', 'East', '2024-06-26', 2124, 'Omega Enterprises'),
(4, 'Bob', 'Johnson', 'West', '2023-11-07', 1802, 'Beta Inc'),
(1, 'John', 'Doe', 'North', '2024-05-02', 3897, 'Zeta Partners'),
(2, 'Jane', 'Smith', 'South', '2024-02-25', 2336, 'Acme Corp');
GO

--Validate the inserts
-- Do 4 table join (Sales - SalesPerson - Region - Customer)
SELECT *
  FROM Sales_Denormalized
  ORDER BY SalesAmount;