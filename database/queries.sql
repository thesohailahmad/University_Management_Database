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