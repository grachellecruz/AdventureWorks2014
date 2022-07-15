

CREATE PROCEDURE usp_CheckHiredRangeDate (@StartDate DATE, @EndDate DATE = NULL)
AS
BEGIN
	SET NOCOUNT ON
	IF @EndDate IS NULL
	SET @EndDate  = GETDATE()
	DECLARE @SQLString NVARCHAR(MAX)
	SET @SQLString =
		N'USE AdventureWorks2014;
		SELECT LastName + '', '' + FirstName + '' '' + MiddleName AS [Complete Name]
		, HREmp.JobTitle AS Position
		, HREmp.LoginID AS [Login ID]
		, HREmp.HireDate AS [Hired Date]
		FROM HumanResources.Employee AS HREmp
		JOIN Person.Person AS PP ON HREmp.BusinessEntityID = PP.BusinessEntityID
		WHERE HireDate BETWEEN @SDate AND @EDate';
	PRINT(@SQLString)
	EXECUTE sp_executesql @SQLString, N'@SDate DATE, @EDate DATE', @SDate = @StartDate, @EDate = @EndDate;
END
