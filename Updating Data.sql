


select * FROM SalesLT.calllog

------------------------------------UPDATING NULLS-----------

UPDATE SalesLT.Calllog
SET notes = 'o notes'
where notes is null;

SELECT * FROM SalesLT.Calllog

--------------------UPDATING MUTLIPLE COLUMNS----------


UPDATE SalesLT.CallLog
SET SalesPerson = ' ' , PhoneNumber = ' ';

SELECT * FROM SalesLT.Calllog

-----------------------UPDATING DATA FROM RESULTS OF A QUERY--------

UPDATE SalesLT.CallLog
SET SalesPerson = c.SalesPerson, PhoneNumber = c.Phone
FROM SalesLt.Customer as c
where c.customerid = saleslt.calllog.customerid; 


SELECT * FROM SalesLT.Calllog

------------DELETE ROWS--------- 

DELETE FROM SalesLT.calllog
where calltime < DATEADD(DD,-7,GETDATE())

SELECT * FROM SalesLT.Calllog

-----TRUNCATE TABLE-------

TRUNCATE TABLE SaleslT.CallLog

SELECT * FROM SalesLT.Calllog


