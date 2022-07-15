
Create PROC usp_NationalID
	(@LastName Varchar(30), @FirstName NVARCHAR(30))

	--, @Name NVARCHAR(50), @Size NVARCHAR(2),@StandardCost Money)
AS
BEGIN
	DECLARE @SQLString NVARCHAR(500)
	SET @SQLString =
     N'SELECT NationalIDNumber,JobTitle 
     from person.Person
	 join HumanResources.Employee
	 on Employee.BusinessEntityID = Person.BusinessEntityID
	 where Lastname = @LastName and Firstname = @Firstname'    
	Print (@SQLString)
	EXECUTE sp_executesql @SQLString, N'@LastName Varchar(30), @FirstName NVARCHAR(30)',    
                      @LastName = @LastName, @FirstName = @FirstName;				 
END