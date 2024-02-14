-- Romika Chaudhary --
-- C0921918 --
-- S14 Single Subqueries --
-- Nov 28, 2023 --


--1
SELECT FIRST_NAME, LAST_NAME, TO_CHAR(MONTHLY_SALARY, '$9,999.99') AS "SALARY"
FROM B_EMPLOYEES
WHERE MONTHLY_SALARY = (SELECT MIN(MONTHLY_SALARY) FROM B_EMPLOYEES);


--2
SELECT CUSTOMER_ID, CUSTOMER_NAME, TO_CHAR(CREDIT_LIMIT - BALANCE, '$99,999.99') AS "AVAILABLE_CREDIT"
FROM B_CUSTOMERS
WHERE CREDIT_LIMIT - BALANCE > (SELECT AVG(CREDIT_LIMIT - BALANCE) FROM B_CUSTOMERS)
ORDER BY AVAILABLE_CREDIT DESC
FETCH FIRST 6 ROWS ONLY;


--3
SELECT CUSTOMER_NAME, ORDER_ID, SHIP_DATE - ORDER_DATE AS "DAYS_TO_SHIP"
FROM B_CUSTOMERS
JOIN B_ORDERS USING (CUSTOMER_ID)
WHERE SHIP_DATE - ORDER_DATE > (SELECT AVG(SHIP_DATE - ORDER_DATE) FROM B_ORDERS)
ORDER BY DAYS_TO_SHIP DESC;


--4
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_NAME, JOB_TITLE, TO_CHAR(MONTHLY_SALARY, '$99,999.99') AS "SALARY"
FROM B_EMPLOYEES
JOIN B_DEPARTMENTS USING (DEPARTMENT_CODE)
JOIN B_JOBS USING (JOB_CODE)
WHERE MONTHLY_SALARY > (SELECT AVG(MONTHLY_SALARY) FROM B_EMPLOYEES WHERE DEPARTMENT_CODE = 'MA')
ORDER BY SALARY DESC
FETCH FIRST 8 ROWS ONLY;


--5
SELECT JOB_CODE, JOB_TITLE, FIRST_NAME || ' ' || LAST_NAME AS "EMPLOYEE_NAME"
FROM B_EMPLOYEES
JOIN  B_JOBS USING (JOB_CODE)
WHERE JOB_CODE NOT IN (SELECT JOB_CODE FROM B_EMPLOYEES WHERE LAST_NAME = 'Evans')
ORDER BY JOB_TITLE, EMPLOYEE_NAME;


--6
SELECT FIRST_NAME || ' ' || LAST_NAME AS "EMPLOYEE_NAME" FROM B_EMPLOYEES
WHERE DEPARTMENT_CODE IN (SELECT DEPARTMENT_CODE FROM B_DEPARTMENTS WHERE DEPARTMENT_NAME = 'Video Games')
ORDER BY LAST_NAME;


--7
SELECT FIRST_NAME || ' ' || LAST_NAME, JOB_CODE, JOB_TITLE
FROM B_EMPLOYEES
JOIN B_JOBS USING (JOB_CODE)
WHERE JOB_CODE IN (SELECT JOB_CODE FROM B_EMPLOYEES WHERE EMPLOYEE_ID=:ENTER_EMPLOYEE_ID)
ORDER BY LAST_NAME;


--8
SELECT FIRST_NAME || ' ' || LAST_NAME AS "EMPLOYEE", DEPARTMENT_NAME, TO_CHAR(MONTHLY_SALARY, '$9,999.99') AS "MONTHLY_SALARY"
FROM B_DEPARTMENTS
JOIN B_EMPLOYEES USING (DEPARTMENT_CODE)
WHERE MONTHLY_SALARY > (SELECT MONTHLY_SALARY FROM B_EMPLOYEES WHERE LAST_NAME = 'Allan') 
AND DEPARTMENT_CODE = (SELECT DEPARTMENT_CODE FROM B_EMPLOYEES WHERE LAST_NAME = 'Harper')
ORDER BY MONTHLY_SALARY DESC;