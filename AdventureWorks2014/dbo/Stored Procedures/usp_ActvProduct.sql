
CREATE PROCEDURE usp_ActvProduct (@ProdID INT, @Sty NChar(1) = DEFAULT, @Clr Nvarchar(25) = DEFAULT)
AS
DECLARE @sqlstatement NVARCHAR(MAX)
BEGIN
SET @sqlstatement = N'Select ProductID,[Name],Color, Style, Size, StandardCost
from Production.Product '+
N'where ProductID = @ProdID1'
EXECUTE sp_executesql @sqlstatement,N'@ProdID1 INT',
@ProdID1 = @ProdID
Print @sqlstatement
END
