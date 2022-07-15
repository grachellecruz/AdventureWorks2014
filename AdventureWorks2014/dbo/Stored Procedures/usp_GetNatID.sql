
CREATE PROC dbo.usp_GetNatID
	(@IntVariable INT)
AS
BEGIN
	DECLARE @SQLString NVARCHAR(500)
	SET @SQLString =
     N'SELECT P.LastName+space(1)+P.FirstName+space(1)+P.MiddleName as [Complete Name], H.JobTitle as [Position], H.LoginID, H.HireDate, 
CASE	  
			WHEN CurrentFlag =0	 THEN ''Inactive''
		 END AS	[Current Status]
		FROM HumanResources.Employee as H
		join Person.Person as P
		on H.BusinessEntityID = P.BusinessEntityID
		where NationalIDNumber= @NatID;'
    
	Print (@SQLString)
	EXECUTE sp_executesql @SQLString, N'@NatID INT', 
                      @NatID = @IntVariable;
END
