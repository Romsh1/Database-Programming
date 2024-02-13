---Romika Chaudhary---
---C0921918----
---P0803 Best Deal Stores---

DROP TABLE bd_stores CASCADE CONSTRAINTS;
DROP TABLE bd_departments CASCADE CONSTRAINTS;
DROP TABLE bd_employees CASCADE CONSTRAINTS;
DROP TABLE bd_store_departments CASCADE CONSTRAINTS;

----------------------------------------------
CREATE TABLE bd_stores (
  store_id        INTEGER,   -- NOT NULL constraints added with ALTER TABLE below
  city            VARCHAR(20)   NOT NULL,
  store_mgr_id    INTEGER );

----------------------------------------------
CREATE TABLE bd_departments (
  department_id   INTEGER       NOT NULL,
  department_name VARCHAR(50)   NOT NULL );

----------------------------------------------
CREATE TABLE bd_employees (
  employee_id     INTEGER       NOT NULL,
  first_name      VARCHAR(15)   NOT NULL,
  last_name       VARCHAR(15)   NOT NULL,
  birth_date      DATE          NOT NULL,
  soc_ins_no      DECIMAL(9, 0) NOT NULL,
  gender          VARCHAR(1)    NOT NULL,
  pension_contr   DECIMAL(1), 
  hire_date       DATE          NOT NULL,
  coach_id        INTEGER,
  store_id        INTEGER       NOT NULL,
  department_id   INTEGER       NOT NULL,
  job_class       VARCHAR(1),
  job_level       DECIMAL(1),
  salary          DECIMAL(9, 2),
  bonus           DECIMAL(7, 2),
  commission      DECIMAL(7, 2) );
 
----------------------------------------------  
CREATE TABLE bd_store_departments
( store_id        INTEGER  NOT NULL,
  department_id   INTEGER  NOT NULL,
  dept_mgr_id     INTEGER );


----------------------------------------------
-- Create PK & UK Constraints
ALTER TABLE bd_stores
ADD CONSTRAINT bd_stores_pk
PRIMARY KEY ( store_id );

ALTER TABLE bd_departments
ADD CONSTRAINT bd_departments_pk
PRIMARY KEY ( department_id );
  
ALTER TABLE bd_departments
ADD CONSTRAINT bd_departments_department_name_uk
UNIQUE ( department_name );

ALTER TABLE bd_employees
ADD CONSTRAINT bd_employees_pk
PRIMARY KEY ( employee_id );
  
ALTER TABLE bd_employees
ADD CONSTRAINT bd_employees_soc_ins_no_uk
UNIQUE ( soc_ins_no );

ALTER TABLE bd_store_departments
ADD CONSTRAINT bd_store_departments_pk
PRIMARY KEY ( store_id, department_id );


----------------------------------------------
-- Create FK Constraints
ALTER TABLE bd_stores
ADD CONSTRAINT bd_stores_store_mgr_id_fk
FOREIGN KEY ( store_mgr_id )
REFERENCES bd_employees ( employee_id );

ALTER TABLE bd_employees
ADD CONSTRAINT bd_employees_coach_id_fk
FOREIGN KEY ( coach_id )
REFERENCES bd_employees ( employee_id );

ALTER TABLE bd_employees
ADD CONSTRAINT bd_employees_store_id_fk
FOREIGN KEY ( store_id )
REFERENCES bd_stores ( store_id );
    
ALTER TABLE bd_employees
ADD CONSTRAINT bd_employees_department_id_fk
FOREIGN KEY ( department_id )
REFERENCES bd_departments ( department_id );
    
ALTER TABLE bd_store_departments
ADD CONSTRAINT bd_store_depts_store_id_fk
FOREIGN KEY ( store_id )
REFERENCES bd_stores ( store_id );

ALTER TABLE bd_store_departments
ADD CONSTRAINT bd_store_depts_department_id_fk
FOREIGN KEY ( department_id )
REFERENCES bd_departments ( department_id );
    
