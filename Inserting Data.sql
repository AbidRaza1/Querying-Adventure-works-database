--------CREATING TABLE-----------

CREATE TABLE SalesLT.CallLog
(
	CallID INT IDENTITY PRIMARY KEY NOT NULL,
	CallTime datetime NOT NULL DEFAULT GETDATE(),
	SalesPerson nvarchar(25) NOT NULL,
	CustomerID INT Not Null References  salesLT.Customer(CustomerID),
	Phonenumber nvarchar(25) NOT NULL,
	Notes nvarchar(max) NULL

	);
	
	
	-----------INSERTING VALUES---------
	
	INSERT INTO SalesLT.CallLog
	values
	('2015-01-01T12:30:00', 'adveture-works/pamela0', 1, '245-555-0173', 'Returning Call re: enquiry about delivery');

	SELECT * FROM SalesLT.CallLog

	-----------------INSERT DEFAULT AND NULL---------------
	
	INSERT INTO SalesLT.CallLog
	VALUES
	(DEFAULT, 'adventure-works/david8', 2 , '170-555-0127', NULL)

	SELECT * FROM SalesLT.CallLog

	
	
	INSERT INTO SalesLT.CallLog (SalesPerson, CustomerID, Phonenumber)
	VALUES
	('adventure-works/jillian0', 3, '279-555-0130');
	SELECT * FROM SalesLT.CallLog

	-----------USING DATEADD--- AND INSERITNG MULTIPLE ROWS------------


	INSERT INTO SalesLT.CallLog
	VALUES
	(DATEADD( mi, -2, GETDATE()),'adventure-works/shu0', 5, '825-555-0186', 'called to arrange deliver of order 10987'),
	(DEFAULT, 'adventure-works/jilian0', 6, '828-568-895', NULL)
	
	SELECT * FROM SalesLT.CallLog

	------------------INSERTING DATA FROM ONE TABLE TO ANOTHER------
	
	INSERT INTO SalesLT.CallLog(SalesPerson,CustomerID,Phonenumber,Notes)
	SELECT SalesPerson, CustomerID,Phone, 'Sales Promotion Call'
	FROM SalesLT.Customer
	WHERE CompanyName = 'Big-Time Bike Store'

	SELECT * FROM SalesLT.CallLog

	-------------------RETRIEVING IDENTITY-------------
	
	INSERT INTO SalesLT.CallLog(SalesPerson,CustomerID,Phonenumber)
	VALUES ('adventure-works/jose1', 10, '150-555-0127');

	SELECT SCOPE_IDENTITY()

	---------------OVERRIDDING IDENTITY--------


	SET IDENTITY_INSERT SalesLT.CallLog ON;

	INSERT INTO SalesLT.CallLog(CallID, SalesPerson, CustomerID, Phonenumber)
	VALUES
	      (11, 'adventure-works/jose1',12,'926-555-0159');

	SET IDENTITY_INSERT SalesLT.CallLog OFF;

	SELECT * FROM SalesLT.CallLog;












