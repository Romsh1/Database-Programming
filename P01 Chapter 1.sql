-- Romika Chaudhary --
-- C0921918 --
-- P01 Chapter 1 --
-- Jan 15 , 2024 --


-- Q1
/* Romika Chaudhary
    C0921918
*/
DECLARE
-- This is the beginning of the executable section
BEGIN
    DBMS_OUTPUT.PUT_LINE(sysdate);
    DBMS_OUTPUT.PUT_LINE(current_date);
END;
--end of the block



-- Q2
DECLARE
    v_counter NUMBER(5);    --variable initialized to null
BEGIN
    v_counter := v_counter + 1;
    DBMS_OUTPUT.PUT_LINE('The new value of v_counter is: ' || v_counter);
END;
-- The value of v_counter will not return anything as we have not initialized any value to it.



-- Q3
DECLARE
    v_counter NUMBER(5) := 300; --variable initialized
BEGIN
    DBMS_OUTPUT.PUT_LINE('The value of v_counter is ' || v_counter || '.');
END;
-- The value of v_counter will return 301 (after adding 1) as we have initialized its value to 300 in the beginning. 



-- Q4
DECLARE
    v_counter NUMBER(5) NOT NULL := 0;  --NOT NULL - Must be initialized
BEGIN
    v_counter := v_counter + 1;
    DBMS_OUTPUT.PUT_LINE('The value of v_counter is ' || v_counter || '.');
END;



-- Q5
DECLARE
    v_counter NUMBER(5) NOT NULL := 500;
BEGIN
    v_counter := v_counter + 1;
    DBMS_OUTPUT.PUT_LINE('The value of v_counter is ' || v_counter || '.');
END;



-- Q6
DECLARE
    v_book_type VARCHAR2(20) := 'fiction';
BEGIN
    DBMS_OUTPUT.PUT_LINE('The book type is ' || v_book_type || '.');
END;



-- Q7
DECLARE
    v_text VARCHAR2(15);
BEGIN
    v_text := 'PL/SQL is easy';
    DBMS_OUTPUT.PUT_LINE(v_text || '.');
END;



-- Q8
DECLARE
    v_test_date DATE := '2025-01-31';
BEGIN
    DBMS_OUTPUT.PUT_LINE('The test date is ' || v_test_date || '.');
END;



-- Q9
DECLARE
    v_today DATE := SYSDATE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Today is ' || v_today || '.');
END;



-- Q10
DECLARE
    v_default_date DATE DEFAULT SYSDATE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('The default date is ' || v_default_date || '.');
END;



-- Q11
DECLARE
    TAX_RATE CONSTANT NUMBER(3,2) := 0.13;
BEGIN
    DBMS_OUTPUT.PUT_LINE('The tax rate is ' || TAX_RATE*100 || ' percent.');
END;



-- Q12
DECLARE
    CONSTANT1 CONSTANT VARCHAR2;
BEGIN
    DBMS_OUTPUT.PUT_LINE('The value is ' || CONSTANT1);
END;
--Error:
/*
PLS-00215: String length constraints must be in range (1 .. 32767)
PLS-00322: declaration of a constant 'CONSTANT1' must contain an initialization assignment
*/

-- Altered Code:

DECLARE
    CONSTANT1 CONSTANT VARCHAR2(15) := 'Nepal';
BEGIN
    DBMS_OUTPUT.PUT_LINE('The value is ' || CONSTANT1 || '.');
END;
/* The original code will cause an compilation error as in the code size of VARCHAR2 data type has not been indicated and value for the constant has not been initialized.
    After correction it displays the outpu 'The value is Nepal.', as the vallue to constant1 variable has been assigned as Nepal. */



-- Q13
DECLARE
    v_myname VARCHAR2(20) := 'Romika';
BEGIN
    v_myname := 'Chaudhary';
    DBMS_OUTPUT.PUT_LINE('My name is ' || v_myname || '.');
END;



-- Q14
DECLARE
    v_tax_rate CONSTANT NUMBER := .075;
    v_item_code VARCHAR2(15) := :ENTER_ITEM_CODE;
    v_item_name VARCHAR2(20) := :ENTER_ITEM_NAME;
    price NUMBER(7,2) := :ENTER_PRICE;
    v_tax NUMBER(5,2) := 0;
    v_total_price NUMBER(7,2) := 0;
BEGIN
    v_tax := price * v_tax_rate;
    v_total_price := price + v_tax;

    DBMS_OUTPUT.PUT_LINE('Item code: ' || v_item_code);
    DBMS_OUTPUT.PUT_LINE('Item name: ' || v_item_name);
    DBMS_OUTPUT.PUT_LINE('Tax (7.5%): ' || TO_CHAR(price, 'FM$99,999.99'));
    DBMS_OUTPUT.PUT_LINE('Tax (7.5%): ' || TO_CHAR(v_tax, 'FM$99,999.99'));
    DBMS_OUTPUT.PUT_LINE('Total price: ' || TO_CHAR(v_total_price, 'FM$99,999.99'));
END;



-- Q15
DECLARE
    product_code VARCHAR2(50) := :ENTER_PRODUCT_CODE;
    product_name VARCHAR2(50) := :ENTER_PRODUCT_NAME;
    unit_price NUMBER(7,2) := :ENTER_UNIT_PRICE;
    inventory NUMBER := :ENTER_INVENTORY;
    total_dollar NUMBER(7,2) := 0;
BEGIN
    total_dollar := unit_price * inventory;

    DBMS_OUTPUT.PUT_LINE('Product Code: ' || product_code);
    DBMS_OUTPUT.PUT_LINE('Product name: ' || product_name);
    DBMS_OUTPUT.PUT_LINE('Unit price: ' || TO_CHAR(unit_price, 'FM$99,999.99'));
    DBMS_OUTPUT.PUT_LINE('Inventory: ' || TO_CHAR(inventory, 'FM999'));
    DBMS_OUTPUT.PUT_LINE('Total dollar inventory: ' || TO_CHAR(total_dollar, 'FM$99,999.99'));
END;
