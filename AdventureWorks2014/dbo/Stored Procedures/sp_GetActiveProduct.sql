
CREATE PROC sp_GetActiveProduct (
	 @ProductID INT
	,@Style NVARCHAR(2) = NULL
	,@Color NVARCHAR(15) = NULL)
AS
	BEGIN
		DECLARE @ProductString NVARCHAR(MAX)
		SET @ProductString =
		   'SELECT ProductID, Name, Color, Style, Size, StandardCost
			FROM Production.Product
			WHERE ProductID = @pID AND ((Style = @StyleType) OR 
			(@StyleType IS NULL)) AND ((Color = @ColorName) OR (@ColorName IS NULL))'
		PRINT @ProductString
		EXEC sp_executesql @ProductString, N'@pID INT, @ColorName NVARCHAR(10), @StyleType NVARCHAR(2)',
		@pID = @ProductID, @ColorName = @Color, @StyleType = @Style
	END