ALTER TABLE bd_store_departments
ADD CONSTRAINT bd_store_depts_dept_mgr_id_fk
FOREIGN KEY ( dept_mgr_id )
REFERENCES bd_employees ( employee_id );
    
     
----------------------------------------------
-- CHECK & DEFAULT Constraints
-- STORES     
ALTER TABLE bd_stores                        
ADD CONSTRAINT bd_stores_store_id_nn  -- NOT NULL constraint
CHECK ( store_id IS NOT NULL );
  
ALTER TABLE bd_stores
ADD CONSTRAINT stores_city_nn         
CHECK ( city IS NOT NULL );

ALTER TABLE bd_stores
ADD CONSTRAINT bd_stores_store_id_range_ck
CHECK ( store_id BETWEEN 11 AND 99 );	

	
-- DEPARTMENTS 
ALTER TABLE bd_departments
ADD CONSTRAINT bd_departments_dept_id_range_ck
CHECK ( department_id BETWEEN 300 AND 399 );	
	
	
-- EMPLOYEES 
ALTER TABLE bd_employees
ADD CONSTRAINT employees_birth_date_ck
CHECK ( birth_date >= DATE '1980-01-01' );

ALTER TABLE bd_employees
ADD CONSTRAINT employees_soc_ins_no_ck
CHECK ( soc_ins_no BETWEEN 1 AND 999999999 );
	
ALTER TABLE bd_employees
ADD CONSTRAINT employees_gender_ck
CHECK ( gender IN ( 'F', 'M') );

ALTER TABLE bd_employees
MODIFY (pension_contr DEFAULT 0);

ALTER TABLE bd_employees
ADD CONSTRAINT employees_pension_contr_ck
CHECK ( pension_contr IN ( 1, 0) );

-- Combining the above two constraints
ALTER TABLE bd_employees        
MODIFY (pension_contr DEFAULT 0)
ADD CONSTRAINT employees_pension_contr_2_ck
CHECK ( pension_contr IN ( 1, 0) );

ALTER TABLE bd_employees
MODIFY (hire_date DEFAULT CURRENT_DATE);
	
ALTER TABLE bd_employees
ADD CONSTRAINT bd_employees_hire_gt_birth_date_ck
CHECK ( hire_date > birth_date );

ALTER TABLE bd_employees
MODIFY (department_id DEFAULT 300);

ALTER TABLE bd_employees
MODIFY (job_class DEFAULT 'T');
  
ALTER TABLE bd_employees
ADD CONSTRAINT employees_job_class_ck
CHECK ( job_class IN ( 'T', 'J', 'C', 'M') );
	
ALTER TABLE bd_employees
ADD CONSTRAINT employees_job_level_ck
CHECK ( job_level BETWEEN 1 AND 9 );
	
ALTER TABLE bd_employees
ADD CONSTRAINT employees_salary_ck
CHECK ( salary < 125000.00 );
  
ALTER TABLE bd_employees
ADD CONSTRAINT employees_salary_gt_comm_ck
CHECK ( salary > commission );
  
ALTER TABLE bd_employees 
ADD CONSTRAINT employees_comm_bonus_ck
CHECK ( (commission > 0 AND bonus = 0)
   OR ( commission = 0 AND bonus > 0) );

ALTER TABLE bd_employees
ADD CONSTRAINT employees_comm_lt_salary_ck
CHECK ( commission < salary * .085 );


----------------------------------------------
-- Populate tables with VALID data
-- Populate stores table
INSERT INTO bd_stores (store_id, city) VALUES (11,'Sarnia');
INSERT INTO bd_stores (store_id, city) VALUES (22,'London');
INSERT INTO bd_stores (store_id, city) VALUES (33,'Toronto');  

--Populate departments table
INSERT ALL
INTO bd_departments (department_id, department_name) VALUES (300, 'New Hire')
INTO bd_departments (department_id, department_name) VALUES (301, 'IT')
INTO bd_departments (department_id, department_name) VALUES (302, 'Administration')
INTO bd_departments (department_id, department_name) VALUES (303, 'Men''s Clothing')
INTO bd_departments (department_id, department_name) VALUES (304, 'Women''s Clothing')
INTO bd_departments (department_id, department_name) VALUES (305, 'Kids')
INTO bd_departments (department_id, department_name) VALUES (306, 'Toys')
SELECT 1 FROM DUAL;

