
SELECT  CustomerID, SUM(TotalDue)
FROM SalesLT.SalesOrderHeader
GROUP BY CustomerID
ORDER BY CustomerID
			
		SELECT cat.ParentProductCategoryName,cat.ProductCategoryName,count(prd.Productid) as products
		FROM SalesLT.vGetAllCategories as cat
		LEFT JOIN SalesLT.product as prd
		ON prd.productcategoryid = cat.productcategoryid
		GROUP BY cat.ParentProductCategoryName, cat.ProductCategoryName
			
		----GROUP BY GROUPING SETS(cat.parentProductCategoryname,cat.productCategoryname,())----
			
		----GROUP BY ROLLUP (cat.parentproductCategoryName, cat.productCategoryname)----
			
		----GROUP BY CUBE(cat.parentproductcategoryname,cat.productcategoryname)----
			
		ORDER BY cat.ParentProductCategoryName,cat.productcategoryname;
			


		SELECT cat.ParentProductCategoryName,cat.ProductCategoryName,count(prd.Productid) AS products
		FROM SalesLT.vGetAllCategories as cat
		LEFT JOIN SalesLT.product as prd
		ON prd.productcategoryid = cat.productcategoryid
		GROUP BY 
		CUBE(cat.ParentProductCategoryName,cat.ProductCategoryName)
		ORDER BY cat.ParentProductCategoryName,cat.ProductCategoryName

	SELECT * from SalesLT.SalesOrderDetail
	SELECT * from SalesLT.Customer
	SELECT * from SalesLT.SalesOrderHeader