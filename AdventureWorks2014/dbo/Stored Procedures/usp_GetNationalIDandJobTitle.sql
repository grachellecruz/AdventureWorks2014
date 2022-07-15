
CREATE PROCEDURE usp_GetNationalIDandJobTitle (@FirstName NVARCHAR(50),@LastName NVARCHAR(50))
AS 
	DECLARE @SqlString NVARCHAR(MAX),
	@CFirstName NVARCHAR(50),
	@CLastName NVARCHAR(50)
	SET @CFirstName = @FirstName
	SET @CLastName = @LastName

		IF (@FirstName = '' OR @CLastName ='')
			BEGIN
				SET @SqlString = 'Sorry!'
				PRINT @SqlString	
			END
	
		ELSE
			Begin
				Set @SqlString = N'Select He.NationalIDNumber, He.JobTitle
							from Person.Person AS PN '+
							N'Join HumanResources.Employee AS HE '+
							N'on PN.BusinessEntityID = HE.BusinessEntityID '+
							N'where PN.FirstName = @CFirstName1 and PN.LastName = @CLastName1'
				EXECUTE sp_executesql @SqlString,N'@CFirstName1 NVarchar(50), @CLastName1 NVarchar(50)',
									@CFirstName1 = @CFirstName, @CLastName1 = @CLastName
				Print @SqlString
			End
