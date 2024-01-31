-- Bluewater Consulting

-----------Romika Chaudhary-------------
-----------C0921918---------------------
-----------12 Oct, 2023-----------------
-----------P0701------------------------

-- DROP TABLES -------------------------------

DROP TABLE bc_projects;
DROP TABLE bc_employees;
DROP TABLE bc_jobs;
DROP TABLE bc_billings;

-- CREATE TABLES -----------------------------

CREATE TABLE bc_projects (
    project_id INTEGER,
    project_name VARCHAR(40),
    project_leader_id INTEGER 
);


CREATE TABLE bc_employees (
    employee_id INTEGER,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    job_id INTEGER
);

CREATE TABLE bc_jobs (
    job_id INTEGER,
    job_title VARCHAR(50),
    charge_hour DECIMAL(7,2)
);

CREATE TABLE bc_billings (
    project_id INTEGER,
    employee_id INTEGER,
    hours_billed DECIMAL(3,1)
);


-- INSERT Data -------------------------------

INSERT ALL
INTO bc_billings VALUES (15, 103, 23.8)
INTO bc_billings VALUES (15, 101, 19.4)
INTO bc_billings VALUES (15, 105, 35.7)
INTO bc_billings VALUES (15, 106, 12.6)
INTO bc_billings VALUES (15, 102, 23.8)
INTO bc_billings VALUES (18, 114, 25.6)
INTO bc_billings VALUES (18, 118, 45.3)
INTO bc_billings VALUES (18, 104, 32.4)
INTO bc_billings VALUES (18, 112, 45.0)
INTO bc_billings VALUES (22, 105, 65.7)
INTO bc_billings VALUES (22, 104, 48.4)
INTO bc_billings VALUES (22, 113, 23.6)
INTO bc_billings VALUES (22, 111, 22.0)
INTO bc_billings VALUES (25, 106, 12.8)
INTO bc_billings VALUES (25, 107, 25.6)
INTO bc_billings VALUES (25, 115, 45.8)
INTO bc_billings VALUES (25, 101, 56.3)
INTO bc_billings VALUES (25, 114, 33.1)
INTO bc_billings VALUES (25, 108, 23.6)
INTO bc_billings VALUES (25, 118, 30.5)
INTO bc_billings VALUES (25, 112, 41.4)
SELECT 1 FROM DUAL;

INSERT ALL
INTO bc_employees VALUES (103, 'June',     'Arbough',    501)
INTO bc_employees VALUES (101, 'John',     'News',       502)
INTO bc_employees VALUES (105, 'Alice',    'Johnson',    502)
INTO bc_employees VALUES (106, 'William',  'Smith',      503)
INTO bc_employees VALUES (102, 'David',    'Senior',     504)
INTO bc_employees VALUES (114, 'Annelise', 'Jones',      503)
INTO bc_employees VALUES (118, 'James',    'Frommer',    505)
INTO bc_employees VALUES (104, 'Anne',     'Ramoras',    504)
INTO bc_employees VALUES (112, 'Darlene',  'Smithson',   506)
INTO bc_employees VALUES (113, 'Jen',      'Clarke',     503)
INTO bc_employees VALUES (111, 'Geoff',    'Wabash',     507)
INTO bc_employees VALUES (107, 'Maria',    'Alonzo',     503)
INTO bc_employees VALUES (115, 'Travis',   'Bawangi',    504)
INTO bc_employees VALUES (108, 'Ralph',    'Washington', 504)
SELECT 1 FROM DUAL;

------Inserting values with implicit column names--------

INSERT INTO bc_projects (project_id, project_name) VALUES (15, 'Lakeview');
INSERT INTO bc_projects (project_id, project_name) VALUES (18, 'Web App');
INSERT INTO bc_projects (project_id, project_name) VALUES (22, 'Blue Light');
INSERT INTO bc_projects (project_id, project_name) VALUES (25, 'Power Lite');

INSERT INTO bc_jobs (job_id, job_title, charge_hour) VALUES (501, 'Lead Programmer', 85.50);
INSERT INTO bc_jobs (job_id, job_title, charge_hour) VALUES (502, 'Database Designer', 105.00);
INSERT INTO bc_jobs (job_id, job_title, charge_hour) VALUES (503, 'Programmer', 37.75);
INSERT INTO bc_jobs (job_id, job_title, charge_hour) VALUES (504, 'System Analyst', 96.75);
INSERT INTO bc_jobs (job_id, job_title, charge_hour) VALUES (505, 'General Support', 18.36);
INSERT INTO bc_jobs (job_id, job_title, charge_hour) VALUES (507, 'Clerical Support', 26.87);
INSERT INTO bc_jobs (job_id, job_title, charge_hour) VALUES (506, 'DDS Analyst', 45.95);

------Adding project leader to Project table--------

UPDATE bc_projects
SET project_leader_id = 105
WHERE project_id = 15;


UPDATE bc_projects
SET project_leader_id = 104
WHERE project_id = 18;


UPDATE bc_projects
SET project_leader_id = 101
WHERE project_id = 25;

-------Removing employee named Darlene Smithson from the database----------

DELETE FROM bc_employees
WHERE first_name='Darlene' AND last_name='Smithson';

--------Updating hours_billed from 35.7 to 49.5 for given employee_id and project_id----------

UPDATE bc_billings
SET hours_billed = 49.5
WHERE employee_id = 105 AND project_id = 15;





