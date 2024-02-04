-- Romika Chaudhary --
-- C0921918 --
-- S11 C13B JOINs --
-- Nov 23, 2023 --

--1
SELECT EMPLOYEE_ID, LAST_NAME, DEPARTMENT_NAME, 
    TO_CHAR(HIRE_DATE, 'Month DD, YYYY') AS "HIRE_DATE"
FROM B_EMPLOYEES
JOIN B_DEPARTMENTS USING (DEPARTMENT_CODE)
WHERE EXTRACT(YEAR FROM HIRE_DATE) = 2010
ORDER BY EMPLOYEE_ID;


--2
SELECT D.DEPARTMENT_CODE,
    D.DEPARTMENT_NAME,
    COALESCE(E.FIRST_NAME, '-----') AS FIRST_NAME,
    COALESCE(E.LAST_NAME, '-----') AS LAST_NAME
FROM B_EMPLOYEES E
RIGHT OUTER JOIN B_DEPARTMENTS D 
    ON E.DEPARTMENT_CODE = D.DEPARTMENT_CODE
ORDER BY D.DEPARTMENT_CODE;


--3
SELECT E.LAST_NAME,
    E.FIRST_NAME,
    COALESCE(D.DEPARTMENT_NAME, 'Not Assigned') AS "DEPARTMENT"
FROM B_EMPLOYEES E
LEFT OUTER JOIN B_DEPARTMENTS D
    ON E.DEPARTMENT_CODE = D.DEPARTMENT_CODE
ORDER BY LAST_NAME;


--4
SELECT d.department_name,
       COALESCE(e.first_name || ' ' || e.last_name, 'Not assigned') AS "MANAGER"
FROM b_departments d
LEFT JOIN b_employees e ON d.manager_id = e.employee_id
WHERE d.manager_id IS NOT NULL
ORDER BY department_name;


--5
SELECT FIRST_NAME, LAST_NAME, TO_CHAR(MONTHLY_SALARY*12, '$99,9999.99') AS "YEARLY_SALARY", TO_CHAR(MAX_SALARY, '$999,999.99') AS "MAX_SALARY"
FROM B_EMPLOYEES
JOIN B_JOBS USING (JOB_CODE)
WHERE MAX_SALARY > 50000
ORDER BY MAX_SALARY DESC;


--6
SELECT DEPARTMENT_NAME, FIRST_NAME || ' ' || LAST_NAME AS "EMPLOYEE", JOB_TITLE
FROM B_DEPARTMENTS
JOIN B_EMPLOYEES USING (DEPARTMENT_CODE)
JOIN B_JOBS USING (JOB_CODE)
WHERE DEPARTMENT_NAME IN ('Video Games', 'Information Technology')
ORDER BY DEPARTMENT_NAME, LAST_NAME;


--7  
SELECT d.department_code AS dept_code,
       d.department_name,
       TO_CHAR(AVG(e.monthly_salary * 12), '$999,999.00') AS average_yearly_salary
FROM b_departments d
JOIN b_employees e ON d.department_code = e.department_code
GROUP BY d.department_code, d.department_name
HAVING AVG(e.monthly_salary * 12) > 50000
ORDER BY AVG(e.monthly_salary * 12) DESC;


--8 
SELECT d.department_code AS dept_code,
       d.department_name,
       COALESCE(TO_CHAR(mgr.employee_id), 'Not assigned') AS manager,
       COALESCE(mgr.first_name, '-----') AS first_name,
       COALESCE(mgr.last_name, '-----') AS last_name
FROM b_departments d
LEFT JOIN b_employees mgr ON d.manager_id = mgr.employee_id
ORDER BY d.department_code;


--9
SELECT WHSE_CITY, WAREHOUSE_ID AS "WHSE", CATEGORY_CODE AS "CATEGORY", 
    PRODUCT_CODE AS "PRODUCT", PROD_DESCRIPTION AS "DESCRIPTION", QOH
FROM B_WAREHOUSES
JOIN B_INVENTORY USING (WAREHOUSE_ID)
JOIN B_PRODUCTS USING (PRODUCT_CODE)
JOIN B_CATEGORIES USING (CATEGORY_CODE)
ORDER BY WHSE_CITY,
    WHSE,
    CATEGORY,
    PRODUCT;



