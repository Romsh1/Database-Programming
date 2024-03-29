---Romika Chaudhary---
---C0921918---
---C10_2 WHERE AND ORDER BY - Bobcat---
---Nov 4, 2023---

--1
SELECT CATEGORY_CODE, CATEGORY_NAME 
FROM B_CATEGORIES
ORDER BY CATEGORY_CODE;

--2
SELECT CUSTOMER_NAME, CREDIT_LIMIT, BALANCE 
FROM B_CUSTOMERS
WHERE BALANCE BETWEEN 40000 AND 80000
ORDER BY CUSTOMER_NAME DESC;

--3
SELECT PROD_DESCRIPTION AS "DESCRIPTION", PRICE
FROM B_PRODUCTS
WHERE CATEGORY_CODE = 'SA'
AND PRICE > 200
ORDER BY PRICE DESC;

--4
SELECT DISTINCT CUST_CITY AS "CITY"
FROM B_CUSTOMERS
WHERE CUST_STATE = 'NY' OR CUST_STATE = 'CO'
ORDER BY CITY;

--5
SELECT CUSTOMER_NAME, CREDIT_LIMIT, BALANCE
FROM B_CUSTOMERS
WHERE CUSTOMER_ID = 130;

--6
SELECT CUSTOMER_NAME AS "Customer Name", CUST_CITY || ', ' || CUST_STATE AS "Location", CREDIT_LIMIT - BALANCE AS "Available Credit"
FROM B_CUSTOMERS
WHERE CREDIT_LIMIT - BALANCE > 30000
ORDER BY "Available Credit" DESC;

--7
SELECT PRODUCT_CODE, QOH
FROM B_INVENTORY
WHERE QOH BETWEEN 20 AND 30
ORDER BY QOH DESC;

--8
SELECT CUSTOMER_NAME, STREET || ' ' || CUST_CITY || ', ' || CUST_STATE AS "ADDRESS" 
FROM B_CUSTOMERS
WHERE BALANCE BETWEEN 40000 AND 60000
ORDER BY CUSTOMER_NAME;

--9
SELECT ORDER_DATE, ORDER_ID
FROM B_ORDERS
WHERE ORDER_DATE BETWEEN '2020-10-20' AND '2020-11-20'
ORDER BY ORDER_DATE,
ORDER_ID;

--10
SELECT CATEGORY_CODE, PROD_DESCRIPTION AS "DESCRIPTION"
FROM B_PRODUCTS
WHERE CATEGORY_CODE IN ('SG', 'HW', 'LA')
ORDER BY CATEGORY_CODE,
DESCRIPTION;

--11
SELECT CATEGORY_CODE, PROD_DESCRIPTION AS "DESCRIPTION"
FROM B_PRODUCTS
WHERE CATEGORY_CODE NOT IN ('SG', 'HW', 'LA')
ORDER BY CATEGORY_CODE,
DESCRIPTION;

--12
SELECT FIRST_NAME || ' ' || LAST_NAME AS "EMPLOYEE"
FROM B_EMPLOYEES
WHERE MANAGER_ID IS NULL
ORDER BY LAST_NAME;

--13
SELECT EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME AS "EMPLOYEE", MANAGER_ID
FROM B_EMPLOYEES
WHERE MANAGER_ID IS NOT NULL
ORDER BY LAST_NAME;

--14
SELECT CATEGORY_CODE, PROD_DESCRIPTION AS "DESCRIPTION", PRICE
FROM B_PRODUCTS
WHERE PROD_DESCRIPTION LIKE '%maker%'
ORDER BY CATEGORY_CODE,
DESCRIPTION;

--15
SELECT WAREHOUSE_ID, PRODUCT_CODE, QOH
FROM B_INVENTORY
WHERE QOH > 40
ORDER BY WAREHOUSE_ID,
PRODUCT_CODE;

--16
SELECT ORDER_ID, CUSTOMER_ID, SHIP_DATE
FROM B_ORDERS
WHERE SHIP_DATE < '2020-10-20'
ORDER BY ORDER_ID DESC;

--17
SELECT CUST_CITY || ', ' || CUST_STATE AS "LOCATION", CUSTOMER_ID, CUSTOMER_NAME
FROM B_CUSTOMERS
WHERE CUSTOMER_NAME LIKE 'B%'
ORDER BY LOCATION,
CUSTOMER_ID;

--18
SELECT PROD_DESCRIPTION AS "DESCRIPTION"
FROM B_PRODUCTS
WHERE PROD_DESCRIPTION LIKE '%Range%'
ORDER BY DESCRIPTION;

--19
SELECT FIRST_NAME || ' ' || LAST_NAME AS "NAME" FROM B_EMPLOYEES
WHERE LAST_NAME LIKE '%s%' AND LAST_NAME LIKE '%i%'
ORDER BY LAST_NAME;


--20
SELECT CUSTOMER_NAME, CUST_CITY || ', ' || CUST_STATE 
FROM B_CUSTOMERS
WHERE CUSTOMER_NAME LIKE '%B%i%g%' AND CUSTOMER_NAME LIKE '%B%g%i%'
ORDER BY CUSTOMER_NAME; 

--21
SELECT CUSTOMER_NAME, CUST_CITY AS "CITY" FROM B_CUSTOMERS
WHERE CUST_CITY IN ('Colorado Springs', 'Las Vegas', 'San Diego')
ORDER BY CITY;

--22
SELECT SELLER_ID, ORDER_ID, ORDER_DATE
FROM B_ORDERS
WHERE SELLER_ID IN (105, 115, 125) AND ORDER_DATE > '2020-09-16'
ORDER BY SELLER_ID, ORDER_DATE, ORDER_ID;

--23
SELECT CUSTOMER_NAME, CUST_CITY
FROM B_CUSTOMERS
WHERE CREDIT_LIMIT BETWEEN 30000 AND 60000
AND CUST_STATE IN ('CO', 'CA')
ORDER BY CUSTOMER_NAME;

--24
SELECT CATEGORY_CODE, PRODUCT_CODE, PROD_DESCRIPTION AS "DESCRIPTION"
FROM B_PRODUCTS
WHERE CATEGORY_CODE NOT IN ('LA', 'SA')
ORDER BY CATEGORY_CODE,
PRODUCT_CODE;

--25
SELECT ORDER_ID, PRODUCT_CODE, QUANTITY, PRICE_PAID, QUANTITY * PRICE_PAID AS "EXTENDED_PRICE"
FROM B_ORDER_LINES
WHERE PRODUCT_CODE IN ('CD52', 'DR93', 'KV29')
ORDER BY ORDER_ID,
EXTENDED_PRICE;

