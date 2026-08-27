CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

-- 1. Core Students Table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    enrollment_date DATE DEFAULT CURRENT_DATE,
    department_id INT REFERENCES departments(department_id) ON DELETE SET NULL
);

-- 2. Student Profiles Table (Personal Details)
CREATE TABLE student_profiles (
    profile_id SERIAL PRIMARY KEY,
    student_id INT UNIQUE REFERENCES students(student_id) ON DELETE CASCADE,
    date_of_birth DATE NOT NULL,
    phone_number VARCHAR(20),
    address TEXT
);