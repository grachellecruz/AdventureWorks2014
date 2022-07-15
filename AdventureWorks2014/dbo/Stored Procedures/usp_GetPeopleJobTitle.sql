
CREATE PROC dbo.usp_GetPeopleJobTitle
	(@FirstN NVARCHAR(20),  @LastN NVARCHAR(20))
AS
BEGIN
	DECLARE @SQLString NVARCHAR(500)
	SET @SQLString =
     N'SELECT H.NationalIDNumber as  [National ID Number], H.JobTitle as [Job Title]
		FROM [HumanResources].[Employee] as H
		join Person.Person as P
		on H.BusinessEntityID = P.BusinessEntityID
		where P.LastName = @LastName and  P.FirstName = @FirstName
		order by FirstName,LastName';    
	Print (@SQLString)
	EXECUTE sp_executesql @SQLString, N'@LastName NVARCHAR(20), @FirstName NVARCHAR(20)', 
                      @LastName = @LastN , @FirstName = @FirstN ;
END