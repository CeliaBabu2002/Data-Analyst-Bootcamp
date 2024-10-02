Select FirstName,LastName,Age,
CASE
    When Age > 30 THEN 'OLD'
	when Age Between 26 and 29 THEN 'BABY'
	else
	'young'
END
from EmployeeDemographics
where Age is NOT NULL
ORDER BY AGE

--difference in the output based on the order of the condition

Select FirstName,LastName,Age,
CASE
    When Age > 30 THEN 'OLD'
	when Age =38 THEN 'Stanley'
	else
	'young'
END
from EmployeeDemographics
where Age is NOT NULL
ORDER BY AGE


Select FirstName,LastName,Age,
CASE
   when Age =38 THEN 'Stanley'
    When Age > 30 THEN 'OLD'
	else
	'young'
END
from EmployeeDemographics
where Age is NOT NULL
ORDER BY AGE

--Problem Increment the salary based on the jobtitle

Select FirstName,LastName,JobTitle,Salary,
Case
     when JobTitle = 'Salesman' then Salary + (Salary*0.10)
	 when JobTitle = 'HR' THEN Salary+ (Salary*0.05)
	 when JobTitle = 'Accountant' then Salary +(Salary+0.02)
	 else
	 Salary + (Salary *0.01)
END AS SaalaryIncrement
from SQLTutorialnew.dbo.EmployeeDemographics
Join SQLTutorialnew.dbo.EmployeeSalary
on EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID