---Romika Chaudhary, C0921918---
-----S01 SELECT STATEMENT-----
----Nov 2, 2023----


--1
SELECT * FROM B_PRODUCTS;

--2
SELECT PRODUCT_CODE, PROD_DESCRIPTION, CATEGORY_CODE, PRICE 
FROM B_PRODUCTS;

--3
SELECT CUSTOMER_NAME, CREDIT_LIMIT, BALANCE 
FROM B_CUSTOMERS;

--4
SELECT CUSTOMER_NAME, BALANCE, CREDIT_LIMIT 
FROM B_CUSTOMERS;

--5
SELECT CUSTOMER_NAME FROM B_CUSTOMERS;

--6
SELECT CUSTOMER_NAME, CREDIT_LIMIT * 1.12 AS "NEW_CREDIT_LIMIT" 
FROM B_CUSTOMERS;

--7
SELECT CUSTOMER_NAME AS "CUSTOMER NAME",
 CUST_CITY AS "CITY" FROM B_CUSTOMERS;

--8
SELECT CUSTOMER_NAME,
CREDIT_LIMIT AS "OLD_CREDIT_LIMIT",
CREDIT_LIMIT*1.12 AS "NEW_CREDIT_LIMIT"
FROM B_CUSTOMERS;

--9
SELECT CUSTOMER_ID AS "CUSTOMER",
CUSTOMER_NAME AS "CUSTOMER NAME",
(CREDIT_LIMIT - BALANCE) AS "Available Credit"
FROM B_CUSTOMERS;

--10
SELECT CUSTOMER_NAME, CUST_CITY || '' || CUST_STATE || '' || COUNTRY AS "ADDRESS" 
FROM B_CUSTOMERS;

--11
SELECT CUSTOMER_NAME, CUST_CITY || ', ' || CUST_STATE || ' ' || COUNTRY AS "ADDRESS" 
FROM B_CUSTOMERS;

--12
SELECT CUSTOMER_NAME || ' has a balance of ' || BALANCE AS "CUSTOMER BALANCE" 
FROM B_CUSTOMERS;

--13
SELECT 'Customer ' || CUSTOMER_ID || ' is located in ' || CUST_CITY || ', ' || CUST_STATE AS "Customer Location"
FROM B_CUSTOMERS;

--14
SELECT CUST_CITY AS "CITY" FROM B_CUSTOMERS;

--15
SELECT DISTINCT CUST_CITY AS "CITY" FROM B_CUSTOMERS;

