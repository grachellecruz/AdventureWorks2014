CREATE PROCEDURE sp_GetAllHiredEmployees (@from_date date, @to_date date = NULL)
AS 
BEGIN 
	IF (@to_date IS NOT NULL)
	BEGIN
		SELECT CONCAT(Person.Lastname, ', ', Person.FirstName, ' ', Person.MiddleName) AS 'Complete Name', HumanResources.Employee.JobTitle AS 'Position', HumanResources.Employee.LoginID, HumanResources.Employee.HireDate FROM Person.Person JOIN HumanResources.Employee ON HumanResources.Employee.BusinessEntityID = Person.BusinessEntityID WHERE HumanResources.Employee.HireDate BETWEEN @from_date AND @to_date;	
	END
	ELSE 
	BEGIN
		SELECT CONCAT(Person.Lastname, ', ', Person.FirstName, ' ', Person.MiddleName) AS 'Complete Name', HumanResources.Employee.JobTitle AS 'Position', HumanResources.Employee.LoginID, HumanResources.Employee.HireDate FROM Person.Person JOIN HumanResources.Employee ON HumanResources.Employee.BusinessEntityID = Person.BusinessEntityID WHERE HumanResources.Employee.HireDate BETWEEN @from_date AND GETDATE();
	END
END
