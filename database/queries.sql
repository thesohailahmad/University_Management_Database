-- ============================================================================
-- UNIVERSITY MANAGEMENT SYSTEM: MASTER QUERY FILE
-- ============================================================================

-- ---------------------------------------------------------
-- TABLE 1: DEPARTMENTS
-- ---------------------------------------------------------

-- CRUD OPERATION

-- CREATE
INSERT INTO departments (department_name) VALUES ('Artificial Intelligence');

-- READ
SELECT * FROM departments;

-- UPDATE
UPDATE departments SET department_name = 'Advanced AI' WHERE department_id = 8;

-- DELETE
DELETE FROM departments WHERE department_id = 8;


--CONSTRAINT TEST

INSERT into departments(department_name) VALUES ('Computer Science');

INSERT into departments(deparment_name) VALUES (NULL);


-- ---------------------------------------------------------
-- TABLE 2: STUDENTS
-- ---------------------------------------------------------

--CRUD OPERATION

-- CREATE
INSERT INTO students (first_name, last_name, email, department_id) 
VALUES ('Sohail', 'Ahmad', 'Sohail.ahmad@student.edu.pk', 1);

-- READ
SELECT * FROM students;

-- UPDATE
UPDATE students SET email = 'khadija.farooq.official@student.edu.pk' WHERE student_id = 12;

-- DELETE
DELETE FROM students WHERE student_id = 12;

--CONSTRAINT TEST

-- 1. Test Duplicate Email
INSERT INTO students (first_name, last_name, email, department_id)
VALUES ('Test', 'User', 'ayaan.khan@student.edu.pk', 1);

-- 2. Test Missing Required Field 
INSERT INTO students (first_name, last_name, email, department_id)
VALUES (NULL, 'User', 'missing.name@student.edu.pk', 1);

-- 3. Test Invalid Department
INSERT INTO students (first_name, last_name, email, department_id)
VALUES ('Test', 'User', 'invalid.dept@student.edu.pk', 9999);



-- ---------------------------------------------------------
-- TABLE 3: STUDENT PROFILES
-- ---------------------------------------------------------
-- CREATE
INSERT INTO student_profiles (student_id, date_of_birth, phone_number) 
VALUES (12, '2003-08-16', '+92 38769376 5554');

-- READ
SELECT * FROM student_profiles;

-- UPDATE
UPDATE student_profiles SET phone_number = '+92 38769376 555' WHERE profile_id = 12;

-- DELETE
DELETE FROM student_profiles WHERE profile_id = 12;

--CONSTRAINT TEST

-- 1. Test 1-to-1 Violation 
INSERT INTO student_profiles (student_id, date_of_birth, phone_number, address)
VALUES (1, '2003-01-01', '+92 300 0000000', 'Duplicate profile test');

-- 2. Test Invalid Student FK 
INSERT INTO student_profiles (student_id, date_of_birth, phone_number, address)
VALUES (9999, '2003-01-01', '+92 300 0000000', 'Non-existent student');

-- 3. Test Missing Required DOB 
INSERT INTO student_profiles (student_id, date_of_birth, phone_number, address)
VALUES (2, NULL, '+92 300 0000000', 'Missing birth date');

-- ---------------------------------------------------------
-- TABLE 4: INSTRUCTORS
-- ---------------------------------------------------------
-- CREATE
INSERT INTO instructors (instructor_name, education, biography, instructor_email, department_id)
VALUES ('Dr. Alice Smith', 'Ph.D. in Physics', 'Specializes in quantum computing.', 'alice.smith@university.edu', 1);

-- READ
SELECT * FROM instructors;

-- UPDATE
UPDATE instructors SET education = 'Post-Doc in Physics', department_id = 6 WHERE instructor_id = 7;

-- DELETE
DELETE FROM instructors WHERE instructor_id = 1;

--CONSTRAINT TEST

--1. Test Duplicate Email
INSERT INTO instructors (instructor_name, education, biography, instructor_email, department_id)
VALUES ('Dr. Duplicate', 'PhD in CS', 'Bio test', 'tariq.mahmood@univ.edu.pk', 1);

-- 2. Test Missing Required Name 
INSERT INTO instructors (instructor_name, education, biography, instructor_email, department_id)
VALUES (NULL, 'PhD in CS', 'Bio test', 'missing.name@univ.edu.pk', 1);

