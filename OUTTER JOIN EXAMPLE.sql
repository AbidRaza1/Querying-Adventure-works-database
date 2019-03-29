


SELECT 
		c.CustomerID , p.ProductID

FROM	
		SalesLT.Customer as c

FULL JOIN	
		
		SalesLT.SalesOrderHeader as oh
		
ON		
	
		c.CustomerID = oh.CustomerID

FULL JOIN 

		SalesLT.SalesOrderDetail as od

ON 
		oh.SalesOrderID = od.SalesOrderID

FULL JOIN

		SalesLT.Product as p

ON 
		p.ProductID = od.ProductID

WHERE  
		oh.SalesOrderID IS NULL

ORDER BY

		ProductID , CustomerID