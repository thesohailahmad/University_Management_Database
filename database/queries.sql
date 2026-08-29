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