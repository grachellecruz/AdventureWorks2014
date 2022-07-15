
CREATE PROCEDURE usp_GetHiredEmp(@DateHired DateTime, @DateTo DateTime = Default)
AS 
	
	DECLARE @SqlString NVARCHAR(MAX),
			@DateTo1 Datetime
	SET @DateTo1 =  @DateTo

	IF (@DateTo1 IS NULL)
		BEGIN
			SET @Dateto = GETDATE()
			SET @SqlString = N'SELECT [PP].LastName+'', ''+[PP].FirstName+'' ''+MiddleName AS [Complete Name]
				,[HMEMP].JobTitle AS [Position] 
				,[HMEMP].LoginID  AS [Login ID]
				,[HMEMP].HireDate AS [Hired Date]

				FROM HumanResources.Employee AS [HMEMP] '+
				N'JOIN Person.Person AS [PP] '+
				N'ON [HMEMP].BusinessEntityID = [PP].BusinessEntityID '+
				N'WHERE [HMEMP].HireDate BETWEEN @DateHired1 AND @Dateto2'
				
				EXECUTE sp_executesql @SqlString, N'@DateHired1 DateTime, @DateTo2 DateTime',
									@DateHired1 = @DateHired, @DateTo2 = @DateTo
				PRINT @SqlString
		END	

	ELSE 
		BEGIN
			SET @SqlString = N'SELECT [PP].LastName+'', ''+[PP].FirstName+'' ''+SUBSTRING([PP].MiddleName,1,1)+''.'' AS [Complete Name]
				,[HMEMP].JobTitle AS [Position] 
				,[HMEMP].LoginID  AS [Login ID]
				,[HMEMP].HireDate AS [Hired Date]

				FROM HumanResources.Employee AS [HMEMP] '+
				N'JOIN Person.Person AS [PP] '+
				N'ON [HMEMP].BusinessEntityID = [PP].BusinessEntityID '+
				N'WHERE [HMEMP].HireDate BETWEEN @DateHired1 AND @Dateto2'
				
				EXECUTE sp_executesql @SqlString, N'@DateHired1 DateTime, @Dateto2 DateTime',
									@DateHired1 = @DateHired, @DateTo2 = @DateTo1
				PRINT @SqlString
		END
