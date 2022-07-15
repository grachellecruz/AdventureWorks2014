create proc usp_EmployeeInfo (@NationalIdNumber int)
as
begin
declare @EmployeeInfo nvarchar(500)
set @EmployeeInfo=
N'Select P.LastName+SPACE(1) + P.FirstName + space(1)
	   + left(P.Middlename,1) as FullName,JobTitle as Position,LoginID,HireDate
	   from
	   Person.Person as P
	   INNER JOIN [HumanResources].[Employee] AS HE
	   ON P.BusinessentityId=HE.BusinessentityId
	   WHERE NationalIdnumber=@NationalIdnumber1'
print @EmployeeInfo
exec sp_executesql @EmployeeInfo,N'@NationalIdnumber1 nvarchar(20)',@NationalIdnumber1=@NationalIdnumber;
END
