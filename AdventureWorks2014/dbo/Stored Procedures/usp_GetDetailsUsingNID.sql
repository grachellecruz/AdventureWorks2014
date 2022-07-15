
CREATE PROCEDURE usp_GetDetailsUsingNID (@NatlID INT)
AS
BEGIN
	DECLARE @SQLString NVARCHAR(MAX)
	SET @SQLString =
		N'USE AdventureWorks2014;
		SELECT LastName + '', '' + FirstName + '' '' + MiddleName AS [Complete Name]
		, HREmp.JobTitle AS Position
		, HREmp.LoginID AS [Login ID]
		, HREmp.HireDate AS [Hired Date]
		, CASE
			WHEN HRemp.CurrentFlag != 1 THEN ''Inactive''
			ELSE HREmp.CurrentFlag
			END AS [CURRENT STATUS]
		FROM HumanResources.Employee AS HREmp
		JOIN Person.Person AS PP ON HREmp.BusinessEntityID = PP.BusinessEntityID
		WHERE HREmp.NationalIDNumber = @NID';
	EXECUTE sp_executesql @SQLString, N'@NID INT', @NID = @NatlID;
	PRINT (@SQLString)
END
