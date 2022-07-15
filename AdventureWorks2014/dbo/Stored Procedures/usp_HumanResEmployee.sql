
CREATE PROC usp_HumanResEmployee
	(@LName NVARCHAR(20), @FName NVARCHAR(20))
AS
BEGIN
	DECLARE @SQLString NVARCHAR(500)
	SET @SQLString =
     N'SELECT NationalIDNumber, JobTitle
       FROM HumanResources.Employee
	   JOIN Person.Person
	   ON HumanResources.Employee.BusinessEntityID = Person.Person.BusinessEntityID
       WHERE LastName = @LastName AND FirstName = @FirstName ';    
	--Print (@SQLString)
	EXECUTE sp_executesql @SQLString, N'@LastName NVARCHAR(20), @FirstName NVARCHAR(20)',
                      @LastName = @LName, @FirstName = @FName;
END
