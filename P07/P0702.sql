------------Royal Products---------

---------Romika Chaudhary--------
---------C0921918----------------
---------12 Oct, 2023------------
---------P0702------------------


--------Drop Tables--------------
DROP TABLE rp_inventoy;
DROP TABLE rp_warehouse;
DROP TABLE rp_customers;
DROP TABLE rp_reps;
DROP TABLE rp_order_lines;
DROP TABLE rp_orders;
DROP TABLE rp_products;


--------Creating tables-----------
CREATE TABLE rp_inventory (
    warehouse_id INTEGER,
    product_code VARCHAR(40),
    qoh INTEGER
);

CREATE TABLE rp_warehouse (
    warehouse_id INTEGER,
    whse_city VARCHAR(40)
);

CREATE TABLE rp_customers (
    customer_id INTEGER,
    customer_name VARCHAR(50),
    street VARCHAR(100),
    cust_city varchar(40),
    cust_state VARCHAR(40),
    zip VARCHAR(40),
    balance DECIMAL(9,2),
    credit_limit DECIMAL(9,2),
    rep_id INTEGER
);

CREATE TABLE rp_reps (
    rep_id INTEGER,
    last_name VARCHAR(40),
    first_name VARCHAR(40),
    street VARCHAR(40),
    rep_city VARCHAR(40),
    rep_state VARCHAR(40),
    zip VARCHAR(40),
    commission DECIMAL(9,2),
    rate DECIMAL(5,2)
);

CREATE TABLE rp_order_lines (
    order_id INTEGER,
    product_code VARCHAR(40),
    qty_ordered INTEGER,
    price_paid DECIMAL(9,2)
);

CREATE TABLE rp_orders (
    order_id INTEGER,
    order_date DATE,
    customer_id INTEGER
);

CREATE TABLE rp_products (
    product_code VARCHAR(40),
    description VARCHAR(40),
    category VARCHAR(40),
    suggested_price DECIMAL(7,2)
);

-------INSERTING DATA----------
-------INSERTING DATA into rp_customers----------
INSERT ALL
INTO rp_customers VALUES
 (148,'Al''s Appliance and Sport','2837 Greenway','Detroit','MI','48244',6550.00,7500.00,20)
INTO rp_customers VALUES
 (282,'Brookings Direct','3827 Devon','Toronto','ON','M5V7F5',431.50,10000.00,35)
INTO rp_customers VALUES
 (356,'Ferguson''s','382 Wildwood','Northfield','MI','33146',5785.00,7500.00,20)
INTO rp_customers VALUES
 (408,'The Everything Shop','1828 Raven','Crystal','IL','60082',5285.25,5000.00,65)
INTO rp_customers VALUES
 (462,'Bargains Galore','3829 Central','Toronto','ON','M5V9G4',3412.00,10000.00,35)
INTO rp_customers VALUES
 (524,'Kline''s','838 Ridgeland','Lakeside','IL','60091',12762.00,15000.00,65)
INTO rp_customers VALUES
 (608,'Johnson''s Department Store','372 Oxford','Toronto','ON','M5V9S4',2106.00,10000.00,35)
INTO rp_customers VALUES
 (687,'Lee''s Sport and Appliance','282 Evergreen','Troy','MI','48283',2851.00,5000.00,20)
INTO rp_customers VALUES
 (725,'Deerfield''s Four Seasons','282 Columbia','Toronto','ON','M5V9J5',248.00,7500.00,35)
INTO rp_customers VALUES
 (842,'All Season','28 Lakeview','Grove City','IL','60081',8221.00,7500.00,65)
SELECT 1 FROM DUAL;

-------INSERTING DATA into rp_products----------
INSERT ALL
INTO rp_products VALUES ('AT94','Iron','HW',24.95)
INTO rp_products VALUES ('BV06','Home Gym','SG',794.95)
INTO rp_products VALUES ('CD52','Microwave Oven','AP',165.00)
INTO rp_products VALUES ('DL71','Cordless Drill','HW',129.95)
INTO rp_products VALUES ('DR93','Gas Range','AP',495.00)
INTO rp_products VALUES ('DW11','Washer','AP',399.99)
INTO rp_products VALUES ('FD21','Stand Mixer','HW',159.95)
INTO rp_products VALUES ('KL62','Dryer','AP',349.95)
INTO rp_products VALUES ('KT03','Dishwasher','AP',595.00)
INTO rp_products VALUES ('KV29','Treadmill','SG',1390.00)
SELECT 1 FROM DUAL;

