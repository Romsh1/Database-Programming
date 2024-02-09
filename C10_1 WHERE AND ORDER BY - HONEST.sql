---Romika Chaudhary---
---C0921918---
---Honest Vehicles---
---Nov 3, 2023---

--1
SELECT DEALER_NAME, DEALER_CITY FROM H_DEALERSHIPS
ORDER BY DEALER_NAME;

--2
SELECT SERVICE_ID, SERVICE_DESCRIPTION, PRICE AS "OLD_PRICE", PRICE*1.065 AS "NEW_PRICE" 
FROM H_SERVICES
ORDER BY SERVICE_ID;

--3
SELECT MODEL_YEAR, VEHICLE_MAKE AS "Make", VEHICLE_MODEL AS "Model", ODOMETER FROM H_VEHICLES
WHERE DEALER_ID=101 AND MODEL_YEAR BETWEEN 1990 AND 2000
ORDER BY MODEL_YEAR; 

--4
SELECT DEALER_ID, SELLING_PRICE AS "Selling Price", VEHICLE_MAKE AS "Make", VEHICLE_MODEL AS "Model", ODOMETER FROM H_VEHICLES
WHERE DEALER_ID = 101 AND SELLING_PRICE > 55000 OR DEALER_ID = 120 AND SELLING_PRICE < 45000
ORDER BY DEALER_ID,
SELLING_PRICE DESC;

--5
SELECT COLOR, VEHICLE_MAKE AS "Make", VEHICLE_MODEL AS "Model", MODEL_YEAR AS "Year" FROM H_VEHICLES
WHERE COLOR IN ('Red','Blue','Yellow') AND MODEL_YEAR BETWEEN 2004 AND 2008
ORDER BY COLOR,
MODEL_YEAR;

--6
SELECT VEHICLE_MAKE AS "Make", VEHICLE_MODEL AS "Model", MODEL_YEAR AS "Year", SELLING_PRICE AS "Old Selling Price", SELLING_PRICE*1.055 AS "New Selling Price"
FROM H_VEHICLES
WHERE DEALER_ID IN (101, 120)
AND SELLING_PRICE > 55000
ORDER BY SELLING_PRICE DESC;

--7
SELECT SELLING_PRICE, VEHICLE_MAKE AS "Make", VEHICLE_MODEL AS "Model", MODEL_YEAR AS "Year"
FROM H_VEHICLES
WHERE SELLING_PRICE BETWEEN 54000 AND 55000
ORDER BY SELLING_PRICE;

--8
SELECT FIRST_NAME || ' ' || LAST_NAME AS "PREVOIUS_OWNER" 
FROM H_PREVIOUS_OWNERS
WHERE FIRST_NAME LIKE '%and%' OR LAST_NAME LIKE '%and%'
ORDER BY LAST_NAME;

--9
SELECT DEALER_ID, VEHICLE_MAKE, VEHICLE_MODEL, MODEL_YEAR
FROM H_VEHICLES
WHERE VEHICLE_MODEL IN ('Accord', 'Mustang', 'RAV4')
ORDER BY VEHICLE_MAKE,
VEHICLE_MODEL;

--10
SELECT VEHICLE_MAKE, MODEL_YEAR, SELLING_PRICE - COST_PRICE AS "PROFIT" 
FROM H_VEHICLES
WHERE SELLING_PRICE - COST_PRICE > 10500
ORDER BY PROFIT DESC;