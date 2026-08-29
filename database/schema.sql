--1. Department Table(hold student,instructor,courses)
CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) UNIQUE NOT NULL
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
    student_id INT UNIQUE NOT NULL REFERENCES students(student_id) ON DELETE CASCADE,
    date_of_birth DATE NOT NULL,
    phone_number VARCHAR(20),
    address TEXT
);

--3. Instructor Table(instructor Information)
Create Table instructors(
    instructor_id SERIAL PRIMARY KEY,
    instructor_name Varchar(100) NOT NULL,
    education VARCHAR(100) NOT NULL,
    biography TEXT NOT NULL,
    instructor_email VARCHAR(100) UNIQUE NOT NULL,
    department_id INT REFERENCES departments(department_id) ON DELETE SET NULL
);

--3. Courses Table(Courses Information)
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_code VARCHAR(50) NOT NULL UNIQUE,
    course_name VARCHAR(100) NOT NULL,
    credit_hours INT NOT NULL,
    department_id INT REFERENCES departments(department_id) ON DELETE SET NULL
);

--4. course-section Table 

CREATE TABLE course_sections (
    section_id SERIAL PRIMARY KEY,
    course_id INT NOT NULL,
    instructor_id INT ,
    semester VARCHAR(20) NOT NULL,
    year INT NOT NULL,
    room VARCHAR(50) NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE,
    FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id) ON DELETE SET NULL
);    


--7. Enrolments Table
CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT NOT NULL,
    section_id INT NOT NULL,
    status VARCHAR(20) DEFAULT 'active' CHECK (status IN ('active', 'completed', 'dropped')),
    enrollment_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (section_id) REFERENCES course_sections(section_id) ON DELETE CASCADE,
    UNIQUE (student_id, section_id)
);