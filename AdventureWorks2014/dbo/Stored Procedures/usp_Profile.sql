Create PROC usp_Profile
	(@NationalID Int)
AS
BEGIN
	DECLARE @SQLString NVARCHAR(500)
	SET @SQLString =
     N'select LastName + space(1) + FirstName+SPACE(1) + MiddleName as [Complete Name]
	,JobTitle as [Position]
	,LoginID, HireDate
	from person.Person
	join HumanResources.Employee
	on Employee.BusinessEntityID = Person.BusinessEntityID
	where NationalIDNumber = @NationalID'    
	Print (@SQLString)
	EXECUTE sp_executesql @SQLString, N'@NationalID Int',    
                      @NationalID = @NationalID;			 
END