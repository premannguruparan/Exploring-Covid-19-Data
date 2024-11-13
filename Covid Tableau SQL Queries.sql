/*

Queries used for Tableau Project

*/


-- 1. 
SELECT SUM(new_cases) as total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths)/SUM(New_Cases)*100 AS DeathPercentage
FROM ProjectPortfolio.CovidDeaths
-- Where location like '%states%'
WHERE continent IS NOT NULL 
-- Group By date
ORDER BY 1,2;

-- 2. 
SELECT location,SUM(new_deaths) AS TotalDeathCount
FROM CovidDeaths
WHERE continent IS NULL
AND location NOT IN('World','European Union','International')
GROUP BY location
ORDER BY TotalDeathCount DESC;

-- 3.

SELECT Location, Population, MAX(total_cases) AS HighestInfectionCount,  Max((total_cases/population))*100 AS PercentPopulationInfected
FROM CovidDeaths
-- Where location like '%states%'
GROUP BY Location, Population
ORDER BY PercentPopulationInfected DESC;


-- 4.

SELECT 
    Location, 
    Population, 
    date, 
    MAX(total_cases) AS HighestInfectionCount,
    MAX((total_cases / Population) * 100) AS PercentPopulationInfected
FROM CovidDeaths
-- WHERE Location LIKE '%states%'
GROUP BY Location, Population, date
ORDER BY PercentPopulationInfected DESC
LIMIT 100000; -- To get all the data





