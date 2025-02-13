-- Exploratory Data Analysis

-- Checking the data
SELECT * FROM layoffs_staging2;

-- Checking the max people laid off and what porcentage of the company was laid off
SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

-- Checking the companys that lost their entire personal
SELECT * FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

-- Checking the total of people companys laid off
SELECT company, SUM(total_laid_off) AS laid_off FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

-- Checking the total of people industrys laid off
SELECT industry, SUM(total_laid_off) AS laid_off FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

-- Checking the total of people countrys laid off
SELECT country, SUM(total_laid_off) AS laid_off FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;

-- Checking the total of people laid off each year
SELECT YEAR('date'), SUM(total_laid_off) AS laid_off FROM layoffs_staging2
GROUP BY YEAR('date')
ORDER BY 1 DESC;

-- Checking the laid off by month rolling it up
WITH Rolling_Total AS
(
SELECT SUBSTRING('date',1,7) AS 'Month' , SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING('date',1,7) IS NOT NULL
GROUP BY 'Month'
ORDER BY 1 ASC
)
SELECT 'Month', total_off
,SUM(total_off) OVER(ORDER BY 'Month') AS rolling_total
FROM Rolling_Total;

-- Checking the top 5 companys with the most laid off each year
WITH Company_Year(company,year,total_laid_off) AS
(
SELECT company,YEAR('date'), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR('date')
), Company_Year_Rank  AS
(SELECT *, 
DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_Year
WHERE years IS NOT NULL
ORDER BY Ranking ASC)
SELECT * FROM Company_Year_Rank
WHERE Ranking <= 5;

