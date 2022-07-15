
CREATE PROCEDURE usp_GetNIDAndJobTitle (@LastName NVARCHAR(50), @FirstName NVARCHAR(50))
AS
BEGIN
	DECLARE @SQLString NVARCHAR (MAX)
	SET @SQLString =
		N'USE AdventureWorks2014;
		SELECT HREmp.NationalIDNumber, HRemp.JobTitle
		FROM HumanResources.Employee AS HREmp
		JOIN Person.Person AS PP ON HREmp.BusinessEntityID = PP.BusinessEntityID
		WHERE PP.LastName = @LName AND PP.FirstName = @FName';
	EXECUTE sp_executesql @SQLString, N'@LName NVARCHAR(50), @FName NVARCHAR(50)', @LName = @LastName, @FName = @FirstName;
	PRINT (@SQLString)
END
