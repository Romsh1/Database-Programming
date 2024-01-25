-- Romika Chaudhary --
-- C0921918 --
-- Chapter 02 --

-- Q1
DECLARE
    student_no NUMBER(7);
    v_section_id INTEGER := :ENTER_SECTION_ID;
BEGIN
    SELECT COUNT(v_section_id)
    INTO student_no
    FROM gl_enrollments
    where section_id = v_section_id;
    DBMS_OUTPUT.PUT_LINE('There are ' || student_no || ' students in section ' || v_section_id);
END;



-- Q2
DECLARE
    numeric_grade NUMBER(7);
    v_section_id INTEGER := :ENTER_SECTION_ID;
BEGIN
    SELECT AVG(numeric_grade)
    INTO numeric_grade
    FROM gl_enrollments
    where section_id = v_section_id;
    DBMS_OUTPUT.PUT_LINE('The average grade in section ' || v_section_id || ' is ' || numeric_grade);
END;



-- Q3
DECLARE
    section_id INTEGER;
    v_course_code VARCHAR(6) := :ENTER_COURSE_CODE;
BEGIN
    SELECT COUNT(section_id)
    INTO section_id
    FROM gl_sections
    WHERE UPPER(course_code) = UPPER(v_course_code);
    DBMS_OUTPUT.PUT_LINE('There are ' || section_id || ' section(s) offered in course ' || UPPER(v_course_code));
END;



-- Q4
CREATE OR REPLACE VIEW g1_stdv1 AS
    SELECT
        s.student_no,
        s.first_name || ' ' || s.last_name AS student_name,
        p.program_name AS major,
        c.course_title AS course,
        sec.section_id,
        prof.first_name || ' ' || prof.last_name AS professor_name,
        e.letter_grade
    FROM
        gl_students s
        JOIN gl_programs p ON s.major_code = p.program_code
        JOIN gl_enrollments e ON s.student_no = e.student_no
        JOIN gl_sections sec ON e.section_id = sec.section_id
        JOIN gl_courses c ON sec.course_code = c.course_code
        JOIN gl_professors prof ON sec.professor_no = prof.professor_no;

DECLARE
    v_student_no NUMBER;
    v_section_id NUMBER;
    v_student_info g1_stdv1%ROWTYPE;
    H1 VARCHAR2(80) := 'Student Grade - ' || TO_CHAR(SYSDATE, 'FMDay, Month DD, YYYY');
    H2 VARCHAR2(80) := RPAD('-', LENGTH(H1), '-');

BEGIN
    v_student_no := :ENTER_STUDENT_NO;
    v_section_id := :ENTER_SECTION_NO;

    SELECT *
    INTO v_student_info
    FROM g1_stdv1
    WHERE student_no = v_student_no AND section_id = v_section_id;

    DBMS_OUTPUT.PUT_LINE(H1);
    DBMS_OUTPUT.PUT_LINE(H2);
    DBMS_OUTPUT.PUT_LINE('Student: ' || v_student_info.student_name);
    DBMS_OUTPUT.PUT_LINE('Major: ' || v_student_info.major);
    DBMS_OUTPUT.PUT_LINE('Course: ' || v_student_info.course);
    DBMS_OUTPUT.PUT_LINE('Section: ' || v_student_info.section_id);
    DBMS_OUTPUT.PUT_LINE('Professor: ' || v_student_info.professor_name);
    DBMS_OUTPUT.PUT_LINE('Grade: ' || v_student_info.letter_grade);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Student with number ' || v_student_no || ' and section ' || v_section_id || ' not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('SQL ERROR CODE: ' || SQLCODE);
        DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE: ' || SQLERRM);
END;



-- Q5
CREATE OR REPLACE VIEW GL_PROV1 AS
SELECT professor_no, first_name, last_name, office_no, office_ext, school_code, school_name
FROM gl_professors
JOIN gl_schools USING(school_code);

DECLARE
    v_prof_rec GL_PROV1%ROWTYPE;
    H1 VARCHAR(80) := 'Professor Information';
    H2 VARCHAR2(80) := LPAD('-', LENGTH(H1), '-');
BEGIN
SELECT *
    INTO v_prof_rec
    FROM GL_PROV1
WHERE professor_no = :ENTER_PROFESSOR_NO;
    DBMS_OUTPUT.PUT_LINE(H1);
    DBMS_OUTPUT.PUT_LINE(H2);
    DBMS_OUTPUT.NEW_LINE();
    DBMS_OUTPUT.PUT_LINE('Professor no: ' || v_prof_rec.professor_no);
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_prof_rec.first_name || ' ' || v_prof_rec.last_name);
    DBMS_OUTPUT.PUT_LINE('Office no: ' || v_prof_rec.office_no);
    DBMS_OUTPUT.PUT_LINE('Office ext: ' || v_prof_rec.office_ext);
    DBMS_OUTPUT.PUT_LINE('School name: ' || v_prof_rec.school_name);
EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(' SQL Error Code: ' || SQLCODE);
    DBMS_OUTPUT.PUT_LINE('SQL Error Message: ' || SQLERRM);
END;



-- Q6
DECLARE
    v_gl_professors gl_professors_copy%ROWTYPE;
    v_prof_no gl_professors_copy.professor_no%TYPE;
    v_prof_fname gl_professors_copy.first_name%TYPE;
    v_prof_lname gl_professors_copy.last_name%TYPE;
    v_prof_office_no gl_professors_copy.office_no%TYPE;
    v_prof_ext gl_professors_copy.office_ext%TYPE;
    v_prof_scode gl_professors_copy.school_code%TYPE;
    H1 VARCHAR2(80) := 'Professor Added';
    H2 VARCHAR2(80) := LPAD('-', LENGTH(H1), '-');
