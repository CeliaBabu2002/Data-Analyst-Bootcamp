--StoreProcedure

create procedure test1
as select * from SQLTutorialnew.dbo.EmployeeDemographics

exec test1



CREATE PROCEDURE Temp_Employee
@JobTitle nvarchar(100)
AS
DROP TABLE IF EXISTS #temp_employee
Create table #temp_employee3 (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)



CREATE PROCEDURE Temp_Employeenew
@JobTitle nvarchar(100)
AS
DROP TABLE IF EXISTS Temp_Employee2 
Create table Temp_Employee2  (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)


Insert into Temp_Employee2 
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM SQLTutorial..EmployeeDemographics emp
JOIN SQLTutorial..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
where JobTitle = @JobTitle --- make sure to change this in this script from original above
group by JobTitle

Select * 
From Temp_Employee2 
GO;


exec Temp_Employeenew @jobtitle = 'Salesman'
exec Temp_Employeenew @jobtitle = 'Accountant'