-- 3. Test Invalid Department FK 
INSERT INTO instructors (instructor_name, education, biography, instructor_email, department_id)
VALUES ('Dr. Alien', 'PhD in CS', 'Bio test', 'alien.dept@univ.edu.pk', 9999);


-- ---------------------------------------------------------
-- TABLE 5: COURSES
-- ---------------------------------------------------------
-- CREATE
INSERT INTO courses (course_code, course_name, credit_hours, department_id)
VALUES ('CS402', 'Introduction to Python Programming', 3, 1);

-- READ
SELECT * FROM courses;

-- UPDATE
UPDATE courses SET credit_hours = 4 WHERE course_id = 1;

-- DELETE
DELETE FROM courses WHERE course_id = 1;

--CONSTRAINT TEST

-- 1. Test Duplicate Course Code 
INSERT INTO courses (course_code, course_name, credit_hours, department_id)
VALUES ('CS101', 'Duplicate Intro to Programming', 3, 1);

-- 2. Test Missing Required Course Name 
INSERT INTO courses (course_code, course_name, credit_hours, department_id)
VALUES ('CS999', NULL, 3, 1);

-- 3. Test Invalid Department FK 
INSERT INTO courses (course_code, course_name, credit_hours, department_id)
VALUES ('CS999', 'Advanced Topics', 3, 9999);

-- ---------------------------------------------------------
-- TABLE 6: COURSE SECTIONS
-- ---------------------------------------------------------

-- CREATE
INSERT INTO course_sections (course_id, instructor_id, semester, year, room) 
VALUES (1, 1, 'Fall', 2026, 'Room 301');

-- READ
SELECT * FROM course_sections ;

-- UPDATE
UPDATE course_sections SET room = 'Lab B' WHERE section_id = 1;

-- DELETE
DELETE FROM course_sections WHERE section_id = 1;


--CONSTRAINT TEST

-- 1. Test Missing Course ID
INSERT INTO course_sections (course_id, instructor_id, semester, year, room)
VALUES (NULL, 1, 'Fall', 2026, 'Room 101');

-- 2. Test Invalid Course FK (Should FAIL: foreign key error)
INSERT INTO course_sections (course_id, instructor_id, semester, year, room)
VALUES (9999, 1, 'Fall', 2026, 'Room 101');

-- 3. Test Invalid Instructor FK (Should FAIL: foreign key error)
INSERT INTO course_sections (course_id, instructor_id, semester, year, room)
VALUES (1, 9999, 'Fall', 2026, 'Room 101');

-- ==========================================
--   TABLE 7 ENROLLMENTS TABLE
-- ==========================================

-- 1. CREATE (Insert new enrollments)

INSERT INTO enrollments (student_id, section_id, status, enrollment_date) 
VALUES (2, 4, 'completed', '2026-05-15');
INSERT INTO enrollments (student_id, section_id) 
VALUES 
    (3, 1),
    (4, 2),
    (5, 1);


-- 2. READ 
SELECT * FROM enrollments;

-- 3. UPDATE (Modify existing enrollments)
UPDATE enrollments 
SET status = 'dropped' 
WHERE student_id = 1 AND section_id = 3;

-- 4. DELETE (Remove enrollments)
DELETE FROM enrollments 
WHERE enrollment_id = 5;

--CONSTRAINT TEST

-- 1. Test Duplicate Enrollment (Should FAIL: unique constraint student_id + section_id)
INSERT INTO enrollments (student_id, section_id, status)
VALUES (1, 1, 'active');

-- 2. Test Invalid Status Check Constraint (Should FAIL: check constraint violation)
INSERT INTO enrollments (student_id, section_id, status)
VALUES (8, 2, 'pending');

-- 3. Test Invalid Student FK (Should FAIL: foreign key error)
INSERT INTO enrollments (student_id, section_id, status)
VALUES (9999, 1, 'active');

-- 4. Test Invalid Section FK (Should FAIL: foreign key error)
INSERT INTO enrollments (student_id, section_id, status)
VALUES (1, 9999, 'active');

-- ==========================================
--   TABLE 8 GRADES TABLE
-- ==========================================

--Create 
INSERT INTO grades(enrollment_id,total_marks,obtain_marks,grade)
VALUES(13,150,140,'A++');

--READ
SELECT * From grades;

--UPDATE
UPDATE grades SET obtain_marks = 150 WHERE grade_id = 16;

--DELETE
DELETE FROM grades WHERE grade_id = 16;

--CONSTRAINT TEST

