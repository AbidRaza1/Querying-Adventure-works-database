
SELECT * 
fROM SalesLT.Product

SELECT * 
fROM SalesLT.SalesOrderDetail


SELECT ProductID, Name, ListPrice
FROM SalesLT.Product
WHERE ListPrice >
(SELECT 
AVG(UnitPrice)
FROM SalesLT.SalesOrderDetail
WHERE SalesLT.SalesOrderDetail.ProductID = SalesLT.Product.ProductID)


SELECT ProductID, Name, StandardCost
FROM SalesLT.Product
WHERE StandardCost >
(SELECT 
AVG(UnitPrice)
FROM SalesLT.SalesOrderDetail
WHERE SalesLT.SalesOrderDetail.ProductID = SalesLT.Product.ProductID)















