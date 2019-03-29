

SELECT ProductID, Name, ListPrice
FROM SalesLT.Product
WHERE ListPrice > (SELECT AVG(UnitPrice)
					FROM SalesLT.SalesOrderDetail)

SELECT * FROM SalesLT.Product

SELECT * FROM SalesLT.SalesOrderDetail
 
 SELECT ProductID, Name, StandardCost, ListPrice,
 (SELECT AVG(UnitPrice)
 FROM SalesLT.SalesOrderDetail AS SOD
 WHERE P.ProductID = SOD.ProductID)

 FROM SalesLT.Product AS P
 ORDER BY P.ProductID;





 SELECT Ord.SalesOrderID, Ord.OrderDate,
	(SELECT MAX(OrdDet.UnitPrice)
	FROM SalesLT.SalesOrderDetail AS OrdDet
	WHERE Ord.SalesOrderID = OrdDet.SalesOrderID )AS MaxUnitPrice
	FROM SalesLT.SalesOrderHeader AS Ord


	SELECT SOH.SalesOrderID, MUP.MaxUnitPrice
	FROM SalesLT.SalesOrderHeader as SOH
	CROSS APPLY SalesLT.udfMaxUnitPrice(SOH.SalesOrderID) AS MUP
	ORDER BY SOH.SalesOrderID






	CREATE TABLE Employees
	(empid int NOT NULL, mgrid int NULL, empname Varchar(25) NOT NULL,salary money not null 
	CONSTRAINT PK_Employee PRIMARY KEY (empid));

		INSERT INTO Employees VALUES(1, NULL, 'Nancy' , $10000.00);
		INSERT INTO Employees VALUES(2,1,'Andrew', $5000.00);
		INSERT INTO Employees VALUES(3,1,'Janet' ,$5000.00);
		INSERT INTO Employees VALUES(4,1, 'Maragret', $5000.00);
		INSERT INTO Employees VALUES(5,2, 'Stern', $2500.00);
		INSERT INTO Employees VALUES(6,2, 'Michael', $2500.00);
		INSERT INTO Employees VALUES(7,3, 'Robert', $2500.00);
		INSERT INTO Employees VALUES(8,3, 'Laura', $2500.00);
		INSERT INTO Employees VALUES(9,3, 'Ann', $2500.00);
		INSERT INTO Employees VALUES(10,4, 'Ina', $2500.00);
		INSERT INTO Employees VALUES(11,7,'David', $2000.00);
		INSERT INTO Employees VALUES(12,7, 'Ron', $2000.00);
		INSERT INTO Employees VALUES(13,7, 'Dan', $2000.00);
		INSERT INTO Employees VALUES(14,11,'James', $1500.00);
	
		CREATE TABLE Departments
		(deptid INT NOT NULL PRIMARY KEY, deptname VARCHAR(25) NOT NULL, deptmgrid INT NULL REFERENCES Employees);

		INSERT INTO Departments VALUES(1, 'HR', 2);
		INSERT INTO Departments VALUES(2, 'Marketing', 7);
		INSERT INTO Departments VALUES(3, 'Finance' ,8);
		INSERT INTO Departments VALUES(4, 'R&D' , 9);
		INSERT INTO Departments VALUES(5,'training' , 4);
		INSERT INTO Departments VALUES(6, 'Gardening', NULL);

		CREATE FUNCTION db.fn_getsubtree(@empid AS INT) 
		RETURNS @TREE TABLE
		(
			empid INT NOT NULL,
			empname VARCHAR(25) NOT NULL,
			mgrid INT NULL,
			lvl INT NOT NULL)

			AS BEGIN 
				WITH Employess_Subtree(empid,empname,mgrid,lvl)
			AS
				(SELECT empid, empname,mgrid,0
				FROM Employees
				WHERE empid = @empid
				UNION all
				SELECT e.empid, e.mgrid, es.lvl+1
				FROM Employees AS e
				JOIN Employees_subtree AS es
				ON e.mgrid = es.empid)
				
			INSERT INTO @TREE
			SELECT * FROM Employees _Subtree;
			RETURN
			END			

				(
				SELECT empid,empname,mgrid, 0
				FROM Employees 
				WHERE empid = @empid



SELECT ProductID, Name, ListPrice      
FROM SalesLT.Product                 
WHERE ProductID IN                   
				  (SELECT             
				                     
ListPrice > 100                      

SELECT * FROM SalesLT.SalesOrderDetail

		























