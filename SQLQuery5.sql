
CREATE Table #Colors
(Color VARCHAR(15));

INSERT INTO #Colors
SELECT DISTINCT Color From SalesLT.Product

SELECT * FROM #Colors





DECLARE @Colors 
AS TABLE(Color varchar(15));



INSERT INTO @Colors
SELECT DISTINCT Color FROM SalesLT.Product 

SELECT * FROM  @Colors








CREATE FUNCTION SalesLT.udfCustomersbycity(@City as Varchar(20))
RETURNS TABLE 
AS
RETURN
		(SELECT C.CustomerID, FirstName, LastName, AddressLine1, City, StateProvince
		FROM SalesLT.Customer C JOIN SalesLT.customerAddress CA
		ON C.CustomerID = CA.CustomerID
		JOIN SalesLT.Address A ON CA.AddressID = A.AddressID
		WHERE City = @City);

		SELECT * FROM SalesLT.udfCustomerbycity('Mexico')








SELECT Category, Count(ProductID) AS Products
FROM (SalesLT.Product as p
join SalesLT.ProductCategory As c
on p.ProductCategoryID = c.ProductCategoryID) AS ProdCats
GROUP BY Category
ORDER BY Category


---USING CTE

WITH ProductsByCategory(ProductID, ProductName, Category)
 AS
 ( 
	SELECT p.ProductID,p.Name, c.Name AS Category
	FROM SalesLT.Product AS p
	JOIN SalesLT.ProductCategory as c
	ON p.ProductCategoryID = c.ProductCategoryID
	)

	SELECT Category, COUNT(ProductID) AS Products
	FROM ProductsByCategory
	GROUP BY Category



	----USING RECURSIVE----

	WITH OrgReport(ManagerID,EmployeeID,EmployeeName,Level)
	AS
	(
	-----Acnhor query-----
	SELECT e.ManagerID, e.EmployeeID, EmployeeName, 0
	FROM SalesLT.Employee As e
	WHERE ManagerID IS NULL

	UNION ALL

	----Recursive Query--
	SELECT e.ManagerID, e.EmployeeID, e.EmployeeName,Level+1
	FROM SalesLT.Employee AS e
	INNER JOIN OrgReport AS o On e.ManagerID = o.EmployeeID
	)
	SELECT * FROM OrgReport
	OPTION (MAXRECURSION 3);





	ORDER BY Category





	SELECT * FROM SalesLT.Product

	SELECT * FROM SalesLT.vProductModelCatalogDescription


	SELECT P.ProductID, P.Name as ProductName, PM.Name, PM.Summary
	FROM SalesLT.Product AS P
	JOIN SalesLT.vProductModelCatalogDescription AS PM 
	ON P.ProductModelID = PM.ProductModelID





	DECLARE @Color
	AS TABLE (Color varchar(15))
	INSERT INTO @Color







































