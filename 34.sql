




-------------SIMPLE LOGICAL TEST----------

			IF 'yes' = 'yes'
			PRINT 'TRUE'

			--------------cHANGE cODE BASED ON A condition-------------

			UPDATE SalesLT.Product
			SET DiscontinuedDate = GETDATE()
			WHERE ProductID = 25;

			IF @@ROWCOUNT < 1

			BEGIN 
				PRINT 'Product was not found'
			END
			ELSE 
				PRINT '1 PRODUCT UPDATED'












