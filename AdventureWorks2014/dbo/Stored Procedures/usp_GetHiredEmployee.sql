
CREATE PROC dbo.usp_GetHiredEmployee
	(@DateFrom DATE, @DateTo DATE)
AS
BEGIN
	DECLARE @SQLString NVARCHAR(500)
	SET @SQLString =
     N'SELECT P.LastName+space(1)+P.FirstName+space(1)+P.MiddleName as [Complete Name], H.JobTitle as [Position], H.LoginID, H.HireDate 
		FROM HumanResources.Employee as H
		join Person.Person as P
		on H.BusinessEntityID = P.BusinessEntityID
		where HireDate between @DateRangeFrom and @DateRangeTo;'
    
	Print (@SQLString)
	EXECUTE sp_executesql @SQLString, N'@DateRangeFrom DATE, @DateRangeTo DATE', 
                      @DateRangeFrom = @DateFrom, @DateRangeTo = @DateTo;
END