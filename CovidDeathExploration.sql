Use PortfolioProject


-- Calculating the total cases per population percentage for each country


Select location, Round((Cast(total_cases as float)/Cast(population as float))*100,2)  As CasePercentage
From CovidDeaths
Where continent Is Not Null


-- Calculating the highest infection rate for each country

Select location, Max(Round(((Cast(total_cases as float)/Cast(population as float)) * 100),2)) as HighestInfectionRate
From CovidDeaths Where continent Is Not Null
Group By location
Order By HighestInfectionRate Desc


-- Calculating the highest death count for each country

Select location, Max(Cast(total_deaths as int)) as HighestDeathRate
From CovidDeaths Where continent Is Not Null
Group By location
Order By HighestDeathRate Desc


-- Checking the highest infection rates continent wise

Select continent, Max(Round(((Cast(total_cases as float)/Cast(population as float))*100),2)) as HighestInfectionRate_Continents
From CovidDeaths
Where continent Is Not Null
Group By continent
Order By HighestInfectionRate_Continents Desc


-- Checking the highest death counts continent wise

Select continent, Max(Cast(total_deaths as int)) as HighestDeathCount_Continents
From CovidDeaths Where continent Is Not Null
Group By continent
Order By HighestDeathCount_Continents Desc



-- Global Numbers, number of covid cases recorded each day 

Select date, SUM(new_cases) as Total_Cases_Recorded 
From CovidDeaths 
Where continent is not null
Group By date
Order By Date Desc

-- Global Numbers, number of covid deaths recorded each day

Select date, Sum(Cast(new_deaths as float)) as Total_Deaths_Recorded
From CovidDeaths
Where continent is not null
Group By date
Order By Date Desc 

-- Calculating the percentage of deaths due to Covid (little more than 2% 2 years earlier)

Select * From 
CovidVaccinations

-- Joining the two tables together on location, date 

Select * From CovidDeaths As Dea
Join CovidVaccinations As Vac
On Dea.location = Vac.location And Dea.date = Vac.date


-- Looking at total population vs vaccination - Canada started early, 


