Create PROC usp_HiredDate
	(@HireDate date, @Dateto date = null)
	--, @Getdate CAST( GETDATE() AS Date ) 
AS
BEGIN
	DECLARE @SQLString NVARCHAR(500)
	SET @SQLString =
     N'select LastName + space(1) + FirstName+SPACE(1) + MiddleName as [Complete Name]
	,JobTitle as [Position]
	,LoginID
	,HireDate
	from person.Person
	join HumanResources.Employee
	on Employee.BusinessEntityID = Person.BusinessEntityID
	WHERE HireDate BETWEEN @HireDate and @Dateto '  
	----HireDate = @HireDate '   
	Print (@SQLString)
	EXECUTE sp_executesql @SQLString, N'@HireDate date, @Dateto date' ,    
                      @HireDate = @HireDate, @Dateto = @Dateto ;			 
END
