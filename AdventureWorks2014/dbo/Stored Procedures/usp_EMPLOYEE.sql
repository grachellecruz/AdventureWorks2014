
CREATE PROCEDURE usp_EMPLOYEE
				(
				@NationalIDNumber int,
				@CurrentFlag int=1)
AS
BEGIN
	DECLARE @SQLString NVARCHAR(500)
	
	SET @SQLString =
     N'SELECT (P.LastName+'',''+P.FirstName+ '' ''+(P.MiddleName)) AS [Complete Name],
	 E.JobTitle,E.LoginID,E.HireDate	
	 from [HumanResources].[Employee] AS  E
	Join   [Person].[person] AS  P
	ON P.BusinessEntityID=E.BusinessEntityID ' +
	N'WHERE E.NationalIDNumber=@NationalIDNumber';

	if @CurrentFlag!= 1
			PRINT  'Inactive'
	
	EXECUTE sp_executesql @SQLString, N'@NationalIDNumber INT',
                      @NationalIDNumber = @NationalIDNumber
	Print (@SQLString)
END
