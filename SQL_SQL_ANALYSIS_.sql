-- DROP TABLE sales;
SELECT * FROM sales_data_sample;

SELECT count(*) FROM sales_data_sample;
-- Total number of records is 2823

SELECT COUNT(*) FROM pragma_table_info('sales_data_sample');
-- Total number of columns is 25

SELECT * from sales_data_sample where ORDERNUMBER is NULL;
-- no NULL VALUES
SELECT * from sales_data_sample where QUANTITYORDERED is NULL;
-- no NULL VALUES
SELECT * from sales_data_sample where PRICEEACH is NULL;
-- no NULL VALUES
SELECT * from sales_data_sample where ORDERLINENUMBER is NULL;
-- no NULL VALUES
SELECT * from sales_data_sample where SALES is NULL;
-- no NULL VALUES
SELECT * from sales_data_sample where ORDERDATE is NULL;
-- no NULL VALUES
SELECT * from sales_data_sample where STATUS is NULL;
-- no NULL VALUES
SELECT * from sales_data_sample where QTR_ID is NULL;
-- no NULL VALUES
SELECT * from sales_data_sample where MONTH_ID is NULL;
-- no NULL VALUES
SELECT * from sales_data_sample where YEAR_ID is NULL;
-- no NULL VALUES
SELECT * from sales_data_sample where PRODUCTLINE is NULL;
-- no NULL VALUES
SELECT * from sales_data_sample where MSRP is NULL;
-- no NULL VALUES
SELECT * from sales_data_sample where PRODUCTCODE is NULL;
-- no NULL VALUES
SELECT * from sales_data_sample where CUSTOMERNAME is NULL;
-- no NULL VALUES
SELECT * from sales_data_sample where PHONE is NULL;
-- no NULL VALUES
SELECT * from sales_data_sample where ADDRESSLINE1 is NULL;
-- no NULL VALUES
SELECT * from sales_data_sample where ADDRESSLINE2 is NULL;
-- 2521 NULL VALUES
SELECT * from sales_data_sample where CITY is NULL;
-- no NULL VALUES
SELECT * from sales_data_sample where STATE is NULL;
-- 1486 NULL VALUES
SELECT * from sales_data_sample where POSTALCODE is NULL;
-- 76 NULL VALUES
SELECT * from sales_data_sample where COUNTRY is NULL;
-- no NULL VALUES
SELECT * from sales_data_sample where TERRITORY is NULL;
-- no NULL VALUES
SELECT * from sales_data_sample where CONTACTLASTNAME is NULL;
-- no NULL VALUES
SELECT * from sales_data_sample where CONTACTFIRSTNAME is NULL;
-- no NULL VALUES
SELECT * from sales_data_sample where DEALSIZE is NULL;
-- no NULL VALUES

SELECT * FROM sales_data_sample sa WHERE ORDERNUMBER = 10100
--duplicate entries exist in the table as there are columns where 
-- QUANTITYORDERED is different for same ORDERNUMBER as seen in the
-- output of the above QUERY but this can be ascertained that the same order
-- can be repeated having different QUANTITYORDERED per se. Hence, I will 
-- ignore the duplicates as this is a constraint of sorts


-- Across all their product line, which one is the best selling?
SELECT PRODUCTLINE, sum(QUANTITYORDERED*PRICEEACH) as selling_amount FROM sales_data_sample GROUP by 1 ORDER by 2 DESC LIMIT 1;
-- Classic Cars are the best selling product line with sales of about 2968546.4 monetary units.

--What was the best year for sales?
SELECT YEAR_ID, sum(QUANTITYORDERED*PRICEEACH) as selling_amount FROM sales_data_sample GROUP by 1 ORDER by 2 DESC LIMIT 1;
-- year 2004 was the year of maximum sale having 3913700.87 monetary units

--What was the best month for sales?
SELECT MONTH_ID, sum(QUANTITYORDERED*PRICEEACH) as selling_amount FROM sales_data_sample GROUP by 1 ORDER by 2 DESC LIMIT 1;
--MONTH_ID 11 was month in which maximum sale of 1744682.45 monetary units were done

--Which country sold the most product?
SELECT COUNTRY, sum(QUANTITYORDERED*PRICEEACH) as selling_amount from sales_data_sample GROUP by 1 ORDER by 2 DESC LIMIT 1;
-- USA sold the most product

--Who is the best customer?
SELECT CUSTOMERNAME, sum(QUANTITYORDERED*PRICEEACH) FROM sales_data_sample GROUP by 1 ORDER by 2 DESC LIMIT 1;
--Euro Shopping Channel was the best customer afa monetary aspect is concerned.