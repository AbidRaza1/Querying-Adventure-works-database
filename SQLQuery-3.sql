----NULL NUMBERS = 0----
SELECT NAME , ISNULL(TRY_CAST(Size AS INTEGER),0) AS NUMERICSIZE
FROM SalesLT.Product

----NULL strings = blank NULL----
SELECT ProductNumber , ISNULL(Color,' ')  + ' , ' + ISNULL(Size, ' ')  AS ProductDetails
FROM SalesLT.Product;

----MultiColor = NULL----
SELECT Name, NULLIF(Color, 'Multi')  AS SingleColor
FROM SalesLT.Product;

----Find First Non-NULL Date----
SELECT Name, COALESCE(DiscontinuedDate, SellEndDate, SellStartDate) AS LastActivity
FROM SalesLT.Product

----Searched Case----
SELECT Name,
	CASE 
	WHEN SellEndDate IS NULL THEN 'On Sale'
	Else 'Discontinued'
	END AS SalesStatus
	FROM SalesLT.Product

---------Simple CASE------

SELECT Name,
		CASE Size
		WHEN  'S' THEN 'Small'
		WHEN  'M' THEN 'Medium'
		WHEN  'L' THEN 'Large'
		WHEN  'XL' THEN 'Extra-Large'
		ELSE ISNULL(Size, 'n/a')
		END AS ProductSize
FROM SalesLT.Product











