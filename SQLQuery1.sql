
SELECT MAX(UnitPrice) 
FROM SalesLT.SalesOrderDetail

SELECT *
FROM SalesLT.Product
WHERE ListPrice > 1970.87

SELECT * 
FROM SalesLT.Product
WHERE ListPrice > 
		(SELECT MAX(UnitPrice)
		FROM SalesLT.SalesOrderDetail)

SELECT SOH.SalesOrderID, MUP.MaxUnitPrice
FROM SalesLT.SalesOrderHeader AS SOH
CROSS APPLY SalesLT.udfMaxUnitPrice(SOH.SalesOrderID) AS MUP
ORDER BY SOH.SalesOrderID

