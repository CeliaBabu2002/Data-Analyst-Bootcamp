/*

Today's Topic: String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower

*/

Drop Table EmployeeErrors;


CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

Select *
From EmployeeErrors

-- Using Trim, LTRIM, RTRIM

select EmployeeID ,TRIM(EmployeeID) AS employeeid
from EmployeeErrors

select EmployeeID ,LTRIM(EmployeeID) AS employeeid
from EmployeeErrors

select EmployeeID ,RTRIM(EmployeeID) AS employeeid
from EmployeeErrors



-- Using Replace

SELECT LastName, REPLACE(LastName,'- Fired','')
from EmployeeErrors

-- Using Substring

Select LastName ,SUBSTRING(LastName,2,3)
from EmployeeErrors

Select  Substring(demo.FirstName,1,3),Substring(error.FirstName,1,3) from EmployeeErrors as error
join SQLTutorialnew.dbo.EmployeeDemographics as demo
on Substring(demo.FirstName,1,3) = Substring(error.FirstName,1,3)



select * from EmployeeErrors
select * from SQLTutorialnew.dbo.EmployeeDemographics

-- Using UPPER and lower

SELECT lower(FirstName) as lowername from EmployeeErrors
SELECT Upper(FirstName) as uppername from EmployeeErrors






