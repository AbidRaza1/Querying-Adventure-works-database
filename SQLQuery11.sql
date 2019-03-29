

SELECT MAX(UnitPrice) FROM SalesLT.SalesOrderDetail

SELECT * FROM SalesLT.Product
WHERE ListPrice >
					(SELECT MAX(UnitPrice) FROM SalesLT.SalesOrderDetail)

SELECT CustomerID, SalesOrderID
FROM SalesLT.SalesOrderHeader AS S01
ORDER BY CustomerID, SalesOrderID

SELECT CustomerID, SalesOrderID, OrderDate
FROM SalesLT.SalesOrderHeader AS SO1
WHERE orderdate =
	(SELECT MAX(orderdate)
	FROM SalesLT.SalesOrderHeader)

SELECT CustomerID, SalesOrderID, OrderDate
FROM SalesLT.SalesOrderHeader AS SO1
WHERE orderdate =
	(SELECT MAX(orderdate)
	FROM SalesLT.SalesOrderHeader AS SO2
	WHERE SO2.CustomerID = SO1.CustomerID)
	ORDER BY CustomerID

	SELECT *
	FROM SalesLT.SalesOrderDetail
	
	SELECT *
	FROM SalesLT.Product




	SELECT ProductID, Name, ListPrice
FROM SalesLT.Product
WHERE ProductID IN
  -- select ProductID from the appropriate table
  (SELECT ProductID FROM SalesLT.SalesOrderDetail
   WHERE UnitPrice < 100)
AND ListPrice >= 100
ORDER BY ProductID;

-- select SalesOrderID, CustomerID, FirstName, LastName, TotalDue from the appropriate tables





sp_helptext'udfMaxUnitPrice'



SELECT SOH.SalesOrderID, MUP.MaxUnitPrice
FROM SalesLT.SalesOrderHeader as SOH
CROSS APPLY SalesLT.udfMaxUnitPrice(SOH.SalesPrderID) AS MUP
ORDER BY SOH.SalesOrderID

SELECT * FROM SalesLT.CustomerAddress


SELECT * FROM SalesLT.Address
















