SELECT ProductID,Name,ROUND( Weight,0) AS ApproxWeight,
YEAR(SellStartDate)SellStartDate,DATENAME(m,SellStartDate)SellStartMonth
FROM SalesLT.Product








SELECT CompanyName,TotalDue,
RANK() OVER (ORDER BY TOTALDUE DESC) AS RankbyTotalDue
FROM SalesLT.SalesOrderHeader
JOIN SalesLT.Customer
ON SalesLT.Customer.CustomerID = SalesLT.SalesOrderHeader.CustomerID 

ORDER BY RankbyTotalDue;



SELECT Name, SUM(LineTotal) AS Revenue

FROM SalesLT.Product

FULL JOIN SalesLT.SalesOrderDetail

ON SalesOrderDetail.ProductID = SalesLT.Product.ProductID

GROUP BY Name 
ORDER BY Revenue DESC
ORDER BY LINE TOTAL








