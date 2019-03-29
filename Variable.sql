





----------------------SEARCH BY CITY USING A VARIABLE---------------------


		DECLARE @City VARCHAR(20) = 'Toronto'
		SELECT FirstName + ' ' + LastName as [Name], AddressLine1 as Address, City
		FROM SalesLT.Customer as c
		JOIN SalesLT.CustomerAddress as ca
		on c.customerid = ca.customerid
		join SalesLT.Address AS A
		ON ca.AddressID = a.AddressID
		where city = @City

		DECLARE @City VARCHAR(20) = 'Toronto'
		SET @cITY = 'BELLEVUE'
		SELECT FirstName + ' ' + LastName as [Name], AddressLine1 as Address, City
		FROM SalesLT.Customer as c
		JOIN SalesLT.CustomerAddress as ca
		on c.customerid = ca.customerid
		join SalesLT.Address AS A
		ON ca.AddressID = a.AddressID
		where city = @City
---------------------USE A VARIABLE AS AN OUTPUT--------------------------------


		DECLARE @Result money
		SELECT @Result = Max(TotalDue)
		FROM SalesLT.SalesOrderHeader

		PRINT @rESULT


		PRINT @Result
