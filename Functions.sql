-- Romika Chaudhary
-- P07B Chapter 7: Functions
-- C0921918
-- March 11, 2024

-- 2
CREATE OR REPLACE FUNCTION get_numeric_grade
(p_section_id IN gl_enrollments.section_id%TYPE, 
p_student_no IN gl_enrollments.student_no%TYPE)
RETURN NUMBER
IS
v_numeric_grade gl_enrollments.numeric_grade%TYPE := 0;
BEGIN
SELECT numeric_grade INTO v_numeric_grade
FROM gl_enrollments
WHERE section_id = p_section_id AND student_no = p_student_no;
RETURN v_numeric_grade;
END get_numeric_grade;

-- Invoking a function --
DECLARE 
    v_section_id gl_enrollments.section_id%TYPE := :ENTER_SECTION_ID;
    v_student_no gl_enrollments.student_no%TYPE := :ENTER_STUDENT_NO;
    v_numeric_grade gl_enrollments.numeric_grade%TYPE;
BEGIN
    v_numeric_grade := get_numeric_grade(v_section_id, v_student_no);
    DBMS_OUTPUT.PUT_LINE('Section id: ' || v_section_id);
    DBMS_OUTPUT.PUT_LINE('Student no: ' || v_student_no);
    DBMS_OUTPUT.PUT_LINE('Numeric grade: ' || v_numeric_grade);
END;




-- 3
CREATE OR REPLACE FUNCTION get_letter_grade
(p_section_id IN gl_enrollments.section_id%TYPE, 
p_student_no IN gl_enrollments.student_no%TYPE)
RETURN VARCHAR2
IS
v_letter_grade gl_enrollments.letter_grade%TYPE := 0;
BEGIN
SELECT letter_grade INTO v_letter_grade
FROM gl_enrollments
WHERE section_id = p_section_id AND student_no = p_student_no;
RETURN v_letter_grade;
END get_letter_grade;

-- Invoking a function --
DECLARE 
    v_section_id gl_enrollments.section_id%TYPE := :ENTER_SECTION_ID;
    v_student_no gl_enrollments.student_no%TYPE := :ENTER_STUDENT_NO;
    v_letter_grade gl_enrollments.letter_grade%TYPE;
BEGIN
    v_letter_grade := get_letter_grade(v_section_id, v_student_no);
    DBMS_OUTPUT.PUT_LINE('Section id: ' || v_section_id);
    DBMS_OUTPUT.PUT_LINE('Student no: ' || v_student_no);
    DBMS_OUTPUT.PUT_LINE('Letter Grade: ' || v_letter_grade);
END;




-- 4
CREATE OR REPLACE FUNCTION get_full_name
(p_student_no IN gl_students.student_no%TYPE)
RETURN VARCHAR2
IS
v_first_name gl_students.first_name%TYPE := 0;
v_last_name gl_students.last_name%TYPE := 0;
BEGIN
SELECT first_name, last_name INTO v_first_name, v_last_name
FROM gl_students
WHERE student_no = p_student_no;
RETURN (v_first_name || ' ' || v_last_name);
END get_full_name;

-- Invoking a function --
DECLARE
    v_student_no gl_students.student_no%TYPE := :ENTER_STUDENT_NO;
    v_first_name gl_students.first_name%TYPE;
    v_last_name gl_students.last_name%TYPE;
    v_full_name v_last_name%TYPE := v_first_name || ' ' || v_last_name;
BEGIN
    v_full_name := get_full_name(v_student_no);
    DBMS_OUTPUT.PUT_LINE('Student: ' || v_student_no);
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_full_name);
EXCEPTION
WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Student ' || v_student_no || ' not found');
WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An unknown error occurred');
END;




-- 5
CREATE OR REPLACE FUNCTION student_grades
(p_section_id IN gl_enrollments.section_id%TYPE, 
p_student_no IN gl_enrollments.student_no%TYPE,
p_numeric_grade OUT NUMBER,
p_letter_grade OUT VARCHAR2)
RETURN VARCHAR2
IS
    v_first_name gl_students.first_name%TYPE;
    v_last_name gl_students.last_name%TYPE;
BEGIN
    SELECT first_name, last_name, numeric_grade, letter_grade
    INTO v_first_name, v_last_name, p_numeric_grade, p_letter_grade
    FROM gl_students
    JOIN gl_enrollments USING(student_no)
    WHERE section_id = p_section_id AND student_no = p_student_no;

    RETURN (v_first_name || ' ' || v_last_name);
END student_grades;

-- Invoking a function --
DECLARE
    v_section_id gl_enrollments.section_id%TYPE := :ENTER_SECTION_ID;
    v_student_no gl_students.student_no%TYPE := :ENTER_STUDENT_NO;
    v_first_name gl_students.first_name%TYPE;
    v_last_name gl_students.last_name%TYPE;
    v_numeric_grade gl_enrollments.numeric_grade%TYPE;
    v_letter_grade gl_enrollments.letter_grade%TYPE;
BEGIN
    v_first_name := student_grades(v_section_id, v_student_no, v_numeric_grade, v_letter_grade);
    DBMS_OUTPUT.PUT_LINE('Student: ' || v_student_no || ' ' || v_first_name);
    DBMS_OUTPUT.PUT_LINE('Numeric grade: ' || v_numeric_grade);
    DBMS_OUTPUT.PUT_LINE('Letter grade: ' || v_letter_grade);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Student ' || v_student_no || ' not found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unknown error occurred');
END;