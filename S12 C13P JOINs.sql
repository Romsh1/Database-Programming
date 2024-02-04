-- Romika Chaudhary --
-- C0921918 --
-- S12 C13P JOINs --
-- Nov 21, 2023 --


--1
SELECT CATEGORY_ID || ' ' || CATEGORY_DESCRIPTION AS "CATEGORY", SERVICE_ID || ' ' || SERVICE_DESCRIPTION AS "SERVICE", TO_CHAR(PRICE, '$999.99') AS "PRICE"
FROM P_CATEGORIES
JOIN P_SERVICES USING (CATEGORY_ID);


--2
SELECT MODEL_YEAR, CAR_MAKE, FIRST_NAME || ' ' || LAST_NAME AS "PREVIOUS_OWNER"
FROM P_CARS
JOIN p_previous_owners 
    ON P_CARS.PREVIOUS_OWNER_ID = P_PREVIOUS_OWNERS.OWNER_ID
WHERE MODEL_YEAR = 2015
ORDER BY MODEL_YEAR;


--3
SELECT
  d.dealer_name AS DEALER_NAME,
  c.car_make AS CAR_MAKE,
  po.first_name || ' ' || po.last_name AS PREVIOUS_OWNER
FROM
  p_dealers d
JOIN
  p_cars c ON d.dealer_id = c.dealer_id
JOIN
  p_previous_owners po ON c.previous_owner_id = po.owner_id
WHERE
  d.dealer_name IN ('Bayside Autos', 'Eastside Better Used Cars')
ORDER BY
  d.dealer_name, c.car_make, po.last_name;


--4
SELECT MODEL_YEAR || ' ' || CAR_MAKE AS "CAR",
    TO_CHAR(DATE_ACQUIRED, 'Month dd, yyyy') AS "ACQUIRED",
    FIRST_NAME || ' ' || LAST_NAME AS "PREVIOUS_OWNER"
FROM P_CARS
JOIN P_PREVIOUS_OWNERS
    ON P_PREVIOUS_OWNERS.OWNER_ID = P_CARS.PREVIOUS_OWNER_ID
WHERE EXTRACT(YEAR FROM DATE_ACQUIRED) = 2023
ORDER BY CAR;


--5
SELECT 
model_year || ' ' || car_make AS car,
CASE
WHEN prev.owner_id IS NOT NULL THEN prev.owner_id || ' ' || prev.first_name || ' ' || prev.last_name
ELSE 'No previous owner on record'
END AS previous_owner
FROM p_cars c
LEFT OUTER JOIN p_previous_owners prev ON (c.previous_owner_id = prev.owner_id) 
WHERE EXTRACT(YEAR FROM date_acquired)= 2024
ORDER BY car;


--6
SELECT 
d.dealer_name,
EXTRACT(YEAR FROM c.date_acquired) AS YEAR,
TO_CHAR(SUM(c.acquired_price), '$999,999.99') AS inventory_value
FROM p_dealers d
JOIN p_cars c ON d.dealer_id = c.dealer_id
WHERE d.dealer_id IN (120, 206)
GROUP BY d.dealer_name, EXTRACT(YEAR FROM c.date_acquired)
ORDER BY dealer_name, year;