--Populate employees table

INSERT ALL
INTO bd_employees VALUES (201, 'Lauren', 'Alexander', '1980-02-10', 749583756, 'F', 1, '2012-09-22', NULL, 11, 304, 'M', 8, 94500, 12000,    0)
INTO bd_employees VALUES (202, 'Lisa',   'James',     '1988-06-16', 396812058, 'F', 0, '2013-12-15', NULL, 22, 303, 'M', 6, 52000,  7500,    0)
INTO bd_employees VALUES (203, 'Dave',   'Bernard',   '1990-04-28', 184759364, 'M', 1, '2014-05-10', 202,  22, 303, 'C', 3, 24000,     0,  500)
INTO bd_employees VALUES (204, 'Betty',  'Smith',     '1980-05-15', 744963756, 'F', 1, '2015-10-18', NULL, 22, 304, 'M', 8, 84500,  9200,    0)
INTO bd_employees VALUES (205, 'Amy',    'Albert',    '1988-09-26', 396396858, 'F', 0, '2016-02-22', NULL, 22, 305, 'J', 6, 42000,  7500,    0)
INTO bd_employees VALUES (206, 'Peter',  'Alan',      '1990-08-15', 181957464, 'M', 1, '2017-11-11', NULL, 22, 306, 'C', 5, 24000,     0,  500)
INTO bd_employees VALUES (207, 'Alice',  'Manis',     '1980-03-08', 840681248, 'F', 1, '2015-08-21', NULL, 33, 300, 'M', 8, 84500, 12000,    0)
INTO bd_employees VALUES (208, 'Brook',  'Payne',     '1988-10-01', 185038596, 'F', 0, '2016-10-14', NULL, 33, 304, 'M', 6, 62000,  7500,    0)
INTO bd_employees VALUES (209, 'Terry',  'Russell',   '1990-06-20', 205837501, 'M', 1, '2017-04-09', 207,  33, 300, 'T', 3, 24000,     0,  500)
INTO bd_employees VALUES (210, 'Carol',  'Brown',     '1980-02-25', 740149284, 'F', 1, '2015-08-08', 207,  33, 300, 'T', 3, 24500,     0, 2080)
INTO bd_employees VALUES (211, 'Casey',  'Emery',     '1988-03-16', 749127485, 'F', 0, '2016-04-12', 206,  22, 300, 'T', 3, 25000,     0,  800)
INTO bd_employees VALUES (212, 'Bill',   'Jewel',     '1990-05-05', 385012745, 'M', 1, '2017-10-12', 205,  11, 300, 'T', 3, 24500,     0,  500)
SELECT 1 FROM DUAL;


--Populate store_departments table
INSERT ALL
INTO bd_store_departments (store_id, department_id, dept_mgr_id) VALUES (11, 304, 201)
INTO bd_store_departments (store_id, department_id, dept_mgr_id) VALUES (11, 300, 212)
INTO bd_store_departments (store_id, department_id, dept_mgr_id) VALUES (22, 303, 202)
INTO bd_store_departments (store_id, department_id, dept_mgr_id) VALUES (22, 304, NULL)
INTO bd_store_departments (store_id, department_id, dept_mgr_id) VALUES (22, 305, 205)
INTO bd_store_departments (store_id, department_id, dept_mgr_id) VALUES (22, 306, 206)
INTO bd_store_departments (store_id, department_id, dept_mgr_id) VALUES (33, 300, 210)
INTO bd_store_departments (store_id, department_id, dept_mgr_id) VALUES (33, 304, 208)
SELECT 1 FROM DUAL;

UPDATE bd_stores
SET store_mgr_id = 201
WHERE store_id = 11;

UPDATE bd_stores
SET store_mgr_id = 204
WHERE store_id = 22;

UPDATE bd_stores
SET store_mgr_id = 207
WHERE store_id = 33;



 
 
 
 