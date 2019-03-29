---LIST INFORMATION ABOUT PRODUCT MODEL ID 6---

SELECT Name, Color, Size FROM SalesLT.Product WHERE ProductModelID = 6

---LIST INFORMATION ABOUT PRODUCTS THAT HAVE A PRODUCT NUMBER BEGINNING FR

SELECT ProductNumber,Name, ListPrice FROM SalesLT.Product WHERE ProductNumber LIKE '%FR'

---FILTER THE PREVIOUS QUERY TO ENSURE THAT THE PRODUCT NUMBER CONTAINS TWO SETS OF TWO DIGITS

SELECT ProductNumber, Name, ListPrice FROM SalesLT.Product WHERE ProductNumber LIKE 'FR-_[0-9][0-9]_-[0-9][0-9]'

---Find Products that have No Sell End Date---

SELECT Name FROM SalesLT.Product WHERE SellEndDate IS NOT NULL

---Find products that have a sell end date in 2006---

SELECT Name FROM SalesLt.Product WHERE SellEndDate BETWEEN '2006/1/1' AND '2006/12/31'

---Find Products that have a category ID 5,6 and 7---

SELECT Name, Color, Size, Weight, ListPrice FROM SalesLt.Product WHERE ProductCategoryID IN(5,6,7)

---Find Products that have a category ID of 5,6 or 7 and have a sell end date---

SELECT Name, Color, Size, Weight, ListPrice,SellEndDate FROM SalesLT.Product WHERE ProductCategoryID IN(5,6,7) AND SellEndDate IS NOT NULL



---BASIC INNER JOIN---

SELECT SalesLT.Product.Name AS ProductName, SalesLT.ProductCategory.Name AS Category 
FROM SalesLT.Product
INNER JOIN SalesLT.ProductCategory
ON SalesLT.Product.ProductCategoryID = SalesLT.ProductCategory.ProductCategoryID


----Table Alias----

SELECT p.Name AS ProductName, c.Name AS Category
FROM SalesLT.Product as p
INNER JOIN SalesLT.ProductCategory AS c
ON p.ProductCategoryID = c.ProductCategoryID

---Joining More Than two Table---

SELECT oh.OrderDate, oh.SalesOrderNumber, p.Name AS ProductName, od.OrderQty, od.UnitPrice, od.LineTotal
FROM SalesLT.SalesOrderHeader As oh	
JOIN SalesLT.SalesOrderDetail AS od
ON od.SalesOrderID = oh.SalesOrderID
JOIN SalesLT.Product AS p
ON od.ProductID = p.ProductID
ORDER BY oh.OrderDate, oh.SalesOrderID,od.SalesOrderDetailID;


---Multiple Join Prdeicates---
SELECT oh.OrderDate, oh.SalesOrderNumber, p.Name AS ProductName, od.OrderQty, od.UnitPrice, od.LineTotal
FROM SalesLT.SalesOrderHeader As oh	
JOIN SalesLT.SalesOrderDetail AS od
ON od.SalesOrderID = oh.SalesOrderID
JOIN SalesLT.Product AS p
ON od.ProductID = p.ProductID AND od.UnitPrice < p.ListPrice  ---Multiple Predicate---
ORDER BY oh.OrderDate, oh.SalesOrderID,od.SalesOrderDetailID;

SELECT 

















---Get all customers, with sales order for those who have bought anything---

SELECT Firstname, LastName, SalesOrderNumber
FROM SalesLT.Customer
LEFT OUTER JOIN SalesLT.SalesOrderHeader
ON SalesLT.Customer.CustomerID = SalesLT.SalesOrderHeader.CustomerID



---Return only Cunstomers who have not purchased anything---

SELECT Firstname, LastName, SalesOrderNumber
FROM SalesLT.Customer
LEFT OUTER JOIN SalesLT.SalesOrderHeader
ON SalesLT.Customer.CustomerID = SalesLT.SalesOrderHeader.CustomerID WHERE SalesOrderID IS NULL

































