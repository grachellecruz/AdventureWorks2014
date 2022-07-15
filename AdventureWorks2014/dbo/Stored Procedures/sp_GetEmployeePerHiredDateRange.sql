
CREATE PROCEDURE sp_GetEmployeePerHiredDateRange
(
	@DateFromValue Date,
	@DateToValue Date = NULL
)
AS
BEGIN
	DECLARE @sqlStmt NVarchar(4000),
			@ParamDefinition NVarchar(500)

	SET @sqlStmt = 'SELECT ISNULL(P.LastName,'''') + '', '' + ISNULL(P.FirstName,'''') + '' '' + ISNULL(P.MiddleName,'''') as [Complete Name]
						  ,E.JobTitle as Position
						  ,E.LoginID as [Login ID]
						  ,CAST(E.HireDate as DATE) as [Hired Date]
					FROM HumanResources.Employee E
					JOIN Person.Person P
							ON E.BusinessEntityID = P.BusinessEntityID
					WHERE CAST(E.HireDate AS DATE) >= @DateFrom
							AND CAST(E.HireDate AS DATE) <= @DateTo'

	IF @DateToValue IS NULL
		SET @DateToValue = GETDATE()

	EXEC sp_executesql @sqlStmt, @ParamDefinition = N'@DateFrom Date, @DateTo Date', 
						@DateFrom = @DateFromValue,
						@DateTo = @DateToValue;
END
