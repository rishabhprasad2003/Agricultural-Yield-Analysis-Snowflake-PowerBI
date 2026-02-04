-- creating a seperate database for the project
CREATE DATABASE PowerBI;

-- using/activating the databse (connecting)
USE DATABASE PowerBI;

-- create scheme which helps to organize tables logically
CREATE SCHEMA PBI_Data;

-- using the schema
USE SCHEMA PBI_Data;

-- creating Table to store the data
CREATE TABLE PBI_Dataset (
Year int,
Location string,
Area int,
Rainfall float,
Temperature float,
Soil_type string,
Irrigation string,
yeilds int,
Humidity float,
Crops string,
price int,
Season string
);

-- checking the table created
SELECT * FROM PBI_DATASET;

-- Using Snowflake CLI
-- Creating a stage
CREATE OR REPLACE STAGE pbi_stage;

-- uploading the file
PUT "file://C:/Users/Rishabh/Data Analytics/Udemy Course content/Project 3 AWS_Snowflake_BI/data_season.csv" @pbi_stage;


-- After loading the table
SELECT * FROM PBI_DATASET LIMIT 10;

--checking load history
SELECT *
FROM INFORMATION_SCHEMA.LOAD_HISTORY
ORDER BY LAST_LOAD_TIME DESC;


SELECT * FROM PBI_DATASET;


-- Number of values for each year
SELECT YEAR, COUNT(*)
FROM PBI_DATASET
GROUP BY YEAR
ORDER BY YEAR;


-- For data transformation, creating a replica for the table
CREATE TABLE agriculture AS
SELECT * FROM PBI_DATASET; 

SELECT * FROM agriculture;


-- updating the rainfall values by +10%
UPDATE agriculture
SET rainfall = 1.1*rainfall;

-- Updating the value of 'area' column by -10%
UPDATE agriculture
SET area = 0.9*area;


-- Creating new column Year_Group
ALTER TABLE agriculture
ADD COLUMN Year_Group STRING;


-- updating the values on the newly added column
UPDATE agriculture
SET Year_Group = CASE
    WHEN Year BETWEEN 2004 AND 2009 THEN 'Y1'
    WHEN Year BETWEEN 2010 AND 2015 THEN 'Y2'
    WHEN Year BETWEEN 2016 AND 2019 THEN 'Y3'
    ELSE NULL
END;

SELECT * FROM agriculture;

-- Creating new column Rainfall_group
ALTER TABLE agriculture
ADD COLUMN Rainfall_Group String;

-- Adding values to the Rainfall_Group Column
UPDATE agriculture
SET Rainfall_Group = CASE
    WHEN Rainfall BETWEEN 255 AND 1200 THEN 'Low'
    WHEN Rainfall BETWEEN 1201 AND 2800 THEN 'Mid'
    WHEN Rainfall BETWEEN 2801 AND 4103 THEN 'High'
    ELSE NULL 
END;

SELECT * FROM agriculture;