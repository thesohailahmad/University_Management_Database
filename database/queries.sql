-- ============================================================================
-- UNIVERSITY MANAGEMENT SYSTEM: MASTER QUERY FILE
-- ============================================================================


-- ============================================================================
-- SECTION 1: C.R.U.D. OPERATIONS (Create, Read, Update, Delete)
-- ============================================================================

-- ---------------------------------------------------------
-- TABLE 1: DEPARTMENTS
-- ---------------------------------------------------------
-- CREATE
INSERT INTO departments (department_name) VALUES ('Artificial Intelligence');

-- READ
SELECT * FROM departments;

-- UPDATE
UPDATE departments SET department_name = 'Advanced AI' WHERE department_id = 6;

-- DELETE
DELETE FROM departments WHERE department_id = 6;


-- ---------------------------------------------------------
-- TABLE 2: STUDENTS
-- ---------------------------------------------------------
-- CREATE
INSERT INTO students (first_name, last_name, email, department_id) 
VALUES ('Zain', 'Abbas', 'zain.abbas@email.com', 1);

-- READ
SELECT first_name, last_name, enrollment_date FROM students WHERE enrollment_date > '2026-08-02';

-- UPDATE
UPDATE students SET email = 'zain.abbas.official@email.com' WHERE student_id = 6;

-- DELETE
DELETE FROM students WHERE student_id = 6;


-- ---------------------------------------------------------
-- TABLE 3: STUDENT PROFILES
-- ---------------------------------------------------------
-- CREATE
INSERT INTO student_profiles (student_id, phone_number) 
VALUES (1, '555-0199');

-- READ
SELECT * FROM student_profiles WHERE student_id = 1;

-- UPDATE
UPDATE student_profiles SET phone_number = '555-0999' WHERE profile_id = 1;

-- DELETE
DELETE FROM student_profiles WHERE profile_id = 1;


-- ---------------------------------------------------------
-- TABLE 4: INSTRUCTORS
-- ---------------------------------------------------------
-- CREATE
INSERT INTO instructors (instructor_name, education, biography, instructor_email, department_id)
VALUES ('Dr. Alice Smith', 'Ph.D. in Physics', 'Specializes in quantum computing.', 'alice.smith@university.edu', 1);

-- READ
SELECT instructor_name, department_id FROM instructors WHERE instructor_id = 1;

-- UPDATE
UPDATE instructors SET education = 'Post-Doc in Physics', department_id = 2 WHERE instructor_id = 1;

-- DELETE
DELETE FROM instructors WHERE instructor_id = 1;


-- ---------------------------------------------------------
-- TABLE 5: COURSES
-- ---------------------------------------------------------
-- CREATE
INSERT INTO courses (course_code, course_name, credit_hours, department_id)
VALUES ('CS402', 'Introduction to Python Programming', 3, 1);

-- READ
SELECT course_name, credit_hours FROM courses WHERE course_id = 1;

-- UPDATE
UPDATE courses SET credit_hours = 4 WHERE course_id = 1;

-- DELETE
DELETE FROM courses WHERE course_id = 1;


-- ---------------------------------------------------------
-- TABLE 6: COURSE SECTIONS
-- ---------------------------------------------------------
-- CREATE
INSERT INTO course_sections (course_id, instructor_id, semester, year, room) 
VALUES (1, 1, 'Fall', 2026, 'Room 301');

-- READ
SELECT * FROM course_sections WHERE semester = 'Fall' AND year = 2026;

-- UPDATE
UPDATE course_sections SET room = 'Lab B' WHERE section_id = 1;

-- DELETE
DELETE FROM course_sections WHERE section_id = 1;

-- ==========================================
--   TABLE 7 ENROLLMENTS TABLE
-- ==========================================

-- 1. CREATE (Insert new enrollments)
-- Insert with a specific status and past date
INSERT INTO enrollments (student_id, section_id, status, enrollment_date) 
VALUES (2, 4, 'completed', '2026-05-15');

-- Insert multiple enrollments in a single batch
INSERT INTO enrollments (student_id, section_id) 
VALUES 
    (3, 1),
    (4, 2),
    (5, 1);


-- 2. READ (Select enrollment data)
-- View all records in the enrollments table
SELECT * FROM enrollments;

-- 3. UPDATE (Modify existing enrollments)
-- Update a student's status to 'dropped' for a specific class
UPDATE enrollments 
SET status = 'dropped' 
WHERE student_id = 1 AND section_id = 3;

-- 4. DELETE (Remove enrollments)
-- Delete one specific enrollment record using its primary key
DELETE FROM enrollments 
WHERE enrollment_id = 5;

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



-- ============================================================================
-- SECTION 3: CONSTRAINT TESTING
-- ============================================================================

-- 1. Testing UNIQUE Constraint (Should fail if CS201 already exists)
INSERT INTO courses (course_code, course_name, credit_hours, department_id)
VALUES ('CS201', 'Duplicate Course Test', 3, 1);

-- 2. Testing NOT NULL Constraint (Should fail due to missing course_name)
INSERT INTO courses (course_code, course_name, credit_hours, department_id)
VALUES ('CS505', NULL, 3, 1);

