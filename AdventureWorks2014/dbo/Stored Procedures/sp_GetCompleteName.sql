CREATE PROCEDURE sp_GetCompleteName (@NationalID nvarchar(15))
AS 
BEGIN
	SELECT CONCAT(Person.Lastname, ', ', Person.FirstName, ' ', Person.MiddleName) AS 'Complete Name', HumanResources.Employee.JobTitle AS 'Position', HumanResources.Employee.LoginID, HumanResources.Employee.HireDate, CASE WHEN Employee.CurrentFlag = 1 THEN 'Inactive' END AS 'CURRENT STATUS' FROM Person.Person JOIN HumanResources.Employee ON HumanResources.Employee.BusinessEntityID = Person.BusinessEntityID WHERE HumanResources.Employee.NationalIDNumber = @NationalID;
END