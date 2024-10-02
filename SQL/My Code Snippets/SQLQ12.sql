------Subqueries

/*

Today's Topic: Subqueries (in the Select, From, and Where Statement)

*/
Select * from EmployeeDemographics


-- Subquery in Select
select demo.EmployeeID,FirstName,(Select avg(Salary) from EmployeeSalary) 
from EmployeeSalary as sal
join EmployeeDemographics as demo
on demo.EmployeeID=sal.EmployeeID


-- How to do it with Partition By

select demo.EmployeeID,FirstName,avg(salary) over (partition by salary) as avgsalary
from EmployeeSalary as sal
join EmployeeDemographics as demo
on demo.EmployeeID=sal.EmployeeID

-- Why Group By doesn't work

select demo.EmployeeID,FirstName,avg(salary)
from EmployeeSalary as sal
join EmployeeDemographics as demo
on demo.EmployeeID=sal.EmployeeID
group by avg(salary)
order by 1,2


-- Subquery in From

select a.Age from (Select EmployeeID,Age from SQLTutorialnew.dbo.EmployeeDemographics 
where Age >30) a




-- Subquery in Where
select demo.EmployeeID  from SQLTutorialnew.dbo.EmployeeDemographics as demo
JOIN SQLTutorialnew.dbo.EmployeeSalary as sal
ON demo.EmployeeID=sal.EmployeeID
where demo.EmployeeID in (select demo.EmployeeID from SQLTutorialnew.dbo.EmployeeSalary where Salary >50000)


