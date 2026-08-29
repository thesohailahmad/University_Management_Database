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
-- Connects all major tables to show students, their courses, instructors, and status.

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
-- Calculates how many students are currently enrolled in each course.
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
-- Identifies the single course with the highest number of enrolled students.
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
-- Counts how many sections each individual student is enrolled in.
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
-- Finds the instructor teaching the largest total number of students across all their sections.
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