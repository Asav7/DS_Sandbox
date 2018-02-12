--JOINS
CREATE TABLE MYEMPLOYEE (EMPLOYEEID INT, FIRSTNAME VARCHAR(20), LASTNAME VARCHAR(20))

INSERT INTO MYEMPLOYEE VALUES (1, 'John', 'Smith')
INSERT INTO MYEMPLOYEE VALUES (1, 'Ann', 'Jones')
INSERT INTO MYEMPLOYEE VALUES (1, 'William', 'Rock')

CREATE TABLE MYSALARY (EMPLOYEEID INT, SALARY FLOAT)
INSERT INTO MYSALARY VALUES (1, 10000)
INSERT INTO MYSALARY VALUES (2, 8000)
INSERT INTO MYSALARY VALUES (3, 7000)

SELECT * FROM MYSALARY
SELECT * FROM MYEMPLOYEE

--INNER JOIN
SELECT A.FIRSTNAME, A.LASTNAME, B.SALARY FROM MYEMPLOYEE A INNER JOIN MYSALARY B ON A.EMPLOYEEID = B.EMPLOYEEID

--LEFT OUTER JOIN
CREATE TABLE PHONE (EMPLOYEEID INT, PHONENUMBER INT)

INSERT INTO PHONE VALUES (1, 123456789)
INSERT INTO PHONE VALUES (2, 111222333)

SELECT * FROM MYEMPLOYEE
SELECT * FROM PHONE

SELECT A.FIRSTNAME, A.LASTNAME, B.PHONENUMBER FROM MYEMPLOYEE A LEFT JOIN PHONE B ON A.EMPLOYEEID = B.EMPLOYEEID

--RIGHT OUTER JOIN
SELECT A.FIRSTNAME, A.LASTNAME, B.PHONENUMBER FROM MYEMPLOYEE A RIGHT JOIN PHONE B ON A.EMPLOYEEID = B.EMPLOYEEID

SELECT B.FIRSTNAME, B.LASTNAME, A.PHONENUMBER FROM MYEMPLOYEE B LEFT JOIN PHONE A ON A.EMPLOYEEID = B.EMPLOYEEID

--FULL OUTER JOIN
CREATE TABLE MYCUSTOMER (CUSTOMERID INT, CUSTOMERNAME VARCHAR(20))

INSERT INTO MYCUSTOMER VALUES (1, 'TIM')
INSERT INTO MYCUSTOMER VALUES (2, 'ADAM')
INSERT INTO MYCUSTOMER VALUES (3, 'MIKE')

CREATE TABLE MYORDER (ORDERNUMBER INT, ORDERNAME VARCHAR(20), CUSOMERID INT)
INSERT INTO MYORDER VALUES (1, 'ORDER1', 1)
INSERT INTO MYORDER VALUES (2, 'ORDER2', 3)
INSERT INTO MYORDER VALUES (3, 'ORDER3', 4)
INSERT INTO MYORDER VALUES (4, 'ORDER4', 6)

SELECT * FROM MYCUSTOMER
SELECT * FROM MYORDER

SELECT A.CUSTOMERNAME, B.ORDERNAME, B.ORDERNUMBER 
FROM MYCUSTOMER A FULL OUTER JOIN MYORDER B 
ON A.CUSTOMERID = B.CUSOMERID

--CROSS JOIN
SELECT * FROM MYCUSTOMER CROSS JOIN MYORDER
SELECT * FROM MYCUSTOMER, MYORDER


SELECT GETDATE()
SELECT GETDATE() - 2  --DATE TWO DAYS AGO

SELECT DATEPART(YYYY, GETDATE()) AS YEAR_1
SELECT DATEPART(MM, GETDATE())
SELECT DATEPART(DD, GETDATE())

--DATEADD
SELECT DATEADD(DAY, 4, GETDATE()) --THE DATE AFTER FOUR DAYS

--THOSE WILL RETURN SIXTH JANUARY 2018
SELECT DATEADD(DAY, 4, '1/2/2018') --MM/DD/YYYY
SELECT DATEADD(DAY, 4, '01-02-2018') --MM-DD-YYYY
SELECT DATEADD(DAY, 4, '2018-01-02') --YYYY-MM-DD

SELECT DATEADD(MONTH, 4, '2018-01-02') --YYYY-MM-DD

-------------------
SELECT TOP 10 * FROM [dbo].[DimEmployee]

SELECT EMPLOYEEKEY, LASTNAME, HIREDATE, BIRTHDATE, DATEDIFF(YEAR, BIRTHDATE, HireDate) 
FROM [dbo].[DimEmployee]

--GET DATE OF FIRST DAY OF THIS MONTH
SELECT DATEADD(DD, -(DATEPART(DAY, GETDATE()) - 1), GETDATE())

---------------------
--AGGREGATE FUNCTIONS
SELECT * FROM MYSALARY

SELECT AVG(SALARY) FROM MYSALARY

SELECT COUNT(SALARY) FROM MYSALARY
SELECT COUNT(*) FROM MYSALARY

SELECT SUM(SALARY) FROM MYSALARY

SELECT MIN(SALARY) FROM MYSALARY
SELECT MAX(SALARY) FROM MYSALARY

--STRINGS
PRINT CONCAT('FOO', 'BAR')

SELECT * FROM MYORDER
SELECT ORDERNUMBER, ORDERNAME, CONCAT(ORDERNUMBER, ' - ', ORDERNAME) AS CONCATENATEDDTEXT FROM MYORDER

SELECT ORDERNUMBER, ORDERNAME, CONCAT(ORDERNUMBER, ' - ', RAND()) FROM MYORDER

--STRING PARTS
SELECT ORDERNUMBER, ORDERNAME, LEFT(ORDERNAME, 3) FROM MYORDER
SELECT ORDERNUMBER, ORDERNAME, RIGHT(ORDERNAME, 3) FROM MYORDER

--SUBSTRING
SELECT ORDERNUMBER, ORDERNAME, SUBSTRING(ORDERNAME, 3, 2) FROM MYORDER
SELECT ORDERNUMBER, ORDERNAME, SUBSTRING(ORDERNAME, 3, 5) FROM MYORDER

--LOWERCASE/UPPERCASE
SELECT ORDERNUMBER, ORDERNAME, LOWER(ORDERNAME) FROM MYORDER
SELECT ORDERNUMBER, ORDERNAME, UPPER(ORDERNAME) FROM MYORDER

--LENGT
SELECT ORDERNUMBER, ORDERNAME, LEN(ORDERNAME) FROM MYORDER

SELECT ORDERNUMBER, ORDERNAME, CONCAT(UPPER(LEFT(ORDERNAME, 1)), LOWER(SUBSTRING(ORDERNAME, 2, LEN(ORDERNAME)))) FROM MYORDER

--TRIM
SELECT '        MYTEXT         '
SELECT LEN('        MYTEXT         ')
SELECT LTRIM('        MYTEXT         ')
SELECT RTRIM('        MYTEXT         ')
SELECT LTRIM(RTRIM('        MYTEXT         '))