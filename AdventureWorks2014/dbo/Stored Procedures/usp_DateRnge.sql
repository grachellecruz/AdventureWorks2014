
CREATE PROC usp_DateRnge
	(@Date1 DATE, @Date2 DATE = NULL)
AS

BEGIN
	DECLARE @SQLString NVARCHAR(500)
	DECLARE @Date3 DATE
	SET @Date3 = GETDATE()
	SET @SQLString =
     N'SELECT LastName + '','' + SPACE(1) + FirstName + SPACE(1) + MiddleName AS [Complete Name]
	 , JobTitle AS Position, LoginID, HireDate
       FROM HumanResources.Employee
	   JOIN Person.Person
	   ON HumanResources.Employee.BusinessEntityID = Person.Person.BusinessEntityID
       WHERE (HireDate>= @DateFrom AND HireDate <= @DateTo AND @DateTo IS NOT NULL) OR
	   (HireDate>= @DateFrom AND HireDate <= @DateTo2 AND @DateTo IS NULL)'   
	--Print (@SQLString)
	EXECUTE sp_executesql @SQLString, N'@DateFrom DATE, @DateTo DATE, @DateTo2 DATE',
                      @DateFrom = @Date1, @DateTo = @Date2, @DateTo2 = @Date3
END