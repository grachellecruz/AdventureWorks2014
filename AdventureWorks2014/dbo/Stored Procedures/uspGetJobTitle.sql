
CREATE PROCEDURE uspGetJobTitle (@Lastname NVARCHAR(50),@Firstname NVARCHAR(50))
AS
DECLARE @statement NVARCHAR(MAX)

SET @statement = 	N'SELECT NationalIDNumber AS [National ID Number], JobTitle AS [Job Title]
					FROM Person.Person
					JOIN HumanResources.Employee
					ON Person.Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID' +
					N' WHERE Person.Person.LastName = @Last_Name AND Person.Person.FirstName = @First_Name'
EXECUTE sp_executesql @statement,N'@Last_Name NVARCHAR(50), @First_Name NVARCHAR(50)', @Last_Name = @Lastname, @First_Name=@Firstname
PRINT @statement