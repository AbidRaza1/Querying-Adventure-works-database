
       SELECT * FROM SalesLT.SalesOrderHeader
	   1
	   2



	   SELECT * FROM SalesLT.Customer

SELECT c.(c.CompanyName, c.ContactName(' (' + c.FirstName + ' ', c.LastName + ')')), SOH.TotalDue 
	 FROM SalesLT.SalesOrderHeader AS SOH
	 JOIN SalesLT.Customer AS c 
	 ON SOH.CustomerID = c.CustomerID


SELECT  COMPANYNAME, Sum(TotalDue) AS rEVENUE
FROM 
(SELECT SOH.TotalDue,c.COMPANYNAME FROM SalesLT.cUSTOMER AS C
JOIN SALESLT.SalesOrderHeader AS SOH
ON c.CustomerID = soh.CustomerID)
ORDER BY cOMPANYnAME
GROUP BY cOMPANYnAME






			WITH Details(CompanyName,TotalDue)
			AS
			(SELECT c.CompanyName,soh.TotalDue
			FROM SalesLT.Customer AS C
			JOIN SalesLT.SalesOrderHeader AS SOH
			ON C.CUSTOMERID = SOH.CUSTOMERID
			)
			SELECT CompanyName,  SUM(TotalDue) as revenue
			FROM Details
			Group by CompanyName 
			ORDER BY CompanyName 


			SELECT * 
			FROM SalesLT.SalesOrderHeader


			SELECT CompanyContact, SUM(TotalDue) AS Revenue
FROM                
	(SELECT CONCAT(c.CompanyName, c.FirstName(' (' + c.FirstName + ' ', c.LastName + ')')), SOH.TotalDue
	 FROM SalesLT.SalesOrderHeader AS SOH
	 JOIN SalesLT.Customer AS c
	 ON SOH.CustomerID = c.CustomerID) AS CustomerSales(CompanyContact, SalesAmount)        
GROUP BY CompanyContact
ORDER BY CompanyContact;


SELECT companyname, firstName + ' ' + lastName from SalesLT.Customer



SELECT SUM(TOTALDUE) AS REVENUE
FROM SalesLT.SalesOrderHeader





       
SELECT CompanyContact, (totaldue) AS Revenue
FROM   
	(SELECT CONCAT(c.CompanyName, CONCAT(' (' + c.FirstName + ' ', c.LastName + ')')), SOH.TotalDue
	 FROM SalesLT.SalesOrderHeader AS SOH
	 JOIN SalesLT.Customer AS c
	 ON SOH.CustomerID = c.CustomerID) AS CustomerSales(CompanyContact, SalesAmount)    
GROUP BY CompanyContact
ORDER BY CompanyContact;
       


	    
	 SELECT CompanyName, SUM(totaldue) as Revuneue
	 FROM SalesLT.SalesOrderHeader
















