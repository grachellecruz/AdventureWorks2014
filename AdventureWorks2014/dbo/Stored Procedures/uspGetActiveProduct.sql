CREATE PROCEDURE uspGetActiveProduct(@ProductID INT, @Style NCHAR(5) = NULL, @Color NVARCHAR(20) = NULL)
AS

DECLARE @statement NVARCHAR(MAX)

SET @statement = 	N'SELECT ProductID, Name, Color, Style, Size, StandardCost
					FROM Production.Product' +
					N' WHERE (ProductID = @Production_ID) AND (Style = @Style1 OR Style IS NULL) AND (Color = @Color1 OR Color IS NULL)'
EXECUTE sp_executesql @statement,N'@Production_ID INT, @Style1 NCHAR(5), @Color1 NVARCHAR(20)', @Production_ID = @ProductID, @Style1=@Style, @Color1=@Color
PRINT @statement