-- 1. Test Marks Greater Than Total Marks 
INSERT INTO grades (enrollment_id, total_marks, obtain_marks, grade)
VALUES (1, 100, 105, 'A+');

-- 2. Test Negative Obtained Marks 
INSERT INTO grades (enrollment_id, total_marks, obtain_marks, grade)
VALUES (1, 100, -10, 'F');

-- 3. Test Invalid Enrollment FK
INSERT INTO grades (enrollment_id, total_marks, obtain_marks, grade)
VALUES (9999, 100, 85, 'A');

-- 4. Test Missing Required Marks 
INSERT INTO grades (enrollment_id, total_marks, obtain_marks, grade)
VALUES (1, 100, NULL, 'F');

-- ==========================================
--   TABLE 9 ATTENDANCE TABLE
-- ==========================================

--CRUD OPERATIONS

--CREATE
INSERT INTO attendance (enrollment_id, status, notes)
VALUES (1, 'Present', 'Arrived on time');

--READ
SELECT * FROM attendance 
WHERE enrollment_id = 16 AND attendance_date = CURRENT_DATE;

--UPDATE
UPDATE attendance
SET status = 'Excused', notes = 'Left early for doctor appointment'
WHERE enrollment_id = 16 AND attendance_id = 1;

--DELETE
DELETE FROM attendance
WHERE enrollment_id = 16 AND attendance_id = 1;

--CONSTRAINT TESTING

--1.  (Valid Insert)
INSERT INTO attendance (enrollment_id, status, notes)
VALUES (16, 'Present', 'Arrived on time');

--2.  (Invalid Insert - Duplicate Record)
INSERT INTO attendance (enrollment_id, status)
VALUES (16, 'Late');

--3.  (Invalid Insert - Invalid Status)
INSERT INTO attendance (enrollment_id, status)
VALUES (16, 'Suspended');

--4.  (Valid Query)
SELECT * FROM attendance 
WHERE enrollment_id = 16 AND attendance_date = CURRENT_DATE;

--5. Update (Valid Update)
UPDATE attendance
SET status = 'Excused', notes = 'Left early for doctor appointment'
WHERE enrollment_id = 16 AND attendance_date = CURRENT_DATE;

--6. Delete (Valid Delete)
DELETE FROM attendance
WHERE enrollment_id = 16 AND attendance_date = CURRENT_DATE;


-- ============================================================================
-- SECTION 2: JOIN OPERATIONS (Relational Reporting)
-- ============================================================================

-- 1. Student Directory (3-Table JOIN)
SELECT 
    s.first_name, 
    s.last_name, 
    d.department_name,
    sp.phone_number
FROM students s
JOIN departments d ON s.department_id = d.department_id
JOIN student_profiles sp ON s.student_id = sp.student_id;


-- 2. Course Catalog Details (2-Table JOIN)
SELECT 
    c.course_code,
    c.course_name,
    d.department_name
FROM courses c
JOIN departments d ON c.department_id = d.department_id;


-- 3. Master Course Schedule (3-Table JOIN)
SELECT 
    cs.semester, 
    cs.year, 
    c.course_name, 
    i.instructor_name, 
    cs.room
FROM course_sections cs
JOIN courses c ON cs.course_id = c.course_id
JOIN instructors i ON cs.instructor_id = i.instructor_id;


-- ==========================================
-- JOIN OPERATIONS & ANALYTICS
-- ==========================================

-- 1. Comprehensive University System View


SELECT
    s.student_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    c.course_code,
    c.course_name,
    i.instructor_name,
    cs.semester,
    cs.year,
    e.status AS enrollment_status
FROM students s
JOIN enrollments e
    ON s.student_id = e.student_id
JOIN course_sections cs
    ON e.section_id = cs.section_id
JOIN courses c
    ON cs.course_id = c.course_id
JOIN instructors i
    ON cs.instructor_id = i.instructor_id;

-- 2. Course Enrollment Counts

SELECT 
    c.course_name, 
    COUNT(e.student_id) AS total_students
FROM 
    courses c
JOIN 
    course_sections cs ON c.course_id = cs.course_id
JOIN 
    enrollments e ON cs.section_id = e.section_id
GROUP BY 
    c.course_name;


-- 3. Most Popular Course

SELECT 
    c.course_name, 
    COUNT(e.student_id) AS total_students
FROM 
    courses c
JOIN 
    course_sections cs ON c.course_id = cs.course_id
JOIN 
    enrollments e ON cs.section_id = e.section_id
