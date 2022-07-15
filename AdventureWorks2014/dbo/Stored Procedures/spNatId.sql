
CREATE PROC spNatId @lastname NVARCHAR(MAX), @firstname NVARCHAR(MAX)
AS
BEGIN
	DECLARE @sql NVARCHAR(MAX)
	SET @sql =
     N'SELECT NationalIDNumber, JobTitle 
       FROM HumanResources.Employee
	   INNER JOIN Person.person ON HumanResources.Employee.BusinessEntityID=Person.person.BusinessEntityID
       WHERE LastName = @lname AND FirstName = @fname ';    
	Print (@sql)
	EXECUTE sp_executesql @sql, N'@lname NVARCHAR(MAX), @fname NVARCHAR(MAX)',
                      @lname = @lastname, @fname = @firstname;
END
--SELECT