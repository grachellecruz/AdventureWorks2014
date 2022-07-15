
CREATE PROCEDURE usp_GetEmpStatus
(
	@NationalIDNumberVal INT
)
AS
BEGIN
	DECLARE @sqlStmt NVarchar(4000),
		@ParamDefinition NVarchar(500),
		@CurrentFlag Int

	SET @CurrentFlag = (SELECT E.CurrentFlag
						FROM HumanResources.Employee E
						WHERE E.NationalIDNumber = @NationalIDNumberVal)

	IF @CurrentFlag = 1
		SET @sqlStmt = 'SELECT ISNULL(P.LastName,'''') + '', '' + ISNULL(P.FirstName,'''') + '' '' + ISNULL(P.MiddleName,'''') as [Complete Name]
							  ,E.JobTitle as Position
							  ,E.LoginID as [Login ID]
							  ,CAST(E.HireDate as DATE) as [Hired Date]
							  ,CASE WHEN E.CurrentFlag = 0 THEN ''Inactive''
									ELSE E.CurrentFlag
							   END ''CurrentFlag''
						FROM HumanResources.Employee E
						JOIN Person.Person P
								ON E.BusinessEntityID = P.BusinessEntityID
						WHERE E.NationalIDNumber = @NationalIDNumber'
	ELSE
		SET @sqlStmt = 'SELECT ''Inactive'' as [CURRENT STATUS]'--'PRINT ''Inactive'''

	EXEC sp_executesql @sqlStmt, @ParamDefinition = N'@NationalIDNumber Int', 
						@NationalIDNumber = @NationalIDNumberVal;
END
