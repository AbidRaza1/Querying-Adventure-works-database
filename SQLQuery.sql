CREATE VIEW salesLT.vCustomerAddress
AS 
SELECT C.CustomerID,FirstName, LastName, AddressLine1,City, StateProvince
FROM SalesLT.Customer AS C 
JOIN SalesLT.CustomerAddress AS CA
ON C.CustomerID = CA.CustomerID
JOIN SalesLT.Address AS A
ON CA.AddressID = A.AddressID

SELECT CustomerID, City
FROM SalesLT.vCustomerAddress

SELECT C.StateProvince, C.City, ISNULL(SUM(S.TotalDue),0.00) AS REVENUE
FROM SalesLT.vCustomerAddress AS C
LEFT JOIN SalesLT.SalesOrderHeader AS S
ON S.CustomerID = C.CustomerID
GROUP BY C.StateProvince, C.City
ORDER BY C.StateProvince, Revenue DESC