GROUP BY 
    c.course_name
ORDER BY 
    total_students DESC
LIMIT 1;


-- 4. Student Course Load

SELECT 
    s.first_name, 
    s.last_name, 
    COUNT(e.section_id) AS courses_taken
FROM 
    students s
JOIN 
    enrollments e ON s.student_id = e.student_id
GROUP BY 
    s.student_id, s.first_name, s.last_name;

-- 5. Highest Enrollment Instructor

SELECT 
    i.instructor_name, 
    COUNT(e.student_id) AS total_students_taught
FROM 
    instructors i
JOIN 
    course_sections cs ON i.instructor_id = cs.instructor_id
JOIN 
    enrollments e ON cs.section_id = e.section_id
GROUP BY 
    i.instructor_id, i.instructor_name
ORDER BY 
    total_students_taught DESC
LIMIT 1;

-- ==========================
-- STUDENT ACADEMIC ANALYTICS
--===========================

-- Student Academic Report
   -- OUTPUT DATA
--Student | Course | Instructor | Grade | Total Marks | Obtain Marks | Percentage

SELECT
 CONCAT(s.first_name, ' ', s.last_name) AS "Student Name",
 c.course_name AS "Course",
 i.instructor_name as "Instructor Name",
 g.grade AS "Grade",
 g.total_marks as "Total Marks",
 g.obtain_marks AS "Obtain Marks",
 g.percentage AS "Percentage"
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN course_sections cs ON e.section_id = cs.section_id
JOIN courses c ON cs.course_id = c.course_id
JOIN instructors i ON cs.instructor_id = i.instructor_id
JOIN grades g ON e.enrollment_id = g.enrollment_id;

-- Student transcript
   -- OUTPUT DATA OF ONE STUDENT
--Course Code | Course Name | Semester | Marks | Grade

SELECT 
    c.course_code AS "Course Code",
    c.course_name AS "Course Name",
    cs.semester AS "Semester",
    g.obtain_marks AS "Marks",
    g.grade AS "Grade"
FROM enrollments e
JOIN course_sections cs ON e.section_id = cs.section_id
JOIN courses c ON cs.course_id = c.course_id
JOIN grades g ON e.enrollment_id = g.enrollment_id
WHERE e.student_id = 1;

-- Analytics

--Average marks
SELECT ROUND(AVG(obtain_marks),2) from grades;

--Average per course
SELECT 
    c.course_name AS "Course",
    ROUND(AVG(g.obtain_marks), 1) AS "Average"
FROM courses c
JOIN course_sections cs ON c.course_id = cs.course_id
JOIN enrollments e ON cs.section_id = e.section_id
JOIN grades g ON e.enrollment_id = g.enrollment_id
GROUP BY c.course_name;

--Highest performer
SELECT 
    CONCAT(s.first_name, ' ', s.last_name) AS "Student Name",
    g.obtain_marks AS "Highest Marks"
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN grades g ON e.enrollment_id = g.enrollment_id
ORDER BY g.obtain_marks DESC
LIMIT 1;

--Course performance
SELECT 
    c.course_name AS "Course Name",
    ROUND(AVG(g.obtain_marks), 1) AS "Average Marks"
FROM courses c
JOIN course_sections cs ON c.course_id = cs.course_id
JOIN enrollments e ON cs.section_id = e.section_id
JOIN grades g ON e.enrollment_id = g.enrollment_id
GROUP BY c.course_name
ORDER BY AVG(g.obtain_marks) DESC
LIMIT 1;

--STUDENT ATTENDANCE
 -- OUTPUT DATA
--Student | Course | Attendance Date | Status | Notes
SELECT 
    CONCAT(s.first_name, ' ', s.last_name) AS "Student Name",
    c.course_name AS "Course",
	a.attendance_date AS "Attendance Date",
    a.status AS "Status",
    a.notes AS "Notes"
FROM attendance a
JOIN enrollments e ON a.enrollment_id = e.enrollment_id
JOIN students s ON e.student_id = s.student_id
JOIN course_sections cs ON e.section_id = cs.section_id 
JOIN courses c ON cs.course_id = c.course_id;          


-- STUDENT ATTENDANCE ANALYTICS Queries

