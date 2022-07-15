
CREATE PROC spHRinfo @nationalId INT
AS
BEGIN
	DECLARE @sql NVARCHAR(MAX)
	SET @sql =
     N'SELECT Person.person.FirstName+SPACE+Person.person.MiddleName+SPACE+Person.person.LastName+SPACE+Person.person.Suffix AS CompleteName
	 ,HumanResources.Employee.JobTitle AS Position
	 ,HumanResources.Employee.LoginID
	 ,HumanResources.Employee.HireDate
	 ,HumanResources.Employee.CurrentFlag AS CurrentStatus
	 ,CASE WHEN CurrentStatus<>1 THEN Inactive END
       FROM HumanResources.Employee
	   INNER JOIN Person.person ON HumanResources.Employee.BusinessEntityID=Person.person.BusinessEntityID
       WHERE NationalIDNumber = @NatID ';    
	Print (@sql)
	EXECUTE sp_executesql @sql, N'@NatID INT',
                      @NatID = @nationalId;
END
--SELECT * FROM Person.person
