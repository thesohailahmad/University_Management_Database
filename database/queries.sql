-- UNIVERSITY MANAGEMENT SYSTEM - ESSENTIAL QUERIES

-- 1. READ (SELECT & FILTERING)


-- View all departments
SELECT * FROM departments;

-- View all students
SELECT * FROM students;

-- Filter: Find students who enrolled after a specific date
SELECT first_name, last_name, enrollment_date 
FROM students 
WHERE enrollment_date > '2026-08-02';


-- 2. READ WITH JOINS (CONNECTING TABLES)


-- 2-Table JOIN: See students alongside their department names
SELECT 
    students.student_id,
    students.first_name, 
    students.last_name, 
    departments.department_name
FROM students
JOIN departments 
    ON students.department_id = departments.department_id;

-- 3-Table JOIN: See academic info and personal phone numbers together
SELECT 
    students.first_name, 
    students.last_name, 
    departments.department_name,
    student_profiles.phone_number
FROM students
JOIN departments 
    ON students.department_id = departments.department_id
JOIN student_profiles 
    ON students.student_id = student_profiles.student_id;


-- 3. CREATE (INSERTING NEW DATA)


-- Add a new department
INSERT INTO departments (department_name) 
VALUES ('Artificial Intelligence');

-- Add a new student to the new department (assuming AI becomes department_id 6)
INSERT INTO students (first_name, last_name, email, department_id) 
VALUES ('Zain', 'Abbas', 'zain.abbas@email.com', 6);


-- 4. UPDATE (MODIFYING EXISTING DATA)


-- Fix a typo in a student's email address using their ID
UPDATE students
SET email = 'zain.abbas.official@email.com'
WHERE student_id = 6;

-- 5. DELETE (REMOVING DATA)
-- Remove a student from the system
DELETE FROM students
WHERE student_id = 6;


-- 6. To get all information

SELECT 
    students.student_id,
    students.first_name, 
    students.last_name, 
    students.email,
    students.enrollment_date,
    departments.department_id,
    departments.department_name,
    student_profiles.profile_id
FROM students
JOIN departments 
    ON students.department_id = departments.department_id
JOIN student_profiles 
    ON students.student_id = student_profiles.student_id;

-- SHORTCUT BUT IT SHOWS DEPARTMENT ID AND STUDENT ID TWO TIMES

SELECT *
FROM students
JOIN departments 
    ON students.department_id = departments.department_id
JOIN student_profiles 
    ON students.student_id = student_profiles.student_id;

-- =========================
-- INSTRUCTOR QUERIES
-- =========================

--1. Create (Insert Data)
--    Add a new instructor to the table.
INSERT INTO instructors (instructor_name, education, biography, instructor_email, department_id)
VALUES ('Dr. Alice Smith', 'Ph.D. in Physics', 'Specializes in quantum computing.', 'alice.smith@university.edu', 1);

--2. Read (Retrieve Data)
--    View the data stored in the table.

-- View all columns for every instructor
SELECT * FROM instructors;

-- View specific columns for a single instructor
SELECT instructor_name, department_id 
FROM instructors 
WHERE instructor_id = 1;

--3. Update (Modify Existing Data)
UPDATE instructors
SET education = 'Post-Doc in Physics', department_id = 2
WHERE instructor_id = 1;

--4. Delete (Remove Data)
DELETE FROM instructors
WHERE instructor_id = 1;


-- =========================
-- COURSE QUERIES
-- =========================

--1. Create (Insert Data)
--   Add a new courses to the table.

INSERT INTO courses (course_code, course_name, credit_hours, department_id)
VALUES ('CS402', 'Introduction to Python Programming', 3, 1);

--2. Read (Retrieve Data)
--   View the data stored in the table.

-- View all columns for every course
SELECT * FROM courses;

-- View specific details for a single course, like Discrete Mathematics
SELECT course_name, credit_hours 
FROM courses 
WHERE course_code = 'MTH202';

--3. Update (Modify Existing Data)
UPDATE courses
SET credit_hours = 4
WHERE course_code = 'CS304';

--4. Delete (Remove Data)
DELETE FROM courses
WHERE course_code = 'CS402';

-- =========================
-- JOIN QUERIES
-- =========================
-- INSTRUCTOR + DEPARTMENT JOINS
SELECT 
    instructors.instructor_name, 
    instructors.instructor_email,
    departments.department_name
FROM instructors
JOIN departments 
    ON instructors.department_id = departments.department_id;

-- INSTRUCTOR + DEPARTMENT JOINS
SELECT 
    courses.course_code,
    courses.course_name,
	departments.department_name
FROM courses
JOIN departments 
    ON courses.department_id = departments.department_id;

-- BOTH JOINS WITH DEPARTMENTS
SELECT 
    d.department_name,
    c.course_code,
    c.course_name,
    i.instructor_name,
    i.instructor_email
FROM departments d
LEFT JOIN courses c ON d.department_id = c.department_id
LEFT JOIN instructors i ON d.department_id = i.department_id;

-- =========================
-- CONSTRAINT TESTS
-- =========================

--1. Testing UNIQUE Constraints
INSERT INTO courses (course_code, course_name, credit_hours, department_id)
VALUES ('CS201', 'Duplicate Course Test', 3, 1);

--2.Testing NOT NULL Constraints
INSERT INTO courses (course_code, course_name, credit_hours, department_id)
VALUES ('CS505', NULL, 3, 1);

--3. Testing FOREIGN KEY Constraints
INSERT INTO courses (course_code, course_name, credit_hours, department_id)
VALUES ('CS999', 'Invalid Department Test', 3, 9999);

--4. Testing ON DELETE SET NULL (Cascading Action)
-- First, delete a department that currently has courses or instructors assigned to it
DELETE FROM departments WHERE department_id = 1;

-- Then, verify the constraint worked by checking the instructors table
-- The department_id for anyone originally in department 1 should now be NULL, rather than deleted.
SELECT instructor_name, department_id 
FROM instructors;