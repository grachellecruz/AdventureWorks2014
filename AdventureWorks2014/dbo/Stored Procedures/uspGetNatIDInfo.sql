CREATE PROCEDURE uspGetNatIDInfo (@NationalIDNumber NVARCHAR(15))
AS
DECLARE @statement NVARCHAR(MAX)

SET @statement = 	N'SELECT 
					(LastName + '','' +  SPACE(1) + FirstName +  SPACE(1) + MiddleName) AS [Complete Name],  JobTitle AS [Position], LoginID AS [Login ID], HireDate AS [Hired Date]
					,CASE WHEN CurrentFlag != 1
					THEN ''INACTIVE''
					ELSE ''ACTIVE'' 
					END AS [CURRENT STATUS]
					FROM Person.Person
					JOIN HumanResources.Employee
					ON Person.Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID' +
					N' WHERE NationalIDNumber = @nationalid'
EXECUTE sp_executesql @statement,N'@nationalid NVARCHAR(15)', @nationalid = @NationalIDNumber
PRINT @statement