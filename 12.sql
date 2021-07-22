

                                           ---------------LOOPING--------------

DECLARE @Counter int=1

WHILE @Counter <= 5

BEGIN 

	INSERT SalesLT.ProductDescription(Description)
	VALUES('ROW' + CONVERT(varchar(5), @Counter))
	SET @Counter = @Counter+1

END

SELECT Description from SALESLT.pRODUCTdESCRIPTION

                                         -------------creating procedure--------------


CREATE PROCEDURE SalesLT.GetProductsbycategory(@CategoryID INT = NULL)
AS

	IF @CATEGORYID IS NULL
				SELECT ProductID, Name, Color, Size, ListPrice
				FROM SalesLT.Product
	ELSE 
				SELECT ProductID,name,Color,Size,ListPrice
				FROM SalesLT.Product
				WHERE ProductCategoryID = @CategoryID;

	EXECUTE SalesLT.GetProductsbycategory 6;




------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
















