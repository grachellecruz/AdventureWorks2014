
CREATE PROC sp_GetHiredEmployees (
@DateFrom DATETIME2
,@DateTo DATETIME2 = NULL )
AS
IF @DateTo IS NULL
SET @DateTo = GETDATE()
BEGIN
	DECLARE @HiredEmployeeString NVARCHAR(MAX)		
	SET @HiredEmployeeString =
		'SELECT LastName' + '+'', ''+' + 'FirstName' + '+'' ''+' + 'ISNULL(MiddleName,' + ''' ''' +
		') as [Complete Name] ,OrganizationLevel, LoginID, HireDate
		FROM Person.Person pp 
		LEFT JOIN HumanResources.Employee hre
		ON hre.BusinessEntityID = pp.BusinessEntityID
		WHERE HireDate BETWEEN @DateFrom1 AND @DateTo1'
	PRINT @HiredEmployeeString
	EXEC sp_executesql @HiredEmployeeString, N'@DateFrom1 DATETIME2, @DateTo1 DATETIME2',
						@DateFrom1 = @DateFrom,@DateTo1 = @DateTo
END
