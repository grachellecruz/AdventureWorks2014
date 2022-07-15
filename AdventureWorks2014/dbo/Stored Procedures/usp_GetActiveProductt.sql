CREATE PROC usp_GetActiveProductt
	(@IntVariable INT, @name NVARCHAR(50))
AS
BEGIN
	DECLARE @SQLString NVARCHAR(MAX)
	SET @SQLString = 
		N'SELECT ProductId, Name, Color, Style, Size, StandardCost
		FROM Production.Product
		WHERE ProductID = @pid AND Style = @style AND Color = @color';
	PRINT(@SQLString)
	EXECUTE sp_executesql @SQLString, N'ProductID int, @name NVARCHAR(50)',
						@ProductID = @IntVariable, @name = @name;
END