DROP TABLE departments2;
DROP TABLE employees2;

CREATE TABLE departments2
(  department_id   INTEGER      NOT NULL,
   department_name VARCHAR(30)  NOT NULL,
   manager_id      INTEGER,
 CONSTRAINT departments2_department_id_pk
   PRIMARY KEY(department_id) );

CREATE TABLE employees2
(  employee_id     INTEGER         NOT NULL,
   first_name      VARCHAR( 20   ) NOT NULL,
   last_name       VARCHAR( 30   ) NOT NULL,
   department_id   INTEGER,
   manager_id      INTEGER,
   hire_date       DATE,
   salary          DECIMAL(7),
  CONSTRAINT employees2_employee_id_pk
      PRIMARY KEY( employee_id ) );
      
INSERT ALL
INTO departments2 VALUES ('11', 'Administration',         01)
INTO departments2 VALUES ('22', 'Accounting',             NULL)
INTO departments2 VALUES ('33', 'Sales',                  03)
INTO departments2 VALUES ('44', 'Human Resources',        NULL)
INTO departments2 VALUES ('55', 'Information Technology', 02)
SELECT * FROM DUAL;

INSERT ALL
INTO employees2 VALUES( 01, 'Lauren', 'Alexander', 22, NULL, '2012-05-20', 60000 )
INTO employees2 VALUES( 02, 'Lisa',   'James',     55, 01,   '2016-08-25', 81000 )
INTO employees2 VALUES( 03, 'Dave',   'Bernard',   55, 02,   '2012-08-19', 21000 )
INTO employees2 VALUES( 04, 'Steve',  'Carr',      55, 02,   '2015-10-20', 45000 )
INTO employees2 VALUES( 05, 'Marg',   'Horner',    11, 01,   '2015-03-14', 102000 )
INTO employees2 VALUES( 06, 'Bill',   'Turner',  NULL, NULL, '2018-02-15', 135000 )
SELECT * FROM DUAL;
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- INNER JOIN
SELECT employee_id,      -- employees table
       first_name,       -- employees table
       last_name,        -- employees table
       department_id,    -- departments table
       department_name   -- departments table
FROM employees2
     JOIN departments2    
     USING(department_id)
ORDER BY employee_id;

-- INNER JOIN with tables reversed
SELECT department_id,    -- departments table
       department_name,  -- departments table
       employee_id,      -- employees table
       first_name,       -- employees table
       last_name         -- employees table
FROM departments2
     INNER JOIN employees2                                    
     USING(department_id)
ORDER BY department_id, employee_id;

--------------------------------------------------------------------------------
-- ON clause - must qualify ambiguous names
SELECT employee_id,      -- employees table
       first_name,       -- employees table
       last_name,        -- employees table
       d.department_id,    -- departments table
       department_name   -- departments table
FROM employees2 e
     JOIN departments2  d  
     ON e.department_id = d.department_id
ORDER BY employee_id;

--------------------------------------------------------------------------------
-- CREATE DEPARTMENTS3 table and copy date from DEPARTMENTS2 table 
-- dept_id (department_id) has a different name in the departments3 table
DROP TABLE departments3;
CREATE TABLE departments3 (dept_id, department_name)             
  AS ( SELECT department_id, department_name FROM departments2 );

SELECT * FROM departments3;

--------------------------------------------------------------------------------
-- ON is required when the joining columns have different names  
SELECT employee_id,
       first_name,
       last_name,
       department_id,
       department_name
FROM employees2
     INNER JOIN departments3  
     ON department_id = dept_id   
ORDER BY employee_id;                

--------------------------------------------------------------------------------
-- OUTER JOIN
SELECT employee_id,
       first_name,
       last_name,
       d.department_id,
       department_name
FROM employees2 e
     FULL OUTER JOIN departments2 d             
     ON e.department_id = d.department_id                
ORDER BY employee_id; 

--------------------------------------------------------------------------------
-- CROSS JOIN
SELECT employee_id,
       last_name,
       departments2.department_id,
       department_name
  FROM employees2
  CROSS JOIN departments2;
  
  
 SELECT count(*)
  FROM employees2
  CROSS JOIN departments2;

--------------------------------------------------------------------------------
-- SELF-JOIN
-- A join in which a table is joined to itself
-- A table assumes several roles in the FROM clause
-- A table alias is used to identify which table role is meant when specifying a column name in any of the other clauses
-- List employees and their managers
-- List employee_id, employee name and last_name (mgr)

SELECT employee_id,
       first_name || ' ' || last_name AS employee,
       manager_id
  FROM employees2
  ORDER BY employee_id; 


-- List only the employees that have a manager
SELECT emp.employee_id,
       emp.first_name || ' ' || emp.last_name AS employee_name,
       emp.manager_id,
       mgr.first_name || ' ' || mgr.last_name AS manager_name
  FROM employees2 emp
       INNER JOIN employees2 mgr
       ON emp.manager_id = mgr.employee_id
  ORDER BY emp.employee_id;

  
  
-- List all employees, including those that do not have a manager
SELECT emp.employee_id,
       emp.first_name || ' ' || emp.last_name AS employee_name,
       emp.manager_id,
       mgr.first_name || ' ' || mgr.last_name AS manager_name
  FROM employees2 emp
       LEFT OUTER JOIN employees2 mgr
       ON emp.manager_id = mgr.employee_id
  ORDER BY emp.employee_id;


-- List all employees, including those that do not have a manager
-- Display 'Not Assigned' for employees with no manager 
SELECT emp.employee_id,
       emp.first_name || ' ' || emp.last_name AS employee_name,
       COALESCE( TO_CHAR( emp.manager_id, '99' ), '  Not Assigned' ) AS manager_id,
       COALESCE( mgr.first_name || ' ' || mgr.last_name, '--' ) AS manager_name
  FROM employees2 emp
       LEFT OUTER JOIN employees2 mgr
       ON emp.manager_id = mgr.employee_id
  ORDER BY emp.employee_id;



-- List managers and the employees that report to them
SELECT mgr.employee_id AS manager_id,
       mgr.first_name || ' ' || mgr.last_name AS manager_name,
       emp.employee_id,
       emp.first_name || ' ' || emp.last_name AS employee_name
  FROM employees2 mgr
       INNER JOIN employees2 emp
       ON mgr.employee_id = emp.manager_id
  ORDER BY mgr.employee_id, emp.employee_id;

