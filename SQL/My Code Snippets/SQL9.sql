--having



select JobTitle ,AVG(Salary) from SQLTutorialnew.dbo.EmployeeDemographics join 
SQLTutorialnew.dbo.EmployeeSalary
on EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
group by JobTitle
Having AVG(Salary)>3000
order by AVG(Salary)


--Update and delete statement 



update SQLTutorialnew.dbo.EmployeeDemographics
set EmployeeID =1012
where FirstName='Holly'
select * from SQLTutorialnew.dbo.EmployeeDemographics

Update SQLTutorialnew.dbo.EmployeeDemographics
set Age=36,Gender='Male'
where EmployeeId=1012

Delete from SQLTutorialnew.DBO.EmployeeDemographics
WHERE EmployeeID=1013


--Aliasing

Select FirstName as Fname
from SQLTutorialnew.dbo.EmployeeDemographics

Select FirstName +' '+LastName as FullName
from SQLTutorialnew.DBO.EmployeeDemographics

--ALISING IS USED TO IMPROVE THE READABLITY
Select demo.EmployeeId ,sal.salary , ware.age from SQLTutorialnew.dbo.EmployeeDemographics AS demo
JOIN SQLTutorialnew.dbo.EmployeeSalary as sal
on demo.EmployeeID=sal.EmployeeId
LEFT JOIN SQLTutorialnew.dbo.WareHouseEmployeeDemographics as ware 
on demo.EmployeeID=ware.Age


Select * from SQLTutorialnew.dbo.WareHouseEmployeeDemographics

--Partition By

Select FirstName,LastName,Salary,count(gender) over (partition by gender) as countofgender
from SQLTutorialnew.DBO.EmployeeDemographics
JOIN SQLTutorialnew.DBO.EmployeeSalary
on EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID

--vs 

--Groupby

Select gender,count(gender) as countofgender
from SQLTutorialnew.DBO.EmployeeDemographics
JOIN SQLTutorialnew.DBO.EmployeeSalary
on EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
group by  gender


----CTEs
with cte_employee  as (
Select FirstName,LastName,COUNT(Gender) over (partition by Gender) as countofgender
from SQLTutorialnew.DBO.EmployeeDemographics
JOIN SQLTutorialnew.dbo.EmployeeSalary
on EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID)

select FirstName,LastName from cte_employee

with sname as(
Select FirstName as fname,LastName as Lname from SQLTutorialnew.dbo.EmployeeDemographics)

select * from sname

--temporary table

drop table if  exists #employee
create table #employee
(FirstName varchar(20),
LastName varchar(20)
)
insert into #employee
select FirstName,LastName from SQLTutorialnew.dbo.EmployeeDemographics

SELECT * from #employee