-- 3. Testing FOREIGN KEY Constraint (Should fail if department 9999 doesn't exist)
INSERT INTO courses (course_code, course_name, credit_hours, department_id)
VALUES ('CS999', 'Invalid Department Test', 3, 9999);

-- 4. Testing ON DELETE SET NULL
-- Delete a department and verify assigned instructors' department_ids switch to NULL
DELETE FROM departments WHERE department_id = 1;
SELECT instructor_name, department_id FROM instructors;

-- ==========================================
-- ENROLLMENTS TABLE: CONSTRAINT TESTING
-- ==========================================

-- 1. Test NOT NULL Constraint on student_id
INSERT INTO enrollments (student_id, section_id) 
VALUES (NULL, 1);

-- 2. Test NOT NULL Constraint on section_id
INSERT INTO enrollments (student_id, section_id) 
VALUES (1, NULL);

-- 3. Test CHECK Constraint on status
INSERT INTO enrollments (student_id, section_id, status) 
VALUES (1, 1, 'pending');

 --4. Test UNIQUE Constraint on (student_id, section_id)
INSERT INTO enrollments (student_id, section_id) 
VALUES (1, 2); 
INSERT INTO enrollments (student_id, section_id) 
VALUES (1, 2);

-- 5. Test FOREIGN KEY Constraint on student_id
INSERT INTO enrollments (student_id, section_id) 
VALUES (99999, 1);

-- 6. Test FOREIGN KEY Constraint on section_id
INSERT INTO enrollments (student_id, section_id) 
VALUES (1, 99999);

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
    sp.first_name, 
    sp.last_name, 
    COUNT(e.section_id) AS courses_taken
FROM 
    StudentProfile sp
JOIN 
    enrollments e ON sp.student_id = e.student_id
GROUP BY 
    sp.student_id, sp.first_name, sp.last_name;


-- 5. Highest Enrollment Instructor

SELECT 
    i.first_name, 
    i.last_name, 
    COUNT(e.student_id) AS total_students_taught
FROM 
    instructors i
JOIN 
    course_sections cs ON i.instructor_id = cs.instructor_id
JOIN 
    enrollments e ON cs.section_id = e.section_id
GROUP BY 
    i.instructor_id, i.first_name, i.last_name
ORDER BY 
    total_students_taught DESC
LIMIT 1;

-- =====================================
-- GRADE QUERIES
-- =====================================

-- Basic queries

SELeCt * from grades;

select obtain_marks from grades where obtain_marks >= 80;

SELECt total_marks from grades;

SELECT grade from grades;

SELECT grade from grades where enrollment_id = 1;

SELECT grade from grades where grade = 'A';

SELECT enrollment_id, grade, percentage from grades where grade_id = 1;

-- JOIN queries
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
SELECT AVG(obtain_marks) from grades;

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

-- Constraint tests
INSERT INTO grades(enrollment_id, total_marks,obtain_marks)
VALUES(9999,0939508,03895038520,'A, A+')

--CRUD OPERATION

--Create 
INSERT INTO grades(enrollment_id,total_marks,obtain_marks,grade)
VALUES(13,150,140,'A++')

--READ
SELECT * From grades;

--UPDATE
UPDATE grades SET obtain_marks = 150 WHERE grade_id = 16;

--DELETE
DELETE FROM grades WHERE grade_id = 16;

-- =====================================
-- ATTENDANCE QUERIES
-- =====================================

-- Basic queries
SELECT * from attendance;

SELECT * from attendance where enrollment_id = 1;

SELECT * from attendance where status = 'Present';

SELECT * FROM attendance 
WHERE enrollment_id = 4 
ORDER BY attendance_date;

SELECT * FROM attendance 
WHERE status IN ('Absent', 'Late')
ORDER BY attendance_date;

SELECT * FROM attendance 
WHERE attendance_date = '2026-08-26';

--Join queries
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
JOIN courses c ON cs.course_id = c.course_id           


-- ANLYTICS Queries

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

--CRUD OPERATIONS

--CREATE
INSERT INTO attendance (enrollment_id, status, notes)
VALUES (1, 'Present', 'Arrived on time');

--READ
SELECT * FROM attendance 
WHERE enrollment_id = 1 AND attendance_date = CURRENT_DATE;

--UPDATE
UPDATE attendance
SET status = 'Excused', notes = 'Left early for doctor appointment'
WHERE enrollment_id = 1 AND attendance_date = CURRENT_DATE;

--DELETE
DELETE FROM attendance
WHERE enrollment_id = 1 AND attendance_date = CURRENT_DATE;

--CONSTRAINT TESTING
--1. Create (Valid Insert)
INSERT INTO attendance (enrollment_id, status, notes)
VALUES (2, 'Present', 'Arrived on time');

--2. Create (Invalid Insert - Duplicate Record)
INSERT INTO attendance (enrollment_id, status)
VALUES (2, 'Late');

--3. Create (Invalid Insert - Invalid Status)
INSERT INTO attendance (enrollment_id, status)
VALUES (2, 'Suspended');

--4. Read (Valid Query)
SELECT * FROM attendance 
WHERE enrollment_id = 2 AND attendance_date = CURRENT_DATE;

--5. Update (Valid Update)
UPDATE attendance
SET status = 'Excused', notes = 'Left early for doctor appointment'
WHERE enrollment_id = 2 AND attendance_date = CURRENT_DATE;

--6. Delete (Valid Delete)
DELETE FROM attendance
WHERE enrollment_id = 2 AND attendance_date = CURRENT_DATE;