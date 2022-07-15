
CREATE PROCEDURE usp_EMPLOYEE2
				(
				@HireDate DATE)
AS
BEGIN
	DECLARE @SQLString NVARCHAR(500)
	
	SET @SQLString =
     N'SELECT (P.LastName+'',''+P.FirstName+ '' ''+(P.MiddleName)) AS [Complete Name],
	 E.JobTitle,E.LoginID,E.HireDate	
	 from [HumanResources].[Employee] AS  E
	Join   [Person].[person] AS  P
	ON P.BusinessEntityID=E.BusinessEntityID ' +
	N'WHERE E.HireDate= @HireDate ';

	if @HireDate IS NOT NULL
			PRINT  GETDATE()
	
	EXECUTE sp_executesql @SQLString, N'@HireDate DATE',
                      @HireDate = @HireDate
	Print (@SQLString)
END

EXEC usp_EMPLOYEE2 '2008-12-02'
