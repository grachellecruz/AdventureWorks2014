
CREATE PROC sp_GetEmployeeDetails
(@LastName NVARCHAR(30) , @FirstName NVARCHAR(30))
AS
BEGIN
	DECLARE @EmpDetailString NVARCHAR(MAX)
	SET @EmpDetailString =
		'SELECT NationalIDNumber, JobTitle
		FROM HumanResources.Employee hre
		JOIN Person.Person pp
		ON hre.BusinessEntityID = pp.BusinessEntityID
		WHERE LastName = @LastName1 AND FirstName = @FirstName1'
	PRINT @EmpDetailString
	EXEC sp_executesql @EmpDetailString, N'@LastName1 NVARCHAR(30),@FirstName1 NVARCHAR(30)',
						@LastName1 = @LastName, @FirstName1 = @FirstName
END
