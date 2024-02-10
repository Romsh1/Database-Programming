---Romika Chaudhary---
---C0921918---
---S05 C11B Character Function---
---Nov 7, 2023---

--1
SELECT CUSTOMER_NAME AS "CUSTOMER", UPPER(STREET || ' ' || CUST_CITY || ', ' || CUST_STATE || ' ' || CUST_ZIP) AS "Address"
FROM b_customers
WHERE CUST_STATE IN ('WI', 'SC', 'NY')
ORDER BY CUSTOMER;

--2
SELECT LOWER(LAST_NAME || ', ' || FIRST_NAME) AS "Employee Name", LOWER(STREET || ' ' || EMP_CITY || ', ' || EMP_STATE || ' ' || EMP_ZIP) AS "Address"
FROM b_employees
WHERE EMPLOYEE_ID BETWEEN 104 AND 109
ORDER BY "Employee Name";


--3
SELECT CONCAT('Customer id ', CUSTOMER_ID) AS "Customer", UPPER(CUSTOMER_NAME) AS "Name"
FROM b_customers
WHERE LOWER(CUST_CITY) = LOWER('San Diego')
ORDER BY "Customer";

--4
SELECT DISTINCT UPPER(CUST_CITY) AS "City", LENGTH(CUST_CITY) AS "City Length"
FROM b_customers
ORDER BY "City";

--5 
SELECT SUBSTR(FIRST_NAME, 1, 1) || '. ' || LAST_NAME AS "Employee Name", MANAGER_ID AS "Manager"
FROM b_employees
WHERE MANAGER_ID IS NOT NULL
ORDER BY LAST_NAME DESC;

--6
SELECT SUBSTR(FIRST_NAME, 1, 1) || '. ' || LAST_NAME AS "NAME", HIRE_DATE
FROM b_employees
WHERE MANAGER_ID = :Enter_manager_id
ORDER BY LAST_NAME DESC;

--7
SELECT CUSTOMER_NAME AS "Customer", CUST_CITY AS "City"
FROM b_customers
WHERE LOWER(CUST_CITY) LIKE LOWER('S%')
ORDER BY "Customer";

--8
SELECT LENGTH('Database Design and SQL') AS "Length" FROM DUAL;

--9   
SELECT ' Database' || ' ' || 'Design ' || '' || ' and SQL ' AS "TITLLE" FROM DUAL; 

--10  
SELECT LPAD('Database', 12, '*') || '' || LPAD('Internet', 12, '*') || '' || LPAD('Academy', 11, '*') || RPAD(' ', 5, '*') AS "DIA" FROM DUAL;

--11
SELECT RPAD('Database', 11, '$') || '' || RPAD('Internet', 11, '$') || '' || RPAD('Academy', 7, '*') AS "DIA" FROM DUAL;


--12
SELECT REPLACE('Database Internet Academy', 'Internet', 'Worldwide') AS "Course" FROM DUAL;

--13
SELECT PRODUCT_CODE, PROD_DESCRIPTION, CONCAT('$',PRICE) 
FROM b_products
WHERE PRICE > 1500
ORDER BY PRICE DESC;

--14
SELECT PRODUCT_CODE, PROD_DESCRIPTION, PRICE
FROM b_products
WHERE LOWER(CATEGORY_CODE) = LOWER(:Enter_category_code) 
AND PRICE BETWEEN 2400 AND 6000 
ORDER BY PRODUCT_CODE;

