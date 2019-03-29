
SELECT Category, COUNT(ProductID) AS Products
FROM (SELECT p.ProductID, p.Name AS Product, c.Name As Category 
		FROM SalesLT.Product AS p
		JOIN SalesLT.ProductCategory AS C
		ON p.ProductCategoryID = c.ProductCategoryID) AS ProdCats

		GROUP BY Category
		ORDER BY Category

		
		WITH OrgReport(ManagerID, EmployeeID, EmployeeName,Level)
		AS
		(SELECT e.ManagerID, e.EmployeeID, e.EmployeeName, 0
		FROM SalesLT.Employee AS e
		WHERE ManagerID is NULL 
		UNION ALL
		SELECT e.ManagerID, e.EmployeeID,e.EmployeeName,Level+1
		FROM SalesLT.Employee as e
		INNER JOIN OrgReport AS o 
		ON e.ManagerID = e.EmployeeID)
		SELECT * FROM OrgReport
		OPTION (MAXRECURSION 3);

		
		
		WITH ProductsByCategory(ProductID,ProductName,Category)
		AS
		(
			SELECT p.ProductID, p.Name, c.Name As Category
			FROM SalesLT.Product as p
			JOIN SalesLT.ProductCategory AS c
			ON p.ProductCategoryID = c.ProductCategoryID

		)
SELECT Category,COUNT(ProductID) AS products
FROM ProductsByCategory
GROUP BY Category
ORDER BY Category


SELECT * FROM SalesLT.Employee









