
create Proc usp_HRemployees (@LastName nvarchar (40), @FirstName nvarchar(40))
as 
begin
declare @StringHRemployees nvarchar(500)
set  @StringHRemployees =
N' select NationalIDNumber,Jobtitle
from PERSON.PERSON as p
inner join HUMANRESOURCES.EMPLOYEE as he
on p.BusinessEntityID=HE.BusinessEntityid
where Lastname=@Lastname1 and FirstName=@Firstname1'
print @StringHRemployees
execute sp_executesql @StringHRemployees,N'@Lastname1 NVARCHAR(40),@Firstname1 NVARCHAR(40)'
,@Lastname1=@LastName,@Firstname1 =@FirstName;
END
