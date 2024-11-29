/*

Cleaning Data in SQL Queries

*/
select * from 
SQLTutorialnew.dbo.NashvilleHousing


--------------------------------------------------------------------------------------------------------------------------

-- Standardize Date Format

select SaleDateConverted,convert(date,SaleDate) from 
SQLTutorialnew.dbo.NashvilleHousing

update NashvilleHousing
set SaleDate = CONVERT(date,SaleDate)



-- If it doesn't Update properly

alter table NashvilleHousing
add SaleDateConverted date

update NashvilleHousing
set SaleDateConverted = CONVERT(date,SaleDate)

 --------------------------------------------------------------------------------------------------------------------------

-- Populate Property Address data

select * from 
SQLTutorialnew.dbo.NashvilleHousing
--Where PropertyAddress is null

select a.ParcelID,a.PropertyAddress,b.ParcelID,b.PropertyAddress,ISNULL(a.PropertyAddress,b.PropertyAddress)
from SQLTutorialnew.dbo.NashvilleHousing a
join SQLTutorialnew.dbo.NashvilleHousing b
on a.ParcelID=b.ParcelID
and a.[UniqueID ]<>b.[UniqueID ]
where a.PropertyAddress is null

update a
set PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
from SQLTutorialnew.dbo.NashvilleHousing a
join SQLTutorialnew.dbo.NashvilleHousing b
on a.ParcelID=b.ParcelID
and a.[UniqueID ]<>b.[UniqueID ]
where a.PropertyAddress is null








--------------------------------------------------------------------------------------------------------------------------

-- Breaking out Address into Individual Columns (Address, City, State)


select Substring(PropertyAddress,1,charindex(',',PropertyAddress) -1 ) as Address,
Substring(PropertyAddress,charindex(',',PropertyAddress) +1,LEN(PropertyAddress)) as Address
from 
SQLTutorialnew.dbo.NashvilleHousing

Alter table NashvilleHousing
add SplitAddress nvarchar(255)

update NashvilleHousing
set SplitAddress = Substring(PropertyAddress,1,charindex(',',PropertyAddress) -1 )

Alter table NashvilleHousing
add Splitcity nvarchar(255)

update NashvilleHousing
set Splitcity = Substring(PropertyAddress,charindex(',',PropertyAddress) +1,LEN(PropertyAddress))







--Where PropertyAddress is null
--order by ParcelID






--------------------------------------------------------------------------------------------------------------------------


-- Change Y and N to Yes and No in "Sold as Vacant" field











-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Remove Duplicates

--order by ParcelID





---------------------------------------------------------------------------------------------------------

-- Delete Unused Columns


















-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

--- Importing Data using OPENROWSET and BULK INSERT	

--  More advanced and looks cooler, but have to configure server appropriately to do correctly
--  Wanted to provide this in case you wanted to try it


--sp_configure 'show advanced options', 1;
--RECONFIGURE;
--GO
--sp_configure 'Ad Hoc Distributed Queries', 1;
--RECONFIGURE;
--GO


--USE PortfolioProject 

--GO 

--EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'AllowInProcess', 1 

--GO 

--EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'DynamicParameters', 1 

--GO 


---- Using BULK INSERT

--USE PortfolioProject;
--GO
--BULK INSERT nashvilleHousing FROM 'C:\Temp\SQL Server Management Studio\Nashville Housing Data for Data Cleaning Project.csv'
--   WITH (
--      FIELDTERMINATOR = ',',
--      ROWTERMINATOR = '\n'
--);
--GO


---- Using OPENROWSET
--USE PortfolioProject;
--GO
--SELECT * INTO nashvilleHousing
--FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
--    'Excel 12.0; Database=C:\Users\alexf\OneDrive\Documents\SQL Server Management Studio\Nashville Housing Data for Data Cleaning Project.csv', [Sheet1$]);
--GO

















