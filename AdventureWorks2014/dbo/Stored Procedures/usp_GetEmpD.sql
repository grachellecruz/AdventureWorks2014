
CREATE PROCEDURE usp_GetEmpD(@NationalIDNum INT)
AS 
	BEGIN
	DECLARE @SqlString NVARCHAR(MAX)
	
	SET @SqlString = N'SELECT [PP].LastName+'', ''+[PP].FirstName+'' ''+MiddleName AS [Complete Name] '+
	N',[HMEMP].JobTitle AS [Position]'+ 
	N',[HMEMP].LoginID AS [Login ID]'+ 
	N',[HMEMP].HireDate AS [Hired Date]'+
	N',(CASE
			WHEN CurrentFlag = 1 THEN ''Active'' 
			ELSE ''InActive''
			End) AS [Current Status] 
	FROM HumanResources.Employee AS [HMEMP] '+
	N'JOIN Person.Person AS [PP] '+
	N'ON [HMEMP].BusinessEntityID = [PP].BusinessEntityID '+
	N'WHERE [HMEMP].NationalIDNumber = @NIDNum'
	EXECUTE sp_executesql @SqlString, N'@NIDNum INT',
						@NIDNum = @NationalIDNum
	
	PRINT @SqlString
	END