--OUTPUT DATA
--Student | Present | Absent | Late | Excused | Total Classes | Attendance %
SELECT 
    CONCAT(s.first_name, ' ', s.last_name) AS "Student Name",
    COUNT(CASE WHEN a.status = 'Present' THEN 1 END) AS "Present",
    COUNT(CASE WHEN a.status = 'Absent' THEN 1 END) AS "Absent",
	COUNT(CASE WHEN a.status = 'Late' THEN 1 END) AS "Late",
	COUNT(CASE WHEN a.status = 'Excused' THEN 1 END) AS "Excused",
    COUNT(a.attendance_id) AS "Total Classes",
    ROUND(
        COUNT(CASE WHEN a.status = 'Present' THEN 1 END) * 100.0 / COUNT(a.attendance_id), 
        2
    ) AS "Attendance %"
FROM attendance a
JOIN enrollments e ON a.enrollment_id = e.enrollment_id
JOIN students s ON e.student_id = s.student_id
GROUP BY s.student_id, s.first_name, s.last_name
ORDER BY "Student Name";

-- ==============================
-- ADVANCED QUERIES
-- ==============================


-- STUDENT OVERALL INFORMATION

-- OUTPUT DATA
--Student Name | Course Code | Course Name | Obtain Marks | Grade | Semester | Year | Credit Hours
SELECT 
   CONCAT(s.first_name, ' ', s.last_name) AS "Student Name",
    c.course_code AS "Course Code",
    c.course_name AS "Course Name",
	g.obtain_marks AS "Obtain Marks",
	g.grade AS "Grade",
    cs.semester AS "Semester",
    cs.year AS "Year",
    c.credit_hours AS "Credit Hours"
FROM 
    students s
JOIN 
    enrollments e ON s.student_id = e.student_id
JOIN 
    course_sections cs ON e.section_id = cs.section_id
JOIN 
    courses c ON cs.course_id = c.course_id
LEFT JOIN 
    grades g ON e.enrollment_id = g.enrollment_id
ORDER BY 
    s.last_name, 
    s.first_name, 
    cs.year DESC, 
    cs.semester DESC;

-- GPA CALCULATION

--Output Data
--Student ID | Student Name | GPA
SELECT 
    s.student_id AS "Student ID",
    CONCAT(s.first_name, ' ', s.last_name) AS "Student Name",
    ROUND(
        AVG(
            CASE g.grade
                WHEN 'A+' THEN 4.0
                WHEN 'A'  THEN 4.0
                WHEN 'A-' THEN 3.7
                WHEN 'B+' THEN 3.3
                WHEN 'B'  THEN 3.0
                WHEN 'B-' THEN 2.7
                WHEN 'C+' THEN 2.3
                WHEN 'C'  THEN 2.0
                WHEN 'C-' THEN 1.7
                WHEN 'D'  THEN 1.0
                WHEN 'F'  THEN 0.0
            END
        ), 2
    ) AS "GPA"
FROM 
    students s
JOIN 
    enrollments e ON s.student_id = e.student_id
JOIN 
    grades g ON e.enrollment_id = g.enrollment_id
WHERE 
    g.grade IS NOT NULL
GROUP BY 
    s.student_id, 
    s.first_name, 
    s.last_name
ORDER BY 
    "GPA" DESC;


-- COURSE STATISTICS

--Output Data
--Course Code | Course Name | Total Students | Average Marks | Highest Marks | Lowest Marks
SELECT 
    c.course_code AS "Course Code",
	c.course_name AS "Course",
    COUNT(e.student_id) AS "Number of Students",
    ROUND(AVG(g.obtain_marks), 2) AS "Average Marks",
    MAX(g.obtain_marks) AS "Highest Marks",
    MIN(g.obtain_marks) AS "Lowest Marks"
FROM 
    courses c
JOIN 
    course_sections cs ON c.course_id = cs.course_id
JOIN 
    enrollments e ON cs.section_id = e.section_id
LEFT JOIN 
    grades g ON e.enrollment_id = g.enrollment_id
GROUP BY 
    c.course_id, 
    c.course_code,
    c.course_name
ORDER BY 
    c.course_name;

-- Instructor Work

--Output Data
--Instructor Name | Total Courses | Total Students 
SELECT 
    i.instructor_name AS "Instructor Name",
    COUNT(e.student_id) AS "Students"
FROM 
    instructors i
JOIN 
    course_sections cs ON i.instructor_id = cs.instructor_id
JOIN 
    enrollments e ON cs.section_id = e.section_id
GROUP BY 
    i.instructor_id, 
	i.instructor_name
ORDER BY 
    "Students" DESC;