BEGIN
    v_prof_no := :Enter_the_professor_number;
    v_prof_fname := INITCAP(:Enter_the_professor_first_name);
    v_prof_lname := INITCAP(:Enter_the_professor_last_name);
    v_prof_office_no := :Enter_the_professor_office_no;
    v_prof_ext := :Enter_the_professor_extension;
    v_prof_scode := UPPER(:Enter_the_professor_scode);

    INSERT INTO gl_professors_copy VALUES(v_prof_no, v_prof_fname, v_prof_lname, v_prof_office_no, v_prof_ext, v_prof_scode);

    SELECT *
    INTO v_gl_professors
    FROM gl_professors_copy
    WHERE gl_professors_copy.professor_no = v_prof_no;

    DBMS_OUTPUT.PUT_LINE(H1);
    DBMS_OUTPUT.PUT_LINE(H2);

    DBMS_OUTPUT.PUT_LINE('Professor No: ' || v_gl_professors.professor_no);
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_gl_professors.first_name||' '||v_gl_professors.last_name);
    DBMS_OUTPUT.PUT_LINE('Office No: ' || v_gl_professors.office_No);
    DBMS_OUTPUT.PUT_LINE('Office Ext: ' || v_gl_professors.office_ext);
    DBMS_OUTPUT.PUT_LINE('School code: ' || v_gl_professors.school_code);
EXCEPTION 
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('SQL ERROR CODE: ' ||SQLCODE);
    DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE: ' ||SQLERRM);
END;



-- Q7
DECLARE
    v_gl_professors gl_professors_copy%ROWTYPE;
    v_pro_no gl_professors_copy.professor_no%TYPE := :Enter_new_Professor_No;
    v_pro_off gl_professors_copy.office_no%TYPE := :Enter_new_Office_No;
    v_pro_ext gl_professors_copy.office_ext%TYPE := :Enter_new_Office_Ext;
    v_pro_off_old gl_professors_copy.office_no%TYPE;
    v_pro_ext_old gl_professors_copy.office_ext%TYPE;
    
    H1 VARCHAR2(80) := 'Professor Updated';
    H2 VARCHAR2(80) := LPAD('-', LENGTH(H1), '-');
BEGIN
    SELECT gl_professors_copy.office_no, gl_professors_copy.office_ext
    INTO v_pro_off_old, v_pro_ext_old
    FROM gl_professors_copy
    WHERE v_pro_no = gl_professors_copy.professor_no;

    UPDATE gl_professors_copy
    SET office_no = v_pro_off, office_ext = v_pro_ext
    WHERE gl_professors_copy.professor_no = v_pro_no;

    SELECT *
    INTO v_gl_professors
    FROM gl_professors_copy
    WHERE gl_professors_copy.professor_no = v_pro_no;

    DBMS_OUTPUT.PUT_LINE(H1);
    DBMS_OUTPUT.PUT_LINE(H2);
    DBMS_OUTPUT.PUT_LINE('Professor No: ' || v_gl_professors.professor_no);
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_gl_professors.first_name||' '||v_gl_professors.last_name);
    DBMS_OUTPUT.PUT_LINE('Old Office No: ' || v_pro_off_old || ' New Office No: ' || v_gl_professors.office_no);
    DBMS_OUTPUT.PUT_LINE('Old Office Ext: ' || v_pro_ext_old || ' New Extension No: ' || v_gl_professors.office_ext);
    DBMS_OUTPUT.PUT_LINE('School code: ' || v_gl_professors.school_code);
EXCEPTION 
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('SQL ERROR CODE: ' ||SQLCODE);
    DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE: ' ||SQLERRM);
END;



-- Q8
DECLARE
    v_gl_professors gl_professors_copy%ROWTYPE;
    v_pro_no gl_professors_copy.professor_no%TYPE := :Enter_Professor_No;
    v_pro_off gl_professors_copy.office_no%TYPE;
    v_pro_ext gl_professors_copy.office_ext%TYPE;
    v_pro_fname gl_professors_copy.first_name%TYPE;
    v_pro_lname gl_professors_copy.last_name%TYPE;
    v_pro_scco gl_professors_copy.school_code%TYPE; 

    H1 VARCHAR2(80) := 'Professor Deleted';
    H2 VARCHAR2(80) := LPAD('-', LENGTH(H1), '-');

BEGIN
    SELECT *
    INTO v_pro_no, v_pro_fname, v_pro_lname, v_pro_off, v_pro_ext, v_pro_scco
    FROM gl_professors_copy
    WHERE professor_no = v_pro_no;

    DELETE FROM gl_professors_copy
    WHERE professor_no = v_pro_no;

    DBMS_OUTPUT.PUT_LINE(H1);
    DBMS_OUTPUT.PUT_LINE(H2);
    DBMS_OUTPUT.PUT_LINE('Professor No: ' || v_pro_no);
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_pro_fname||' '||v_pro_lname);
    DBMS_OUTPUT.PUT_LINE('Office No: ' || v_pro_off);
    DBMS_OUTPUT.PUT_LINE('Office Ext: ' || v_pro_ext);
    DBMS_OUTPUT.PUT_LINE('School code: ' || v_pro_scco);
EXCEPTION 
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('SQL ERROR CODE: ' ||SQLCODE);
    DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE: ' ||SQLERRM);
END;