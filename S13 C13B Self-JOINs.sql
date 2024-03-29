-- Romika Chaudhary
-- C0921918
-- S13 C13B Self-JOINs
-- November 25, 2023

--1  
SELECT EMP.EMPLOYEE_ID AS "EMP#", 
    EMP.FIRST_NAME || ' ' || EMP.LAST_NAME AS "EMPLOYEE",
    MGR.FIRST_NAME || ' ' ||  MGR.LAST_NAME AS "MANAGER", 
    MGR.EMPLOYEE_ID AS "MGR#"
FROM B_EMPLOYEES EMP
    INNER JOIN B_EMPLOYEES MGR
        ON EMP.MANAGER_ID = MGR.EMPLOYEE_ID
ORDER BY 
    EMP.EMPLOYEE_ID;


--2
SELECT EMP.EMPLOYEE_ID AS "EMP#", 
    EMP.FIRST_NAME || ' ' || EMP.LAST_NAME AS "EMPLOYEE",
    COALESCE(MGR.LAST_NAME, 'Not assigned') AS "MANAGER", 
    COALESCE(TO_CHAR(EMP.MANAGER_ID, '9999'), '---') AS "MGR#"
FROM B_EMPLOYEES EMP
    LEFT JOIN B_EMPLOYEES MGR
        ON EMP.MANAGER_ID = MGR.EMPLOYEE_ID
ORDER BY EMP.EMPLOYEE_ID;


--3
SELECT MGR.EMPLOYEE_ID AS "MGR#", MGR.FIRST_NAME || ' ' || MGR.LAST_NAME AS "MANAGER",
    EMP.EMPLOYEE_ID AS "EMP#",
    EMP.FIRST_NAME || ' ' || EMP.LAST_NAME AS "EMPLOYEE"
FROM B_EMPLOYEES MGR
LEFT JOIN B_EMPLOYEES EMP
    ON EMP.MANAGER_ID = MGR.EMPLOYEE_ID
WHERE MGR.EMPLOYEE_ID IN (110, 111, 112)
ORDER BY 
    MGR.EMPLOYEE_ID,
    EMP.EMPLOYEE_ID;


--4
SELECT EMP.FIRST_NAME || ' ' || EMP.LAST_NAME AS "EMPLOYEE",
    TO_CHAR(EMP.HIRE_DATE, 'Mon dd, yyyy') AS "EMP_HIRE_DATE",
    MGR.FIRST_NAME || ' ' || MGR.LAST_NAME AS "MANAGER",
    TO_CHAR(MGR.HIRE_DATE, 'Mon dd, yyyy') AS "MGR_HIRE_DATE"
FROM B_EMPLOYEES EMP
JOIN B_EMPLOYEES MGR
    ON EMP.MANAGER_ID = MGR.EMPLOYEE_ID
WHERE EMP.HIRE_DATE < MGR.HIRE_DATE
ORDER BY
    EMP.LAST_NAME;


--5
SELECT DEPT.DEPARTMENT_NAME AS "DEPARTMENT_NAME",
    EMP.FIRST_NAME || ' ' || EMP.LAST_NAME AS "EMPLOYEE_NAME",
    JB.JOB_TITLE
FROM B_DEPARTMENTS DEPT
JOIN B_EMPLOYEES EMP USING (DEPARTMENT_CODE)
JOIN B_JOBS JB USING (JOB_CODE)
ORDER BY
    DEPT.DEPARTMENT_NAME,
    EMP.LAST_NAME;


--6 
SELECT CS.CUSTOMER_NAME AS "CUSTOMER_NAME",
    ORDER_ID AS "ORDER_ID",
    TO_CHAR(SUM(OL.QUANTITY*OL.PRICE_PAID), '$9,999.99') AS "ORDER_TOTAL"
FROM B_CUSTOMERS CS
    JOIN B_ORDERS USING (CUSTOMER_ID)
    JOIN B_ORDER_LINES OL USING (ORDER_ID)
GROUP BY CS.CUSTOMER_NAME, ORDER_ID
ORDER BY 
    CS.CUSTOMER_NAME,
    ORDER_ID;


--7
SELECT CS.CUSTOMER_NAME, ORDER_DATE, ORDER_ID, PRODUCT_CODE AS PRODUCT_CODE, QUANTITY, PRICE_PAID, PROD_DESCRIPTION
FROM B_CUSTOMERS CS
JOIN B_ORDERS USING (CUSTOMER_ID)
RIGHT JOIN B_ORDER_LINES USING (ORDER_ID)
JOIN B_PRODUCTS USING (PRODUCT_CODE)
ORDER BY
    CS.CUSTOMER_NAME,
    ORDER_ID,
    PRODUCT_CODE;

