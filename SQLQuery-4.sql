SELECT DISTINCT ISNULL(Color,'None') AS Color FROM SalesLT.Product ORDER BY Color

SELECT DISTINCT ISNULL(Color,'None') AS Color, ISNULL(Size, '-') AS Size FROM SalesLT.Product ORDER BY Color,Size

SELECT TOP 100 Name, ListPrice FROM SalesLT.Product ORDER BY ListPrice DESC;

SELECT Name,ListPrice
FROM SalesLT.Product
ORDER BY Name,ListPrice
OFFSET 15 ROWS FETCH FIRST 15 ROWS ONLY









