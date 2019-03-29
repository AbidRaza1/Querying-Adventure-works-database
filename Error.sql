


INSERT INTO SalesLT.SalesOrderDetail(SalesOrderID, OrderQty, ProductID, UnitPrice, UnitPriceDiscount)
VALUES
		(100000,1,680,1431.50,0.00)


		------------Raise an Error with RAISERROR----------

UPDATE SalesLT.Product
SET DiscontinuedDate = GETDATE()
WHERE ProductID = 0;
IF @@ROWCOUNT < 1

RAISERROR('The Product was not found -no products have been updated' , 16 , 0);



	BEGIN TRY
			UPDATE SalesLT.Product
			SET productNumber = ProductID / ISNULL(Weight,0);

	END TRY 
	BEGIN CATCH 
				PRINT 'The following error occured'
				PRINT ERROR_MESSAGE();
	END CATCH


	------------CATCH AND RETHROW-----------

	BEGIN TRY 
			UPDATE SalesLT.Product
			SET ProductNumber = ProductID / ISNULL(Weight,0)
	END TRY
	BEGIN CATCH
			PRINT 'The following error occured';
			PRINT ERROR_MESSAGE();
			THROW;
	END CATCH

	----------------CATCH, LOG AND THROW A CUSTOM ERROR----------------
	BEGIN TRY
	UPDATE SalesLT.Product
	SET ProductNumber = ProductID/ ISNULL (Weight,0);
	END TRY
	BEGIN CATCH
	DECLARE @ErrorLogID as INT, @ErrorMsg as VARCHAR(250);
	EXECUTE dbo.uspLogError @ErrorLogID OUTPUT;
	SET @ErrorMsg = ' The update failed because an error. View error # '
						+ CAST(@ErrorLogID as varchar)
						+ 'in the error log for details';
			THROW 50001, @ErrorMsg,0;
	END CATCH

	select * FROM dbo.ErrorLog 







