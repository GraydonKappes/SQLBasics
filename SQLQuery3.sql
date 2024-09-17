-- Chap 5 Summary Queries

--p. 137
--count of unpaid invoices, calculated total due
-- total due = invoice total - (payment total + credit total)
SELECT  count(*) AS NumberOfInvoices,
SUM (InvoiceTotal - (PaymentTotal + CreditTotal)) AS TotalDue
FROM Invoices
WHERE InvoiceTotal - (PaymentTotal + CreditTotal) > 0;

-- p. 139 COUNT(*), AVG and SUM
-- AFTER 7/1/22 # of invoices, avg inv amt. tot inv amt
SELECT 'After 7/1/2022' as SelectionDate,
		count(*) AS NumberOfInvoices,
		AVG(InvoiceTotal) AS AverageInvoiceAmount,
		SUM(InvoiceTotal) AS TotalInvoiceAmount
	FROM Invoices
WHERE InvoiceDate > '2022-7-01';
--A summary query that uses the MIN and MAX functions
SELECT 'After 7/1/2022' as SelectionDate,
		count(*) AS NumberOfInvoices,
		MAX(InvoiceTotal) AS HighestInvoiceTotal,
		MIN(InvoiceTotal) AS LowestInvoiceTotal
	FROM Invoices
WHERE InvoiceDate > '2022-7-01';

--A summary query that uses the DISTINCT keyword
--Total # of Vendors, total invoices, avg amoun, toal amt, since 7/1/2022
SELECT COUNT(DISTINCT VendorID) AS NumberOfVendors,
		count(VendorID) AS NumberOfInvoices,
		MAX(InvoiceTotal) AS AverageInvoiceAmount,
		MIN(InvoiceTotal) AS TotalInvoiceAmount
	FROM Invoices
WHERE InvoiceDate > '2022-7-01';

--p. 141 Group By and Having clauses
--avg income amt by vendor
--return VenderID, and Avg Invoice Total
--return only those greater than 2000
SELECT VendorID, AVG(InvoiceTotal) AS AvgInvoiceTotal
	FROM Invoices
	GROUP BY VendorID
	HAVING AVG(InvoiceTotal) > 2000
ORDER BY AVGInvoiceTotal DESC;

--Summary Query that counts the number of invoices by vendor
SELECT VendorID, Count(*) AS InvoiceQty
FROM invoices 
GROUP BY VendorID;

--A summary query that calculates the number of
--invoices and the average invoice amount for the vendors in each state and city
SELECT VendorCity, VendorState, Count(*) AS InvoiceQty,
AVG(InvoiceTotal) AS InvoiceAvg
FROM invoices I
join Vendors V
ON I.VendorID = V.VendorID
GROUP BY VendorState, VendorCity
ORDER BY VENDORSTATE, VendorCity;

--A summary query that limits the groups to those with two or more invoices
SELECT VendorCity, VendorState, Count(*) AS InvoiceQty,
AVG(InvoiceTotal) AS InvoiceAvg
FROM invoices I
join Vendors V
ON I.VendorID = V.VendorID
GROUP BY VendorState, VendorCity
HAVING COUNT(*) >= 2
ORDER BY VENDORSTATE, VendorCity;

--A summary query with a search condition in the HAVING clause
SELECT VendorName, Count(*) AS InvoiceQty,
AVG(InvoiceTotal) AS InvoiceAvg
FROM Vendors V
join Invoices I
ON I.VendorID = V.VendorID
GROUP BY VendorName
HAVING AVG(InvoiceTotal) > 500
ORDER BY InvoiceQty DESC;

--A summary query with a search condition in the WHERE clause
SELECT VendorName, Count(*) AS InvoiceQty,
	AVG(InvoiceTotal) AS InvoiceAvg
	FROM Vendors V
	JOIN Invoices I
	ON I.VendorID = V.VendorID
	WHERE InvoiceTotal > 500
	GROUP BY VendorName
ORDER BY InvoiceQty DESC;
	
-- P.147
--A summary query with a compound condition in the HAVING clause
SELECT InvoiceDate, Count(*) AS InvoiceQty, SUM(InvoiceTotal) AS InvoiceSum
FROM Invoices
GROUP BY InvoiceDate
Having InvoiceDate Between '2023-01-01' and '2023-01-01'
	AND COUNT(*) > 1
	AND SUM(InvoiceTotal) > 100
ORDER BY InvoiceDate DESC;

-- same thing using WHERE
SELECT InvoiceDate, Count(*) AS InvoiceQty, SUM(InvoiceTotal) AS InvoiceSum
FROM Invoices
	WHERE InvoiceDate Between '2023-01-01' and '2023-01-01'
	GROUP BY InvoiceDate
	HAVING COUNT(*) > 1
	AND SUM(InvoiceTotal) > 100
ORDER BY InvoiceDate DESC;

--p.148 SQL Sever Extensions - won't see these in MySQL
--ROLLOUP operator - add summary rows at bottom of results sets
--p.149
SELECT VendorID, COUNT(*) AS InvoiceCount, SUM(InvoiceTotal) AS InvoiceTotal
	FROM Invoices
GROUP BY ROLLUP(VendorID);

--p.150 CUBE operator
SELECT VendorID, COUNT(*) AS InvoiceCount, SUM(InvoiceTotal) AS InvoiceTotal
	FROM Invoices
GROUP BY CUBE(VendorID);

SELECT VendorState, VendorCity, COUNT(*) AS QtyVendors 
  FROM Vendors
 WHERE VendorState IN ('IA', 'NJ') 
 GROUP BY CUBE (VendorState, VendorCity) 
 ORDER BY VendorState DESC, VendorCity DESC;

 --pg.156 Exercises

 --Exercise 1
 SELECT VendorID, SUM(PaymentTotal) AS PaymentSum
	FROM Invoices
	GROUP BY VendorID;

-- Exercise 2
SELECT VendorID, SUM(PaymentTotal) AS PaymentSum
FROM Invoices
GROUP BY VendorID
ORDER BY PaymentSum DESC;

--Exercise 3
SELECT VendorName, Count(*) AS InvoiceCount, SUM(InvoiceTotal) AS InvoiceSUM
	FROM Vendors V
	JOIN Invoices I
	ON I.VendorID = V.VendorID
	GROUP BY VendorName
	ORDER BY InvoiceCount DESC;

--Exercise 4
SELECT AccountDescription, COUNT(*) AS LineItemCount, SUM(InvoiceLineItemAmount) AS LineItemSum
 FROM GLAccounts GLA
 JOIN InvoiceLineItems ILI ON GLA.AccountNo = ILI.AccountNo
 GROUP BY AccountDescription
 HAVING Count(*) > 1 
 ORDER BY LineItemCount DESC;
 
 --Exercise 5
 SELECT  AccountDescription, MAX(InvoiceDate) AS LatestInvoiceDate, COUNT(*) AS LineItemCount, SUM(InvoiceLineItemAmount) AS LineItemSum
 FROM GLAccounts GLA
 JOIN InvoiceLineItems ILI ON GLA.AccountNo = ILI.AccountNo
 JOIN Invoices I ON ILI.InvoiceID = I.InvoiceID
 WHERE InvoiceDate BETWEEN '2022-10-01' AND '2023-12-31'
 GROUP BY AccountDescription, InvoiceDate
 HAVING Count(*) > 1 
 ORDER BY InvoiceDate DESC;


 