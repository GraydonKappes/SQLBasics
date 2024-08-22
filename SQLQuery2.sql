--Chapter 2 Basic Statements--
Select * FROM Vendors;


--chapter 3 p. 65
SELECT *
	FROM Invoices;

--same query but only show 3 columns and order by invoice total

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
	FROM Invoices
ORDER BY InvoiceTotal;

--two columns and a calculated value for a specifc invoice (id 17)--
SELECT InvoiceID, InvoiceTotal, CreditTotal + PaymentTotal AS TotalCredit
	FROM Invoices
	WHERE InvoiceID= 17;


-- get all invoices between 2 dates
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
	FROM Invoices
Where InvoiceDate Between '2023-01-01' and '2023-03-31'
ORDER BY InvoiceDate;

-- returning an empty result set
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
	FROM Invoices
	Where InvoiceTotal > 50000;
--page 69
--naming columns in the result set:
SELECT InvoiceNumber AS [InvoiceNumber], InvoiceDate AS Date, InvoiceTotal AS Total 
	FROM Invoices;

--no name for calculated column
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, InvoiceTotal - PaymentTotal AS FinalTotal
	FROM Invoices;

-- p. 71 coding expressions
-- concatenating string data
SELECT VendorCity, VendorState, VendorCity + VendorState AS Location
	FROM Vendors;

--concatenate using commas and spaces
SELECT VendorName, (VendorCity+', '+VendorState+' '+ VendorZipCode) AS Address
	FROM Vendors;

