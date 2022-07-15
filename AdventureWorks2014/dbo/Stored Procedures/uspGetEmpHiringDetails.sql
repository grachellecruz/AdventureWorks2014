
CREATE PROCEDURE uspGetEmpHiringDetails (@DateFrom DATE, @DateTo DATE=null)
AS
DECLARE @statement NVARCHAR(MAX)
DECLARE @DateTo2 DATE

SET @DateTo2 = GETDATE()
SET @statement = 	N'SELECT
					(LastName + '','' +  SPACE(1) + FirstName +  SPACE(1) + MiddleName) AS [Complete Name],  JobTitle AS [Position], LoginID AS [Login ID], HireDate AS [Hired Date]
					FROM Person.Person
					JOIN HumanResources.Employee
					ON HumanResources.Employee.BusinessEntityID = Person.Person.BusinessEntityID' +
					N' WHERE (HireDate>=@DateFrom1 AND @DateTo1 IS NOT NULL AND HireDate<=@DateTo1) OR
					(HireDate>=@DateFrom1 AND @DateTo1 IS NULL AND HireDate<=@Date2)'
EXECUTE sp_executesql @statement, N' @DateFrom1 DATE, @DateTo1 DATE, @Date2 DATE', @DateFrom1 = @DateFrom, @DateTo1=@DateTo, @Date2=@DateTo2
PRINT @statement
