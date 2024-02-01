---Romika Chaudhary---
---C0921918---
---S08 Numeric and Date Functions---
---Nov 14, 2023---

-- Answer 1
SELECT
    service_id as SERVIC_ID,
    price AS original_price,
    TO_CHAR(FLOOR(price), '$999.99') AS monday_price,
    TO_CHAR(CEIL(price), '$999.99') AS tuesday_price
FROM
    p_services 
ORDER BY
    SERVICE_ID;

--  Answer 2
SELECT
    CAR_MAKE,
    MODEL_YEAR,
    TO_CHAR(SELLING_PRICE, '$99,999.99') AS OLD_SELLING_PRICE,
    TO_CHAR(ROUND(SELLING_PRICE + SELLING_PRICE * 0.0575), '$99,999.99') AS NEW_SELLING_PRICE
FROM
    P_CARS
WHERE
    (SELLING_PRICE + SELLING_PRICE * 0.0575) > 78000.00
ORDER BY
    NEW_SELLING_PRICE DESC;

--  Answer 3
SELECT 
    car_make,
    TO_CHAR(date_acquired, 'MM/DD/YYYY') AS date_acquired,
    TO_CHAR(selling_price, '$99,999.99')
FROM 
    P_cars
WHERE 
    EXTRACT(YEAR FROM date_acquired) IN (2021, 2022, 2023)
    AND selling_price BETWEEN 70000 AND 71400
ORDER BY 
    date_acquired;

--  Answer 4
SELECT
    car_make,
    EXTRACT(YEAR FROM date_acquired) AS year_acquired,
    TO_CHAR(selling_price, '$99,999') AS old_selling_price,
    CASE
        WHEN MOD(EXTRACT(YEAR FROM date_acquired), 2) = 1 THEN ROUND(selling_price * 1.1, 2)
        WHEN MOD(EXTRACT(YEAR FROM date_acquired), 2) = 0 THEN ROUND(selling_price * 1.05, 2)
    END AS new_selling_price
FROM
    p_cars
ORDER BY
    new_selling_price DESC;

--  Answer 5
SELECT
    car_make,
    model_year,
    TO_CHAR(selling_price, '$99,999.99') AS "SELLING_PRICE",
    CASE
        WHEN selling_price > 73000 THEN 'Like new'
        WHEN selling_price BETWEEN 72000 AND 72999 THEN 'Great Value'
        WHEN selling_price BETWEEN 71000 AND 71999 THEN 'Low-cost Transportation'
        WHEN selling_price BETWEEN 70000 AND 79999 THEN 'Bargain Deals'
    END AS category
FROM
    p_cars
WHERE
    car_make IN ('Buick', 'Lincoln', 'Honda', 'Oldsmobile', 'Land Rover')
ORDER BY
    category,
    car_make,
    selling_price;

--  Answer 6
SELECT
    service_id,
    service_description,
    TO_CHAR(price, '$999.99') AS old_price,
    TO_CHAR(CEIL(price / 2) * 2, '$999.99') AS new_price
FROM
    p_services
WHERE
    price >= 50.00
ORDER BY
    service_id;

--  Answer 7
SELECT
    car_id,
    next_service_date AS "Next Service"
FROM
    p_cars
WHERE
    EXTRACT(YEAR FROM next_service_date) = :ENTER_YEAR
    AND EXTRACT(MONTH FROM next_service_date) = :ENTER_MONTH
ORDER BY
    car_id;

--  Answer 8
SELECT
    car_make,
    model_year,
    COALESCE(TO_CHAR(previous_owner_id), 'No previous owner on record') AS previous_owner
FROM
    p_cars
ORDER BY
    car_make,
    model_year;

--  Answer 9
SELECT
    car_id,
    car_make,
    car_model,
    FLOOR((TO_DATE('2026-01-01', 'YYYY-MM-DD') - date_acquired) / 7) AS weeks_on_lot
FROM
    p_cars
WHERE
    (TO_DATE('2026-01-01', 'YYYY-MM-DD') - date_acquired) / 7 > 250
ORDER BY
    weeks_on_lot DESC;

--  Answer 10
SELECT
    car_make,
    car_model,
    TO_CHAR(date_acquired, 'Day, Month DD, YYYY') AS acquired
FROM
    p_cars
WHERE
    EXTRACT(YEAR FROM date_acquired) = 2023
ORDER BY
    EXTRACT(MONTH FROM date_acquired),
    EXTRACT(DAY FROM date_acquired);