-------INSERTING DATA into rp_inventory----------
INSERT ALL
INTO rp_inventory VALUES (100, 'AT94', 43)
INTO rp_inventory VALUES (100, 'BV06', 24)
INTO rp_inventory VALUES (100, 'CD52', 21)
INTO rp_inventory VALUES (100, 'DL71', 11)
INTO rp_inventory VALUES (100, 'DR93', 31)
INTO rp_inventory VALUES (100, 'DW11', 12)
INTO rp_inventory VALUES (100, 'FD21', 12)
INTO rp_inventory VALUES (100, 'KL62', 34)
INTO rp_inventory VALUES (100, 'KT03', 23)
INTO rp_inventory VALUES (100, 'KV29', 25)
INTO rp_inventory VALUES (200, 'AT94', 43)
INTO rp_inventory VALUES (200, 'BV06', 34)
INTO rp_inventory VALUES (200, 'CD52', 11)
INTO rp_inventory VALUES (200, 'DL71', 41)
INTO rp_inventory VALUES (200, 'DR93', 21)
INTO rp_inventory VALUES (300, 'DW11', 42)
INTO rp_inventory VALUES (300, 'FD21', 52)
INTO rp_inventory VALUES (300, 'KL62', 14)
INTO rp_inventory VALUES (300, 'KT03', 53)
INTO rp_inventory VALUES (300, 'KV29', 35)
SELECT 1 FROM DUAL;

-------INSERTING DATA into rp_orders----------
INSERT ALL
INTO rp_orders VALUES (21608,'2021-01-20',148)
INTO rp_orders VALUES (21610,'2021-02-20',356)
INTO rp_orders VALUES (21613,'2021-02-21',408)
INTO rp_orders VALUES (21614,'2021-03-21',282)
INTO rp_orders VALUES (21617,'2021-03-22',608)
INTO rp_orders VALUES (21619,'2021-04-23',148)
INTO rp_orders VALUES (21623,'2021-04-23',608)
SELECT 1 FROM DUAL;

-------INSERTING DATA into rp_order_lines----------
INSERT ALL 
INTO rp_order_lines VALUES (21608,'AT94',11,21.95)
INTO rp_order_lines VALUES (21610,'DR93',1,495.00)
INTO rp_order_lines VALUES (21610,'DW11',1,399.99)
INTO rp_order_lines VALUES (21613,'KL62',4,329.95)
INTO rp_order_lines VALUES (21614,'KT03',2,595.00)
INTO rp_order_lines VALUES (21617,'BV06',2,794.95)
INTO rp_order_lines VALUES (21617,'CD52',4,150.00)
INTO rp_order_lines VALUES (21619,'DR93',1,495.00)
INTO rp_order_lines VALUES (21623,'KV29',2,1290.00)
SELECT 1 FROM DUAL;


--------Inserting data (not Batch) indicating column names----------
-------INSERTING DATA in rp_reps----------
INSERT INTO rp_reps (rep_id,last_name,first_name,street,rep_city,rep_state,zip,commission,rate) VALUES (20,'Culp','Betty','1275 Main St','Detroit','MI','48288',20542.50,0.05);
INSERT INTO rp_reps (rep_id,last_name,first_name,street,rep_city,rep_state,zip,commission,rate) VALUES (35,'Manis','Richard','532 Jackson','Toronto','ON','M5V2K1',39216.00,0.07);
INSERT INTO rp_reps (rep_id,last_name,first_name,street,rep_city,rep_state,zip,commission,rate) VALUES (65,'Large','Tom','1626 Taylor','Chicago','IL','60099',23487.00,0.05);

-------INSERTING DATA(not batch) in rp_warehouse without indicating column names----------
INSERT INTO rp_warehouse VALUES (100,'Chicago');
INSERT INTO rp_warehouse VALUES (200,'Detroit');
INSERT INTO rp_warehouse VALUES (300,'Toronto');

---------Updating the balance of customer with customer_id as 408--------------
UPDATE rp_customers 
SET balance = 4285.25
WHERE customer_id = 408;

---------Updating the balance of customer with customer_id as 842--------------
UPDATE rp_customers
SET balance = 6221.00
WHERE customer_id = 842;


---------Updating the price of product having category as AP--------------
UPDATE rp_products
SET suggested_price = suggested_price * 1.085
WHERE category = 'AP';

-------Removing product with description as Cordless Drill----------
DELETE FROM rp_products WHERE description = 'Cordless Drill';

---------Updating the credit limit of customer name Brookings Direct---------
UPDATE rp_customers
SET credit_limit = 14500
WHERE customer_name = 'Brookings Direct';

