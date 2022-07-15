
CREATE PROCEDURE usp_NatIDandJobTitle (@FirstName NVARCHAR(50),@LastName NVARCHAR(50))
AS
DECLARE @sqlstatement NVARCHAR(MAX),
@FName NVARCHAR(100),
@LName NVARCHAR(100)
SET @FName = @FirstName
SET @LName = @LastName 
IF (@FirstName = '' OR @LName ='')
BEGIN
SET @sqlstatement = 'Error!'
PRINT @sqlstatement
END
ELSE
Begin
Set @sqlstatement = N'Select He.NationalIDNumber, He.JobTitle
from Person.Person AS PP '+
N'Join HumanResources.Employee AS HE '+
N'on PP.BusinessEntityID = HE.BusinessEntityID '+
N'where PP.FirstName = @FName1 and PP.LastName = @LName1'
EXECUTE sp_executesql @sqlstatement,N'@FName1 NVarchar(100), @LName1 NVarchar(100)',
@FName1 = @FName, @LName1 = @LName
Print @sqlstatement
End
