
CREATE PROC sp_EmployeeStatus (@NationalIDNumber INT)
AS
BEGIN
	DECLARE @EmpStatusString NVARCHAR(MAX)
	SET @EmpStatusString =
		'SELECT LastName' + '+'',''+' + 'FirstName' + '+'' ''+' + 'ISNULL(MiddleName,' + ''' ''' + 
		') as [Complete Name] , OrganizationLevel, LoginID,HireDate
		,CASE hre.CurrentFlag
		WHEN 1 THEN ' + '''' + 'Active' +''' ' +
		'ELSE ' + '''' + 'Inactive' + ''' ' +
		'END AS [Current Status]
		FROM HumanResources.Employee hre
		JOIN Person.Person pp
		ON hre.BusinessEntityID = pp.BusinessEntityID
		WHERE hre.NationalIDNumber = @NatIDNum'
	PRINT @EmpStatusString
	EXEC sp_executesql @EmpStatusString,N'@NatIDNum INT', @NatIDNum = @NationalIDNumber
END
