
CREATE PROC usp_NatlIdNum
	(@NatlIDNum INT)
AS
BEGIN
	DECLARE @SQLString NVARCHAR(500)
	SET @SQLString =
     N'SELECT LastName + '','' + SPACE(1) + FirstName + SPACE(1) + MiddleName AS [Complete Name]
	 , JobTitle AS Position, LoginID, HireDate, CASE WHEN CurrentFlag != 1 THEN ''Inactive'' 
	 ELSE NULL END AS [CURRENT STATUS]
       FROM HumanResources.Employee
	   JOIN Person.Person
	   ON HumanResources.Employee.BusinessEntityID = Person.Person.BusinessEntityID
       WHERE NationalIDNumber = @NationalIDNumber';    
	--Print (@SQLString)
	EXECUTE sp_executesql @SQLString, N'@NationalIDNumber INT',
                      @NationalIDNumber = @NatlIDNum
END
