--Global rate of cases, death totals and percentages
SELECT SUM(new_cases) AS total_cases,SUM(cast(new_deaths AS bigint)) AS total_deaths, SUM(cast(new_deaths AS bigint))/SUM(new_cases)*100 AS percentage_of_death
FROM CovidRelated.dbo.CovidDeaths 
where continent is not null
order by 1,2
--Tables to visualize in tableu

SELECT continent,SUM(cast(new_deaths AS bigint)) AS total_deaths
FROM CovidRelated.dbo.CovidDeaths 
where continent is not null 
and location not in ('World','European Union','International')
GROUP BY continent
order by total_deaths desc

SELECT location,MAX(cast(total_deaths AS bigint)) AS death_total_count
FROM CovidRelated.dbo.CovidDeaths 
where continent is not null and location not in ('World','European Union','International')
GROUP BY location
order by death_total_count desc

SELECT location,population,MAX(total_cases) AS highest_infection_count, MAX(total_cases/population)*100 as highest_percentage_infected
FROM CovidRelated.dbo.CovidDeaths 
GROUP BY location,population
ORDER BY highest_percentage_infected

Select location, population, MAX(total_cases) as highest_infection_count,  Max((total_cases/population))*100 as highest_percentage_infected
From CovidRelated.dbo.CovidDeaths
Group by location, population
order by highest_percentage_infected desc

Select location, population, date, MAX(total_cases) as highest_infection_count,  Max((total_cases/population))*100 as highest_percentage_infected
From CovidRelated.dbo.CovidDeaths
Group by location, population,date
order by highest_percentage_infected desc