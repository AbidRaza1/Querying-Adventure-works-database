SELECT YEAR(SellStartDate) SellStartYear, ProductID, Name
FROM SalesLT.Product
ORDER BY SellStartYear;


SELECT YEAR(SellStartDate) SellStartYear, DATENAME(mm,SellStartDate) SellStartMonth,
		DAY (SellStartDate) SellStartDay, DATENAME(dw, SellStartDate) SellStartWeekday,
		ProductID, Name
FROM
		SalesLT.Product

ORDER BY	SellStartYear

SELECT DATEDIFF(yy,SellStartDate, GETDATE()) YearsSold, ProductID, Name
FROM SaleslT.Product
ORDER BY ProductID


SELECT UPPER(Name) AS ProductName
FROM SalesLT.Product


SELECT Name, ProductNumber, LEFT(ProductNumber, 2) AS ProductType
FROM SaleslT.Product

SELECT Name, ProductNumber, LEFT(ProductNumber, 2) AS ProductType,
SUBSTRING(ProductNumber,CHARINDEX( '-',ProductNumber) + 1 , 4) AS ModelCode,
SUBSTRING(ProductNumber, LEN(ProductNumber)-CHARINDEX('-',REVERSE(RIGHT(ProductNumber,3)))+2,2) AS SizeCode
FROM SalesLT.Product

-- TIP FOR ABOVE STATEMENT -- USE IT SEPARATELY WITH SELECT STATEMENT

----LOGICAL FUNCTIONS---

SELECT Name, Size AS NumericSize
FROM SalesLT.Product
WHERE ISNUMERIC(Size) = 1;

SELECT Name , IIF(ProductCategoryID IN (5,6,7), 'Bike', 'Other') ProductType
FROM SalesLT.Product

SELECT Name, IIF(ISNUMERIC(Size) = 1 , 'Numeric' , 'Non-Numeric') SizeType
FROM SalesLT.Product

SELECT prd.Name AS ProductName, cat.Name AS Category,
CHOOSE (cat.ParentProductCategoryID, 'Bikes' ,'Components', 'Clothing' , 'Accessories') AS ProductType
FROM SalesLT.Product AS prd
JOIN SalesLT.ProductCategory AS cat
ON prd.ProductCategoryID = cat.ProductCategoryID






SELECT YEAR(SellStartDate) SellStartYear,ProductID,Name
FROM SalesLT.Product
ORDER BY SellStartYear;


SELECT YEAR(SellStartDate) SellStartYear, DATENAME(mm,SellStartDate) SellStartMonth,
		DAY(SellStartDate) SellStartDay, DATENAME(dw,SellStartDate) SellStartWeekday,
		ProductID, Name

	FROM SalesLT.Product
	ORDER BY SellStartYear;

	SELECT 
		DATEDIFF(yy, SellStartDate, GETDATE()) YearSold,ProductID,Name
		FROM SalesLT.Product
		ORDER BY ProductID

	SELECT UPPER(Name) AS ProductName
	FROM SalesLT.Product;

	SELECT CONCAT(FirstName + '  ' , LastName) AS FullName
	FROM SalesLT.Customer

	SELECT Name, ProductNumber, LEFT(ProductNumber, 2) AS ProductType
	FROM SalesLT.Product

	


SELECT Name, ProductNumber, LEFT(ProductNumber,2) AS ProductType,
	SUBSTRING(ProductNumber, CHARINDEX('-',ProductNumber) + 1 , 4) As ModelCode
	FROM SalesLt.Product

	SELECT Name, ProductNumber, LEFT(ProductNumber,2) AS ProductType,
	SUBSTRING(ProductNumber, CHARINDEX('-',ProductNumber) + 1 , 4) As ModelCode,
	SUBSTRING(ProductNumber,LEN(ProductNumber) - CHARINDEX ('-' , REVERSE(RIGHT(ProductNumber,3)))+2,2)
	AS SizeCode
	FROM SalesLT.Product

	SELECT c.SalesPerson, ISNULL(SUM(oh.SubTotal),0.00) SalesRevenue
	FROM SalesLT.Customer as c
	LEFT JOIN	SalesLT.SalesOrderHeader as oh
	ON c.CustomerID = oh.CustomerID
	GROUP BY c.SalesPerson
	ORDER BY SalesRevenue DESC

	SELECT c.Salesperson, CONCAT(c.FirstName + ' ' , c.LastName) AS Customer,ISNULL(SUM(oh.SubTotal),0.00) SalesRevenue
	FROM SalesLT.Customer AS c
	LEFT JOIN SalesLT.SalesOrderHeader AS oh
	ON c.CustomerID = oh.CustomerID
	GROUP BY c.SalesPerson, CONCAT(c.FirstName + ' ' , c.LastName)
	ORDER BY SalesRevenue DESC, Customer;

	SELECT Name,Size AS NumericSize
	FROM SalesLT.Product
	WHERE ISNUMERIC (Size) = 1

	SELECT Name, IIF(ProductCategoryID IN (5,6,7), 'Bike', 'Other') ProductType
	FROM SalesLT.Product

	SELECT Name, IIF(ISNUMERIC (Size) = 1 , 'Numeric', 'Non-Numeric') SizeType
	FROM SalesLT.Product

	SELECT prd.Name AS ProductName, cat.name AS Category,
	CHOOSE (cat.ParentProductCategoryID, 'Bikes', 'Components', 'Clothing' ,'Accessories') AS ProductType
	FROM SalesLT.Product AS prd
	JOIN SalesLT.ProductCategory AS cat
	ON prd.ProductCategoryID = cat.ProductCategoryID

	SELECT TOP(100) ProductID, Name, ListPrice,
	RANK() OVER (ORDER BY ListPrice DESC) AS RankByPrice
	FROM SalesLT.Product AS p
	ORDER BY RankByPrice;
	

	SELECT TOP(90) ProductID, Name, ListPrice,
	RANK () OVER (ORDER BY ListPrice DESC) AS Pricy
	FROM SalesLT.Product as p
	ORDER BY Pricy;

	SELECT c.Name AS Category, p.Name AS Product, ListPrice,
	RANK() OVER (PARTITION BY c.Name ORDER BY ListPrice DESC) as RankByPrice
	FROM SalesLT.Product AS p
	JOIN SalesLT.ProductCategory as c
	ON p.ProductCategoryID = c.ProductCategoryID
	ORDER BY Category,RankByPrice


	SELECT COUNT(*) AS Products, COUNT(DISTINCT ProductCategoryID) AS Categories, AVG(ListPrice) AS AveragePrice
	FROM SalesLT.Product;

	SELECT COUNT(p.ProductID) BikeModels, AVG( p.ListPrice) AveragePrice
	FROM SalesLT.Product AS p
	JOIN SalesLT.ProductCategory AS c
	ON p.ProductCategoryID = c.ProductCategoryID
	WHERE c.Name LIKE '%Bikes'

	SELECT ProductID, SUM(sod.OrderQty) as Quantity
	FROM SalesLT.SalesOrderDetail AS sod
	JOIN SalesLT.SalesOrderHeader AS soh
	ON sod.SalesOrderID = soh.salesOrderID
	WHERE YEAR (soh.OrderDate) = 2008
	GROUP BY ProductID

