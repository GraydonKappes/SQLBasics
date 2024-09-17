--Chapter 6 Subqueries

--p. 161
--show me the invoices w/ a total greater than the average InvoiceTotal
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
	FROM Invoices
  WHERE InvoiceTotal > (
    SELECT AVG(InvoiceTotal)
	  FROM Invoices)
  ORDER BY InvoiceTotal;

--p.163 an inner join and a subquery which does the same
--join invoices and vendors, display the inv #, inv date
--, and the inv total or invoices for vendors in CA
SELECT *
  FROM Invoices I
  JOIN Vendors V ON V.VendorID = I.VendorID
WHERE VendorState = 'CA'
ORDER BY InvoiceDate;

--Same query restated with a subquery
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
  FROM Invoices I
  WHERE VendorID IN (
  SELECT VendorID
    FROM Vendors
WHERE VendorState = 'CA')
ORDER BY InvoiceDate;

--