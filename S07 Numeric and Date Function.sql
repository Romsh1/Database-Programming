------Romika Chaudhary------
------C0921918-------
------Numeric and Date Function----------
-------Nov 14, 2023----------


---Numeric Functions---
--1
--Using ROUND Function to one decimal place
SELECT ROUND(845.553, 1) AS "ROUND" FROM dual;

--Using TO_CHAR Function to one decimal place
SELECT TO_CHAR(854.553, 999.9) AS "ROUND" FROM dual;

--Using ROUND Function to two decimal places
SELECT ROUND(30695.348, 2) AS "ROUND" FROM dual;

--Using TO_CHAR Function to two decimal places
SELECT TO_CHAR(30695.348, 99999.99) AS "ROUND" FROM dual;

--Using ROUND Function to -2 decimal point
SELECT ROUND(30695.348, -2) AS "ROUND" FROM dual;

--Using truncate to one decimal
SELECT TRUNC(2.3587, 1) AS "TRUNCATE" FROM dual;

--2
SELECT MOD(34, 8) AS "RESULT" FROM dual;

--3
SELECT first_name || ' ' || last_name AS "EMPLOYEE", TO_CHAR(monthly_salary * 12, '$999,999.00') AS "YEARLY_SALARY"
FROM B_EMPLOYEES
WHERE (monthly_salary * 12) > 75000
ORDER BY (monthly_salary * 12) DESC;

--4
SELECT first_name || ' ' || last_name AS "EMPLOYEE", (monthly_salary * 12) AS "CURRENT_SALARY", ROUND((monthly_salary * 12) * 1.0345, '2') AS "NEW_SALARY"
FROM B_EMPLOYEES
WHERE (monthly_salary * 12) * 1.0345 > 80000
ORDER BY (monthly_salary * 12) * 1.0345 DESC;

--5
SELECT first_name || ' ' || last_name AS "EMPLOYEE", TO_CHAR(monthly_salary*12, '$999,999.99') AS "CURRENT_SALARY", TO_CHAR((monthly_salary*12) * 1.0345, '$999,999.99') AS "NEW_SALARY"
FROM B_EMPLOYEES
WHERE (monthly_salary*12) * 1.0345 > 80000
ORDER BY NEW_SALARY DESC; 

--6
SELECT cust_city AS "CITY", customer_name, TO_CHAR(credit_limit, '$999,999.99') AS "CURRENT_LIMIT", TO_CHAR((credit_limit * 1.0525), '$999,999.99') AS "NEW_LIMIT"
FROM B_CUSTOMERS
WHERE credit_limit * 1.0525 BETWEEN 60000 AND 80000
ORDER BY NEW_LIMIT DESC;

--7
SELECT PRODUCT_CODE, TO_CHAR(PRICE, '$999.99') AS "ORIGINAL_PRICE", TO_CHAR(FLOOR(PRICE), '$999.99') AS "MONDAY_PRICE",
TO_CHAR(CEIL(PRICE), '$999.99') AS "TUESDAY_PRICE"
FROM B_PRICES
WHERE END_DATE IS NULL;

--8  
SELECT
CASE
    WHEN MOD(:ENTER_NUMBER, 2) = 0 THEN 'EVEN NUMBER'
    WHEN MOD(:ENTER_NUMBER, 2) = 1 THEN 'ODD NUMBER'
END AS RESULT
FROM DUAL;

---DATE FUNCTIONS---
--1
SELECT '2024-01-16' AS "TODAY", LAST_DAY('2024-01-16') AS "Last Day of Month" FROM dual;

--2
SELECT '2024-01-16' AS TODAY, NEXT_DAY('2024-01-16', 'SATURDAY') AS "Last Day of Month" FROM DUAL;

--3
SELECT first_name || ' ' || last_name AS "NAME", '2025-01-01' AS "TODAY", hire_date, TRUNC(MONTHS_BETWEEN('2025-01-01', hire_date)) AS "MONTHS_EMPLOYED"
FROM B_EMPLOYEES
WHERE MONTHS_BETWEEN('2025-01-01', hire_date) > 252
ORDER BY "MONTHS_EMPLOYED" desc;

