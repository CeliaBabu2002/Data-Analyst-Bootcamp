select * from PortfolioProject..CovidDeaths

select * from PortfolioProject..CovidDeaths
where continent is not NULL
Order by 3,4

--select * from PortfolioProject..CovidVaccinations
--Order by 3,4

select location,date,total_cases,new_cases,total_deaths,population
from PortfolioProject..CovidDeaths
order by 1,2

--looking at Total cases vs total deaths
--shows the likelihood of dying if you contract covid in your country
select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as DeathPercentage
from PortfolioProject..CovidDeaths
where location like 'in%'
order by 1,2


--looking at total cases vs population
--shows what percentage of population got covid

select location,date,population,total_cases,(total_cases/population)*100 as Percentageofcases
from PortfolioProject..CovidDeaths
--where location like 'in%'
order by 1,2


--looking at countries with highest infection rate compared to population

select location,population,max(total_cases) as Highestinfectioncount ,max(total_cases/population)*100 as 
PercentageofInfected
from PortfolioProject..CovidDeaths
group by location,population
--where location like 'in%'
order by PercentageofInfected desc

--LET'S BREAK THINGS DOWN BY CONTINENT

--select location,max(cast(total_deaths as int)) as TotalDeathCount
--from PortfolioProject..CovidDeaths
--where continent is NULL
--group by location
----where location like 'in%'
--order by TotalDeathCount desc


select continent,max(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject..CovidDeaths
where continent is NOT NULL
group by continent
--where location like 'in%'
order by TotalDeathCount desc




--showing the countries with highest death count per population 
select location,max(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject..CovidDeaths
where continent is not NULL
group by location
--where location like 'in%'
order by TotalDeathCount desc


--Showing continents with highest death count per population

select continent,max(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject..CovidDeaths
where continent is NOT NULL
group by continent
--where location like 'in%'
order by TotalDeathCount desc


--GLOBAL NUMBER
select sum(new_cases) as total_cases,sum(cast(new_deaths as int)) as total_deaths,
sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage 
from PortfolioProject..CovidDeaths
--where location like 'in%'
WHERE continent is not null
--group by date /* per day*/
order by 1,2

--looking at total population vs vaccinations

select death.location,death.date,death.continent,death.population,vac.new_vaccinations, 
sum(convert(int,vac.new_vaccinations)) over (partition by death.location,death.date)as rollingpeoplevaccinated
from PortfolioProject..CovidVaccinations as vac
join PortfolioProject..CovidDeaths as death
on vac.location= death.location and
vac.date=death.date
where death.continent is not null /*and death.location like 'in%'*/
order by 1,2,3


--with CTE
--if the no of col in cte's and select statement is different then its gone create error



with PopvsVac(continent,location,date,population,new_vaccinations,rollingpeoplevaccinated)
as
(
select death.continent,death.location,death.date,death.population,vac.new_vaccinations, 
sum(convert(int,vac.new_vaccinations)) over (partition by death.location order by death.location,death.date)as rollingpeoplevaccinated
--(rollingpeoplevaccinated/population)*100
from PortfolioProject..CovidVaccinations as vac
join PortfolioProject..CovidDeaths as death
on vac.location= death.location and
vac.date=death.date
where death.continent is not null /*and dea th.location like 'in%'*/
--order by 1,2,3
)
Select *,(rollingpeoplevaccinated/population)*100 from PopvsVac


--using temp table
drop table if exists #percentagepopulationvaccinated 

create table #percentagepopulationvaccinated
(
continent nvarchar(255),
location nvarchar(255),
date datetime,
population numeric,
new_vaccinations numeric,
rollingpeoplevaccinated numeric
)

insert into #percentagepopulationvaccinated 
select death.continent,death.location,death.date,death.population,vac.new_vaccinations, 
sum(convert(int,vac.new_vaccinations)) over (partition by death.location order by death.location,death.date)as rollingpeoplevaccinated
--(rollingpeoplevaccinated/population)*100
from PortfolioProject..CovidVaccinations as vac
join PortfolioProject..CovidDeaths as death
on vac.location= death.location and
vac.date=death.date
--where death.continent is not null /*and dea th.location like 'in%'*/
--order by 1,2,3

Select *,(rollingpeoplevaccinated/population)*100 from #percentagepopulationvaccinated



--creating view to store data 

create view percentagepopulationvaccinated as
select death.continent,death.location,death.date,death.population,vac.new_vaccinations, 
sum(convert(int,vac.new_vaccinations)) over (partition by death.location order by death.location,death.date)as rollingpeoplevaccinated
--(rollingpeoplevaccinated/population)*100
from PortfolioProject..CovidVaccinations as vac
join PortfolioProject..CovidDeaths as death
on vac.location= death.location and
vac.date=death.date
where death.continent is not null /*and dea th.location like 'in%'*/
--order by 1,2,3

select * from percentagepopulationvaccinated
