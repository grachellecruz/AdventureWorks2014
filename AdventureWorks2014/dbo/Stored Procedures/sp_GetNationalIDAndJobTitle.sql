CREATE PROCEDURE sp_GetNationalIDAndJobTitle (@Firstname char(30), @Lastname char(30))
AS
BEGIN
	SELECT Employee.NationalIDNumber, Employee.JobTitle FROM Person.Person JOIN HumanResources.Employee ON Person.BusinessEntityID = Employee.BusinessEntityID WHERE Person.FirstName = @Firstname OR Person.LastName = @Lastname;
END