--4
SELECT first_name || ' ' || last_name AS "NAME", '2025-01-01' AS "TODAY", hire_date, TRUNC(MONTHS_BETWEEN('2025-01-01', hire_date) / 12, 2) AS "YEARS_EMPLOYED"
FROM B_EMPLOYEES
WHERE MONTHS_BETWEEN('2025-01-01', hire_date) / 12 > 20
ORDER BY "YEARS_EMPLOYED" desc;

--5
SELECT first_name || ' ' || last_name AS "NAME", '2025-01-01' AS "TODAY", hire_date, TRUNC(MONTHS_BETWEEN('2025-01-01', hire_date) / 12) AS "YEARS", 
TRUNC(MONTHS_BETWEEN('2025-01-01', hire_date)) AS "TOTAL_MONTHS"
FROM B_EMPLOYEES
WHERE MONTHS_BETWEEN('2025-01-01', hire_date) / 12 > 20;

--6
SELECT '2025-04-30' AS "TODAY",ADD_MONTHS('2025-04-30', 6) AS "APPOINTMENT" FROM dual;

--7
SELECT '2025-02-28' AS "TODAY", ADD_MONTHS('2025-02-28', 4) AS "APPOINTMENT" FROM dual;

--8
SELECT '2021-11-09' AS "TODAY", LAST_DAY('2021-11-09') AS "DEADLINE" FROM dual;

--9
SELECT '2021-11-09' AS "TODAY", NEXT_DAY(ADD_MONTHS('2021-11-09', 6), 'FRIDAY') AS "Friday Date" FROM dual;

--10
SELECT first_name || ' ' || last_name AS "Name", TO_CHAR(hire_date, 'Month DD, YYYY') AS "Hire date"
FROM B_EMPLOYEES
ORDER BY last_name;

--11
SELECT first_name || ' ' || last_name AS "Name", TO_CHAR(hire_date, 'Day, Month DD, YYYY') AS "Hire date"
FROM B_EMPLOYEES
ORDER BY last_name;

--12
SELECT first_name || ' ' || last_name AS "NAME", TO_CHAR(monthly_salary * 12, '999,999.99') AS "Current Yearly Salary", TO_CHAR((monthly_salary * 12) + 1200, '999,999.99') AS "New Yearly Salary"
FROM B_EMPLOYEES
WHERE employee_id = 105; 

--13
SELECT CUSTOMER_NAME, STREET || ' ' || CUST_CITY || ', ' || CUST_STATE AS "ADDRESS", COALESCE(TO_CHAR(DISCOUNT, '0.999'), '[NULL]') AS "CURRENT_DISCOUNT", COALESCE(TO_CHAR(DISCOUNT, '0.999'), '0.100') AS "NEW_DISCOUNT"
FROM B_CUSTOMERS
WHERE CUST_STATE IN ('CA', 'NY', 'SC')
ORDER BY CUSTOMER_NAME;

--14
SELECT CUSTOMER_NAME, STREET || ' ' || CUST_CITY || ', ' || CUST_STATE AS "ADDRESS", COALESCE(TO_CHAR(DISCOUNT, '0.999'), '[NULL]') AS "CURRENT_DISCOUNT", COALESCE(TO_CHAR(DISCOUNT, '0.99'), 'N/A') AS "DISCOUNT"
FROM B_CUSTOMERS
WHERE CUST_STATE IN ('CA', 'NY', 'SC')
ORDER BY CUSTOMER_NAME;

--15
SELECT CATEGORY_CODE AS "Category Code", PROD_DESCRIPTION AS "Description", TO_CHAR(FLOOR(PRICE), '9999.99') AS "Original Price",
CASE CATEGORY_CODE
    WHEN 'HW' THEN FLOOR(PRICE) * 1.25
    WHEN 'LA' THEN FLOOR(PRICE) * 1.50
    WHEN 'SG' THEN FLOOR(PRICE) * 1.75
    ELSE PRICE * 1.00
END AS "New Price"
FROM B_PRODUCTS
WHERE CATEGORY_CODE IN ('HW', 'LA', 'SG') AND
    CASE CATEGORY_CODE
    WHEN 'HW' THEN FLOOR(PRICE) * 1.25
    WHEN 'LA' THEN FLOOR(PRICE) * 1.50
    WHEN 'SG' THEN FLOOR(PRICE) * 1.75
    ELSE PRICE * 1.00
END > 2500
ORDER BY CATEGORY_CODE, 
"New Price" DESC;   

