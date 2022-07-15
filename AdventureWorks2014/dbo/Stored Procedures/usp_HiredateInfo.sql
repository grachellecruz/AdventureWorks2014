create proc usp_HiredateInfo (@HiredDatebegin int, @HiredDateend int)
as
begin
declare @HiredateInfo nvarchar(500)
set @HiredateInfo=
N'Select P.LastName+SPACE(1) + P.FirstName + space(1)
	   + left(P.Middlename,1) as FullName,JobTitle as Position,LoginID,HireDate
	   from
	   Person.Person as P
	   INNER JOIN [HumanResources].[Employee] AS HE
	   ON P.BusinessentityId=HE.BusinessentityId
	  where between hiredate=@hiredate1 and hiredate=@hiredate2'
	
print @HiredateInfo
exec sp_executesql @HiredateInfo,N'@hiredate1 nvarchar(20),@hiredate2 nvarchar(20)',
@hiredate1=@HiredDatebegin ,@hiredate2=@HiredDateend;
END
