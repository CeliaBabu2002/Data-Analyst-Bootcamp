--select * from SQLTutorialnew.dbo.EmployeeDemographics
--UNION ALL
--select * from SQLTutorialnew.dbo.WareHouseEmployeeDemographics

--select * from SQLTutorialnew.dbo.EmployeeDemographics
--UNION 
--select * from SQLTutorialnew.dbo.WareHouseEmployeeDemographics


select * from SQLTutorialnew.dbo.EmployeeDemographics
UNION 
select * from SQLTutorialnew.dbo.WareHouseEmployeeDemographics
ORDER BY EmployeeID

