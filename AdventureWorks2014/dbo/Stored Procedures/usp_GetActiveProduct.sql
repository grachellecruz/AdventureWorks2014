
CREATE PROC dbo.usp_GetActiveProduct 
	(@IntVariable INT,  @Kulay nvarchar(20), @Stayl char(1))
AS
BEGIN
	DECLARE @SQLString NVARCHAR(500)
	SET @SQLString =
     N'Select ProductID, [Name], Color, Style, Size, StandardCost
from Production.Product
where ProductID=@ProductID and Color=@Color and Style = @Style';    
	Print (@SQLString)
	EXECUTE sp_executesql @SQLString, N'@ProductID INT, @Color NVARCHAR(20), @Style char(1)', 
                      @ProductID = @IntVariable , @Color = @Kulay , @Style=@Stayl ;
END
