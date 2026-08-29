INSERT INTO departments(department_name)
VALUES
    ('Computer Science'),
    ('Social Science'),
    ('Mathematics'),
    ('English'),
    ('Urdu');

INSERT INTO students (first_name, last_name, email, enrollment_date, department_id) VALUES 
('Ali', 'Khan', 'ali.khan@email.com', '2026-08-01', 1),
('Sara', 'Ahmed', 'sara.ahmed@email.com', '2026-08-01', 2),
('Usman', 'Tariq', 'usman.tariq@email.com', '2026-08-02', 3),
('Fatima', 'Noor', 'fatima.noor@email.com', '2026-08-03', 4),
('Bilal', 'Hassan', 'bilal.hassan@email.com', '2026-08-04', 5);

INSERT INTO student_profiles (student_id, date_of_birth, phone_number, address) VALUES 
(1, '2005-03-15', '0300-1234567', 'Lahore, Pakistan'),
(2, '2006-07-22', '0301-7654321', 'Karachi, Pakistan'),
(3, '2004-11-10', '0333-1122334', 'Islamabad, Pakistan'),
(4, '2005-01-30', '0345-9988776', 'Peshawar, Pakistan'),
(5, '2003-09-05', '0321-5544332', 'Multan, Pakistan');


INSERT INTO instructors (instructor_name, education, biography, instructor_email, department_id)
VALUES 
    ('Dr. Sarah Jenkins', 'Ph.D. in Computer Science', 'Dr. Jenkins specializes in artificial intelligence and has 10 years of industry experience.', 'sarah.jenkins@university.edu', 1),
    ('Prof. Michael Chen', 'M.S. in Software Engineering', 'Prof. Chen focuses on database architecture and full-stack web development.', 'michael.chen@university.edu', 1),
    ('Dr. Emily Carter', 'Ph.D. in Social Science', 'Dr. Carter is a leading researcher in big data analytics and machine learning algorithms.', 'emily.carter@university.edu', 2),
    ('James Wilson', 'M.S. in English', 'With 15 years in cloud computing, James bridges the gap between theory and industry practice.', 'j.wilson@university.edu', 4),
    ('Dr. Alan Turing', 'Ph.D. in Mathematics', 'Pioneer in theoretical computer science and cryptography.', 'alan.turing@university.edu', 3);

INSERT INTO courses (course_code, course_name, credit_hours, department_id)
VALUES 
    ('CS201', 'Introduction to Programming in C++', 3, 1),
    ('CS304', 'Introduction To Social science', 3, 2),
    ('MTH202', 'Discrete Mathematics', 3, 3),
    ('SE401', 'Software Engineering Principles', 4, 1),
    ('HUM101', 'Introduction to Ethics', 2,2 );


INSERT INTO course_sections (
    course_id,
    instructor_id,
    semester,
    year,
    room
)
VALUES
(1, 1, 'Fall', 2026, 'A-101'),
(2, 2, 'Fall', 2026, 'B-201'),
(3, 3, 'Fall', 2026, 'C-105'),
(4, 4, 'Spring', 2027, 'A-205'),
(5, 5, 'Spring', 2027, 'B-102'),
(1, 2, 'Spring', 2027, 'A-101'),
(2, 1, 'Spring', 2027, 'B-201'),
(3, 4, 'Fall', 2027, 'C-105');
