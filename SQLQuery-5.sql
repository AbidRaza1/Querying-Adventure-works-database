CREATE TABLE SalesLT.Employee
(EmployeeID INT IDENTITY Primary key,
EmployeeName nvarchar(256),
ManagerID int);
GO


SELECT SalesLT.Customer.CompanyName , SalesLT.SalesOrderHeader.TotalDue, SalesLT.SalesOrderHeader.SalesOrderID
FROM SalesLT.Customer
JOIN SalesLT.SalesOrderHeader
ON SalesLT.Customer.CustomerID = SalesLT.SalesOrderHeader.CustomerID


SELECT c.CustomerID , p.ProductID
FROM   SalesLT.Customer as c
JOIN   SalesLT.SalesOrderHeader as oh
ON	   c.CustomerID = oh.CustomerID
JOIN	SalesLT.SalesOrderDetail as od
ON 	p.ProductID = od.ProductID































