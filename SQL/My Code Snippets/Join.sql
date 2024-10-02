--Join

select * from SQLTutorialnew.dbo.EmployeeDemographics
Full Outer join SQLTutorialnew.dbo.EmployeeSalary
On EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID

select * from SQLTutorialnew.dbo.EmployeeDemographics
Inner join SQLTutorialnew.dbo.EmployeeSalary
On EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID

select * from SQLTutorialnew.dbo.EmployeeDemographics
Left outer join SQLTutorialnew.dbo.EmployeeSalary
On EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID

select * from SQLTutorialnew.dbo.EmployeeDemographics
Right outer join SQLTutorialnew.dbo.EmployeeSalary
On EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID

select EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
from SQLTutorialnew.dbo.EmployeeDemographics
Inner join SQLTutorialnew.dbo.EmployeeSalary
On EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
Where FirstName <> 'Michael'
Order By Salary desc


select JobTitle, Avg(Salary) from SQLTutorialnew.dbo.EmployeeDemographics
Left outer join SQLTutorialnew.dbo.EmployeeSalary
On EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
where JobTitle = 'Salesman'
Group BY JobTitle