--include apostrophes
SELECT VendorName + '''s Address: ', VendorCity +', ' + VendorState + ' ' +VendorZipCode
	FROM Vendors;
--Select statement that calculates the balance due
SELECT InvoiceTotal, PaymentTotal, CreditTotal, 
InvoiceTotal - PaymentTotal - CreditTotal AS BalanceDue
	FROM Invoices;
--SELECT statement that uses parentheses to control the sequence of operations
SELECT InvoiceID, 
   InvoiceID +7 * 3 AS OrderOfPrecedence,
   (InvoiceID +7) * 3 AS AddFirst
	FROM Invoices
ORDER BY InvoiceID;
--Select statement that uses the modulo operator
SELECT InvoiceID,
	InvoiceID / 10 AS Quotient,
	InvoiceID % 10 AS Remainder
FROM Invoices
ORDER BY InvoiceID;
--SELECT statement that uses the LEFT function
SELECT VendorContactFName, VendorContactLName,
LEFT(VendorContactFName, 1) +
LEFT(VendorContactLName, 1) AS Initials
	FROM Vendors;
--A SELECT statement that uses the CONVERT function function
SELECT 'Invoice: #' + InvoiceNumber
+ ',dated ' + CONVERT(char(8), PaymentDate, 1)
+ ' for $' +CONVERT(varchar(9), PaymentTotal, 1)
	FROM Invoices;
	--A SELECT statement that computes the age of an invoice
SELECT InvoiceDate,
	GETDATE() AS 'Today''s Date',
	DATEDIFF(day, InvoiceDate, GETDATE()) AS Age 
FROM Invoices
--A SELECT statement that returns all rows
SELECT VendorCity, VendorState 
FROM Vendors
ORDER BY VendorCity;
--A SELECT statement that eliminates duplicate rows
SELECT DISTINCT VendorCity, VendorState
FROM Vendors;
--A SELECT statement with a TOP clause
SELECT TOP 5 VendorID, InvoiceTotal
FROM Invoices
ORDER BY InvoiceTotal DESC;
--A SELECT statement with a TOP clause and the PERCENT keyword
SELECT TOP 5 PERCENT VendorID, InvoiceTotal
FROM Invoices
ORDER BY InvoiceTotal DESC;
--A SELECT statement with a TOP clause and the WITH TIES keyword
SELECT TOP 5 WITH TIES VendorID, InvoiceTotal
FROM Invoices
ORDER BY InvoiceTotal DESC;
--How to use the and or and not logical operators
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal,
InvoiceTotal - PaymentTotal - CreditTotal AS BalanceDue
FROM Invoices
WHERE InvoiceDate > '01/01/2023' OR InvoiceTotal > 500
AND InvoiceTotal - PaymentTotal - CreditTotal > 0;
-- An ORDER BY clause that sorts by one column in ascending sequence
SELECT VendorName,
	VendorCity + ', ' + VendorState + ' ' + VendorZipCode AS Address
FROM Vendors
ORDER BY VendorName;
-- An ORDER BY clause that sorts by one column in descending sequence
SELECT VendorName,
	VendorCity + ', ' + VendorState + ' ' + VendorZipCode AS Address
FROM Vendors
ORDER BY VendorName DESC;
-- An ORDER BY clause that sorts by three columns
SELECT VendorName,
	VendorCity + ', ' + VendorState + ' ' + VendorZipCode AS Address
FROM Vendors
ORDER BY VendorState, VendorCity, VendorName;
--An ORDER BY clause that uses an alias
SELECT VendorName,
	VendorCity + ', ' + VendorState + ' ' + VendorZipCode AS Address
FROM Vendors
ORDER BY Address, VendorName;
--An ORDER BY clause that uses an expression
SELECT VendorName,
	VendorCity + ', ' + VendorState + ' ' + VendorZipCode AS Address
FROM Vendors
ORDER BY VendorContactLName + VendorContactFName;
--An ORDER BY clause that uses column positions
SELECT VendorName,
	VendorCity + ', ' + VendorState + ' ' + VendorZipCode AS Address
FROM Vendors
ORDER BY 2, 1;
--The syntax of the ORDER BY clause for retrieving a range of rows
--ORDER BY order_by_list
--OFFSET offset_row_count {ROW|ROWS}
--[FETCH {FIRST|NEXT} fetch_row_count {ROW|ROWS

--An ORDER BY clause that retrieves the first five rows
SELECT VendorID, InvoiceTotal
FROM Invoices
	ORDER BY InvoiceTotal DESC
	OFFSET 0 ROWS
FETCH FIRST 5 ROWS ONLY;
--An ORDER BY clause that retrieves rows 11 through 20
SELECT VendorName, VendorCity, VendorState, VendorZipCode
FROM Vendors
	WHERE VendorState = 'CA'
	ORDER BY VendorCity
	OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;

--Exercise 1
SELECT VendorContactFName, VendorContactLName, VendorName 
FROM Vendors
ORDER BY VendorContactLName;
--Exercise 2
SELECT InvoiceNumber AS Number,
	InvoiceTotal AS Total,
	PaymentTotal + CreditTotal AS Credits,
	InvoiceTotal - (PaymentTotal + CreditTotal) AS balance 
FROM Invoices;
--Exercise 3
SELECT (VendorContactLName +', '+ VendorContactFName) as FullName
FROM Vendors
ORDER BY VendorContactLName;
--Exercise 4
SELECT InvoiceTotal, (InvoiceTotal/10) AS '10 % of Invoice Total', (InvoiceTotal *1.10) AS 'Invoice Total + 10%'
FROM Invoices
ORDER BY InvoiceTotal DESC;

--Chapter 3 ex 3
SELECT VendorContactLName +', ' + VendorContactFName 'Full Name'
	FROM Vendors
ORDER BY 'Full Name';
--#6
SELECT VendorContactLName +', ' + VendorContactFName 'Full Name'
	FROM Vendors
WHERE VendorContactLName IN ('A', 'B', 'C', 'E')
ORDER BY 'Full Name';
--Exercise 1 Chapter 4 pg. 132
--inner join Vendors - Invoices
-- If a vendorId is NOT in the invoices table, then that vendor
-- has no invoices
--The Question is really querying all vendors who have invoices
SELECT *
	FROM Vendors
	JOIN Invoices ON Invoices.VendorID = Vendors.VendorID;
-- wrong way to write an inner join
--SELECT *
	--FROM Vendors, Invoices
--WHERE Vendors.VendorID = Invoices.VendorID;


--Same Join but use Aliases
SELECT *
	FROM Vendors AS V
	JOIN Invoices AS I ON V.VendorID = I.VendorID;
--same join query with aliases but no AS keyword
SELECT *
FROM Vendors V
	JOIN Invoices I ON V.VendorID = I.VendorID;
--same join query different formatting
SELECT *
	FROM Vendors V
	JOIN Invoices I
	  ON V.VendorID = I.VendorID;
--longer alias names, still abbreviations
SELECT Vnd.VendorID, VendorName, InvoiceID, InvoiceNumber, InvoiceTotal
FROM Vendors Vnd
JOIN Invoices Inv ON Vnd.VendorID = Inv.VendorID;
-- same join, but only display a few columns

--Write a SELECT statement that returns four columns
SELECT VendorName, InvoiceNumber, InvoiceDate, (InvoiceTotal - (PaymentTotal + CreditTotal)) AS Balance
	From Vendors Vnd
JOIN Invoices Inv ON Vnd.VendorID = Inv.VendorID
WHERE (InvoiceTotal - (PaymentTotal + CreditTotal)) > 0;

--Exercise 3 Chapter 4 pg. 132
SELECT VendorName, vnd.DefaultAccountNo, GLA.AccountDescription
	FROM Vendors Vnd
Join GLAccounts GLA ON Vnd.DefaultAccountNo = GLA.AccountNo;
--Exercise 5 Chapter 4 pg.133
SELECT  V.VendorName As Vendor,
		I.InvoiceDate AS 'Date',
		I.InvoiceNumber AS 'Number',
		li.InvoiceSequence AS '#',
		li.InvoiceLineItemAmount AS LineItem
	FROM Vendors V
JOIN Invoices I ON V.VendorID = I.VendorID
JOIN InvoiceLineItems li ON I.invoiceID = li.InvoiceID
ORDER BY Vendor, Date, Number, '#';
-- Exercise 7 Chapter 4 pg. 133
--Accounts table has 75 rows
--"accounts that have never been used"
--   that account number is not in the ILI table
-- outer join GLAccounts -> InvoiceLineItems
SELECT AccountDescription,
	GLA.AccountNo
	FROM GLAccounts GLA
	LEFT OUTER JOIN InvoiceLineItems ILI ON ILI.AccountNo = GLA.AccountNo
	WHERE ILI.AccountNo is NULL
ORDER BY GLA.AccountNo;

