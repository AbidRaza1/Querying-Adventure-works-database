
----------------SQL Procedures--------------------

DECLARE @Colors				
AS TABLE (Color nvarchar(15))
INSERT INTO @Colors		
SELECT DISTINCT COLOR FROM SalesLT.Product
SELECT P.ProductID, P.Name, P.Color from SalesLT.Product as P 
WHERE Color IN (SELECT Color FROM @Colors)

SELECT * FROM SalesLT.Product







SELECT CompanyName, FirstName , SubTotal
FROM SalesLT.Customer
JOIN SalesLT.SalesOrderHeader
ON SalesLT.SalesOrderHeader.CustomerID  = SalesLT.Customer.CustomerID

SELECT orderyear, COUNT(Distinct CustomerID) AS cust_count
FROM
	(SELECT YEAR(orderdate) AS orderyear, CustomerID
	FROM SalesLT.SalesOrderHeader) AS derived_year
	GroUP BY orderyear;

	SELECT orderyear, COUNT(Distinct CustomerID) 
	FROM (SELECT

------------Creating View----------------

	CREATE VIEW SalesLT.vSalesOrders
	AS
	SELECT oh.SalesOrderID, oh.Orderdate, oh.CustomerID, od.LineTotal,od.ProductID,od.OrderQty
	FROM SalesLT.SalesOrderHeader AS oh
	JOIN SalesLT.SalesOrderDetail AS od
	ON od.SalesOrderID = oh.SalesOrderID;
	
	SELECT SalesOrderID , CustomerID , ProductID
	FROM SalesLT.vSalesOrders
	ORDER BY SalesOrderID

	CREATE VIEW SalesLT.vCustomerAddress
	AS 
	SELECT C.CustomerID, FirstName, LastName, AddressLine1, City,StateProvince
	FROM SalesLT.Customer AS C 
	JOIN SalesLT.CustomerAddress AS CA
	ON 
	C.CustomerID = CA.CustomerID
	JOIN SalesLT.Address as A
	ON CA.AddressID = A.AddressID

	SELECT * FROM SalesLT.vCustomerAddress

	SELECT c.StateProvince, c.City, ISNULL(SUM(s.TotalDue),0.00) AS Revenue
	FROM SalesLT.vCustomerAddress AS c
	LEFT JOIN SalesLT.SalesOrderHeader AS s
	ON s.CustomerID = c.CustomerID
	GROUP BY c.StateProvince, c.city
	ORDER BY c.StateProvince, Revenue DESC;

	SELECT * FROM SalesLT.vCustomerAddress 
	SELECT * FROM SalesLT.SalesOrderHeader



	CREATE TABLE #tmpProducts
	(ProductID int, Productname varchar(50));

	DECLARE @varProducts table
	(ProductID INTEGER, ProductName varchar(50))

	SELECT * FROM @varProducts


CREATE TABLE #Colors
(Color varchar(15));
INSERT INTO #Colors
SELECT DISTINCT Color FROM SalesLT.Product;
SELECT * FROM #Colors










	












						



