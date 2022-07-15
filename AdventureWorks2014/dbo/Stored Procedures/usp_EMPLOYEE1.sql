
CREATE PROCEDURE usp_EMPLOYEE1
				(
				@LastName NVARCHAR(MAX),
				@FirstName NVARCHAR(MAX))
AS
BEGIN
	DECLARE @SQLString NVARCHAR(500)
	SET @SQLString =
     N'SELECT E.NationalIDNumber,E.JobTitle		
	 from [HumanResources].[Employee] AS E
	Join   [Person].[person] AS  P
	ON P.BusinessEntityID=E.BusinessEntityID ' +
	N'WHERE P.LastName = @LastName AND P.Firstname=@FirstName'
	
	EXECUTE sp_executesql @SQLString, N'@LastName NVARCHAR(MAX),@FirstName NVARCHAR(MAX)',
                      @LastName = @LastName,@FirstName=@FirstName;
	Print (@SQLString)
END
