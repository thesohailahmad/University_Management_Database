--1. Department Table(hold student,instructor,courses)
CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) UNIQUE NOT NULL
);

-- 2. Core Students Table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    enrollment_date DATE DEFAULT CURRENT_DATE,
    department_id INT REFERENCES departments(department_id) ON DELETE SET NULL
);

-- 3. Student Profiles Table (Personal Details)
CREATE TABLE student_profiles (
    profile_id SERIAL PRIMARY KEY,
    student_id INT UNIQUE NOT NULL REFERENCES students(student_id) ON DELETE CASCADE,
    date_of_birth DATE NOT NULL,
    phone_number VARCHAR(20),
    address TEXT
);

-- 4. Instructor Table(instructor Information)
Create Table instructors(
    instructor_id SERIAL PRIMARY KEY,
    instructor_name Varchar(100) NOT NULL,
    education VARCHAR(100) NOT NULL,
    biography TEXT NOT NULL,
    instructor_email VARCHAR(100) UNIQUE NOT NULL,
    department_id INT REFERENCES departments(department_id) ON DELETE SET NULL
);

--5. Courses Table(Courses Information)
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_code VARCHAR(50) NOT NULL UNIQUE,
    course_name VARCHAR(100) NOT NULL,
    credit_hours INT NOT NULL,
    department_id INT REFERENCES departments(department_id) ON DELETE SET NULL
);

--6. course-section Table 

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


--8. Gardes Table
CREATE TABLE grades(
    grade_id SERIAL PRIMARY KEY,
    enrollment_id INT NOT NULL,
    total_marks INT NOT NULL,
    obtain_marks INT NOT NULL,
    grade VARCHAR(10) NOT NULL,
    percentage DECIMAL(5,2) GENERATED ALWAYS AS ((obtain_marks * 100.0) / total_marks) STORED,
    FOREIGN KEY (enrollment_id) REFERENCES enrollments(enrollment_id) ON DELETE CASCADE,
    CHECK (obtain_marks >= 0 AND obtain_marks <= total_marks)
);

--9. Attendance Table
CREATE TABLE attendance (
    attendance_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    enrollment_id INT NOT NULL,
    attendance_date DATE NOT NULL DEFAULT CURRENT_DATE,
    status VARCHAR(10) NOT NULL,
    notes TEXT,
    
    CONSTRAINT fk_attendance_enrollment 
        FOREIGN KEY (enrollment_id) 
        REFERENCES enrollments(enrollment_id) 
        ON DELETE CASCADE,
   
   CONSTRAINT unique_daily_attendance 
        UNIQUE (enrollment_id, attendance_date),
        
    CONSTRAINT chk_valid_status 
        CHECK (status IN ('Present', 'Absent', 'Late', 'Excused'))
);