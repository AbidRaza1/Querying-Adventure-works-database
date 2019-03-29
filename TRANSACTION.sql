


-------------------No Transaction--------

BEGIN TRY 
	INSERT INTO SalesLT.SalesOrderHeader(DueDate,CustomerID,ShipMethod)
	VALUES
	(DATEADD (dd,7,GETDATE()),1,'STD DELIVERY');

	DECLARE @SalesorderID int = SCOPE_identity( );
	INSERT INTO SalesLT.SalesOrderDetail(SalesOrderID,OrderQty, ProductID,UnitPrice,UnitPriceDiscount)
	VALUES
	(@SalesorderID,1,99999,1431.50,0.00);

END TRY
		BEGIN CATCH 
				PRINT ERROR_MESSAGE();
				END CATCH





		------------------View Orphaned orders----------------

		SELECT h.SalesOrderID, h.DueDate, h.CustomerID, h.ShipMethod, d.SalesOrderDetailID
		FROM SalesLT.SalesOrderHeader as h
		LEFT JOIN SalesLT.SalesOrderDetail as d
		ON d.SalesOrderID = h.SalesOrderID
		WHERE d.SalesOrderDetailID is null ;

		----------Manually Deleting Orphaned Row------------------

		DELETE FROM SalesLT.SalesOrderHeader
		WHERE @SalesorderID = SCOPE_IDENTITY()



		----------Use a transaction-----
		
		BEGIN TRY 
	INSERT INTO SalesLT.SalesOrderHeader(DueDate,CustomerID,ShipMethod)
	VALUES
	(DATEADD (dd,7,GETDATE()),1,'STD DELIVERY');

	DECLARE @SalesorderID int = SCOPE_identity( );
	INSERT INTO SalesLT.SalesOrderDetail(SalesOrderID,OrderQty, ProductID,UnitPrice,UnitPriceDiscount)
	VALUES
	(@SalesorderID,1,99999,1431.50,0.00);

	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
	IF @@TRANCOUNT > 0
	BEGIN 
		PRINT XACT_STATE( );
		ROLLBACK TRANSACTION;
		
	END
	PRINT ErROR_MESSAGE();
	THROW 50001, 'An insert failed. The transaction was cancelled' , 0;
	END CATCH	




