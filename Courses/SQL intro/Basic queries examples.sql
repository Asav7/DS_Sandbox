use [AdventureWorksDW2016]

--
SELECT * FROM [dbo].[DimCustomer]

--SHOW ME ALL THE DEPARTMENT NAMES.
SELECT FIRSTNAME FROM [dbo].[DimCustomer]

--SHOW ME ALL ENGLISH EDUCATION
SELECT ENGLISHEDUCATION FROM [dbo].[DimCustomer]

--SHOW ME ALL THE DISTINCT 
SELECT DISTINCT ENGLISHEDUCATION FROM [dbo].[DimCustomer]

--SHOW ME ALL ADRESSES WITH 'ROAD'
SELECT FIRSTNAME, ENGLISHEDUCATION FROM [dbo].[DimCustomer]
WHERE ENGLISHEDUCATION LIKE 'BACHELORS'

--SHOW ME ALL CUSTOMERS THAT HAVE ONE CAR
SELECT * FROM [dbo].[DimCustomer] WHERE NUMBERCARSOWNED = 1

--SHOW ME ALL CUSTOMERS THAT HAVE ONE OR TWO CARS
SELECT * FROM [dbo].[DimCustomer] WHERE NumberCarsOwned IN (1, 2)

--SHOW ME LIST OF CUSTOMERS HAVE FRENCHOCCUPATION 'CADRE'
SELECT * FROM [dbo].[DimCustomer] WHERE FrenchOccupation LIKE 'CADRE'

--SHOW ME ALL CUSTOMERS THAT HAVE WORD 'ROAD' AS THE LAST WORD IN ADRESS
SELECT * FROM [dbo].[DimCustomer] WHERE ADDRESSLINE1 LIKE '%ROAD'

--SHOW ME ALL CUSTOMERS WITH WORD 'HILL' IN THEIR ADDRESS
SELECT * FROM [dbo].[DimCustomer] WHERE AddressLine1 LIKE '% HILL %'

--GIVE ME ALL CUSTOMERS BORN AFTER JAN 1 1980
SELECT * FROM [dbo].[DimCustomer] WHERE BIRTHDATE > '1980-01-01'

--ALL BORN BETWEEN 1950 AND 1980
SELECT * FROM [dbo].[DimCustomer] WHERE BIRTHDATE < '1/1/1980' AND BIRTHDATE > '1/1/1970'
--OR
SELECT * FROM [dbo].[DimCustomer] WHERE BIRTHDATE BETWEEN '1/1/1970' AND '1/1/1980'


------------
SELECT * FROM [dbo].[DimProdUCT]

--CALCULATED COLUMNS.
SELECT EnglishProductName, ReorderPoint, SafetyStockLevel FROM [dbo].[DimProdUCT]

SELECT EnglishProductName, ReorderPoint, ReorderPoint / 2 AS RP_half FROM [dbo].[DimProdUCT]

--INTO 
SELECT EnglishProductName, ReorderPoint, ReorderPoint / 2 AS RP_half INTO [dbo].[Product_mine] FROM [dbo].[DimProdUCT]

--MY PERMANENT TABLE
SELECT * FROM [DBO].[Product_mine]

--DELETE
DELETE FROM [DBO].[Product_mine]
WHERE EnglishProductName LIKE 'Bearing Ball'

--UPDATE
UPDATE [DBO].[Product_mine]
SET EnglishProductName = 'BLADE_2'
WHERE EnglishProductName LIKE 'BLADE'