-- DEPARTMENTS STATISTICS

--Output Data
--Department Name | Total Courses | Total Students | Total Instructors
SELECT 
    d.department_name AS "Department Name",
    COUNT(DISTINCT c.course_id) AS "Total Courses",
    COUNT(DISTINCT s.student_id) AS "Total Students",
    COUNT(DISTINCT i.instructor_id) AS "Total Instructors"
FROM 
    departments d
LEFT JOIN 
    students s ON d.department_id = s.department_id
LEFT JOIN 
    courses c ON d.department_id = c.department_id
LEFT JOIN 
    instructors i ON d.department_id = i.department_id
GROUP BY 
    d.department_id, 
    d.department_name
ORDER BY 
    d.department_name;


-- =======================
-- STUDENT ACADEMIC VIEW
--========================

CREATE OR REPLACE VIEW student_academic_report AS
SELECT 
   CONCAT(s.first_name, ' ', s.last_name) AS "Student Name",
    c.course_code AS "Course Code",
    c.course_name AS "Course Name",
	g.obtain_marks AS "Obtain Marks",
	g.grade AS "Grade",
    cs.semester AS "Semester",
    cs.year AS "Year",
    c.credit_hours AS "Credit Hours"
FROM 
    students s
JOIN 
    enrollments e ON s.student_id = e.student_id
JOIN 
    course_sections cs ON e.section_id = cs.section_id
JOIN 
    courses c ON cs.course_id = c.course_id
LEFT JOIN 
    grades g ON e.enrollment_id = g.enrollment_id
ORDER BY 
    s.last_name, 
    s.first_name, 
    cs.year DESC, 
    cs.semester DESC;

-- READ 
SELECT * FROM student_academic_report;


-- =======================
-- STUDENT ATTENDANCE VIEW
--========================

CREATE OR REPLACE VIEW student_attendance_report AS
SELECT 
    CONCAT(s.first_name, ' ', s.last_name) AS "Student Name",
    c.course_name AS "Course Name",
    COUNT(a.status) AS "Total Classes",
    COUNT(CASE WHEN a.status = 'Present' THEN 1 END) AS "Present",
    COUNT(CASE WHEN a.status = 'Absent' THEN 1 END) AS "Absent",
    ROUND(
        (COUNT(CASE WHEN a.status = 'Present' THEN 1 END) * 100.0) / 
        NULLIF(COUNT(a.status), 0), 2
    ) AS "Attendance %"
FROM 
    students s
JOIN 
    enrollments e ON s.student_id = e.student_id
JOIN 
    course_sections cs ON e.section_id = cs.section_id
JOIN 
    courses c ON cs.course_id = c.course_id

LEFT JOIN 
    attendance a ON e.enrollment_id = a.enrollment_id
GROUP BY 
    s.student_id, 
    s.first_name, 
    s.last_name,
    c.course_id,
    c.course_name;
--READ
SELECT * FROM student_attendance_report;

-- ====================================
-- INDEXES FOR PERFORMANCE OPTIMIZATION
--=====================================

-- Speeds up queries looking for all enrollments of a specific student
CREATE INDEX idx_enrollments_student_id ON enrollments(student_id);

-- Speeds up queries fetching all students in a specific class section
CREATE INDEX idx_enrollments_section_id ON enrollments(section_id);

-- Speeds up attendance lookups for specific enrollments
CREATE INDEX idx_attendance_enrollment_id ON attendance(enrollment_id);


EXPLAIN
SELECT * FROM enrollments WHERE student_id = 5;

EXPLAIN ANALYZE
SELECT * FROM enrollments WHERE student_id = 5;

-- =======================
-- TRANSACTION MANAGEMENT
--========================

--1. COMMIT
BEGIN;

UPDATE students
SET first_name = 'Ahmad'
WHERE student_id = 13;

COMMIT;

--2. ROLLBACK
BEGIN;

UPDATE students
SET first_name = 'Temporary'
WHERE student_id = 13;

ROLLBACK;

--A transaction becomes especially useful when you have multiple changes that should either all succeed or all be undone.

-- =======================
-- POSTGRESQL FUNCTION
--========================

CREATE OR REPLACE FUNCTION get_student_course_count(p_student_id INT)
RETURNS INT
LANGUAGE SQL
AS $$
    SELECT COUNT(*)::INT
    FROM enrollments
    WHERE student_id = p_student_id;
$$;

SELECT get_student_course_count(1) AS "Course Count for Student 1";