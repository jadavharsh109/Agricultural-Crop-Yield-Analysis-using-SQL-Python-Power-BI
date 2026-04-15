CREATE DATABASE crop ;
use crop;

CREATE TABLE crop_data (
    State_Name VARCHAR(100),
    District_Name VARCHAR(100),
    Crop_Year INT,
    Season VARCHAR(50),
    Crop VARCHAR(100),
    Area DOUBLE,
    Production DOUBLE,
    Yield DOUBLE,
    Crop_Category VARCHAR(50)
);

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'D:/Projecst for FTN/Agriculural crop yield analysis/crop_production_cleaned(1).csv'
INTO TABLE crop_data
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

select count(*) from crop_data ;

--  Avg Production by State
SELECT State_Name, ROUND(avg(Production)) AS Avg_Production_Tonnes FROM crop_data
GROUP BY State_Name
ORDER BY Avg_Production_Tonnes DESC;

--  Area per Tonne Production by Crop
SELECT Crop, ROUND(SUM(Area) / NULLIF(SUM(Production),0), 2) AS Area_per_Tonne
FROM crop_data
GROUP BY Crop
ORDER BY Area_per_Tonne DESC
limit 10;

--  Average Yield by Crop
SELECT Crop, ROUND(AVG(Yield),2) AS Avg_Yield
FROM crop_data
GROUP BY Crop
ORDER BY Avg_Yield DESC;


--  Rank Crops by Production overall
SELECT Crop, ROUND(SUM(Production),2) AS Total_Production,
	RANK() OVER (ORDER BY SUM(Production) DESC) AS Rank_
FROM crop_data
GROUP BY Crop;

-- Top Producing Crop per State
SELECT *
FROM (
    SELECT State_Name, Crop, Production,
           RANK() OVER (PARTITION BY State_Name ORDER BY Production DESC) AS Rank_
    FROM crop_data
) as t
WHERE Rank_ = 1;


--  Dense Rank States by Production
SELECT State_Name, ROUND(SUM(Production),2) AS Total_Production, 
	DENSE_RANK() OVER (ORDER BY SUM(Production) DESC) AS Rank_
FROM crop_data
GROUP BY State_Name;

--  Highest Producing District
SELECT * FROM (
    SELECT District_Name, ROUND(SUM(Production)) AS Total_Production
    FROM crop_data
    GROUP BY District_Name
) AS sub
ORDER BY Total_Production DESC
LIMIT 1;

--  Crop Category Contribution
SELECT Crop_Category, ROUND(SUM(Production),2) AS Total_Production
FROM crop_data
GROUP BY Crop_Category
ORDER BY Total_Production DESC;

--  Year-wise Production Trend
SELECT Crop_Year, ROUND(SUM(Production)) AS Total_Production
FROM crop_data
GROUP BY Crop_Year
ORDER BY Crop_Year;

--  Crops Above Average Production 
SELECT Crop, ROUND(SUM(Production),2) AS Total_Production
FROM crop_data
GROUP BY Crop
HAVING SUM(Production) > (
    SELECT AVG(total_prod)
    FROM (
        SELECT SUM(Production) AS total_prod
        FROM crop_data
        GROUP BY Crop
    ) AS avg_table
);

-- State-wise Agriculture Summary
SELECT State_Name,
       ROUND(SUM(Area),2) AS Total_Area,
       ROUND(SUM(Production),2) AS Total_Production,
       ROUND(AVG(Yield),2) AS Avg_Yield
FROM crop_data
GROUP BY State_Name;

