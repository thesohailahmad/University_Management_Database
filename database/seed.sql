-- DEPARTMENT DATA

INSERT INTO departments (department_name) VALUES
    ('Computer Science'),
    ('Social Science'),
    ('Electrical Engineering'),
    ('Business Administration'),
    ('Mathematics & Statistics'),
    ('Physics'),
    ('English Literature');

--STUDENT DATA

INSERT INTO students (first_name, last_name, email, enrollment_date, department_id) VALUES
    ('Ayaan', 'Khan', 'ayaan.khan@student.edu.pk', '2023-09-01', 1),
    ('Fatima', 'Noor', 'fatima.noor@student.edu.pk', '2023-09-01', 2),
    ('Hamza', 'Ali', 'hamza.ali@student.edu.pk', '2022-09-15', 1),
    ('Zainab', 'Tariq', 'zainab.tariq@student.edu.pk', '2024-02-10', 4),
    ('Bilal', 'Ahmed', 'bilal.ahmed@student.edu.pk', '2022-09-15', 3),
    ('Maryam', 'Siddiqui', 'maryam.siddiqui@student.edu.pk', '2023-09-01', 5),
    ('Usman', 'Ghafoor', 'usman.ghafoor@student.edu.pk', '2024-02-10', 2),
    ('Ayesha', 'Malik', 'ayesha.malik@student.edu.pk', '2023-09-01', 6),
    ('Saad', 'Raza', 'saad.raza@student.edu.pk', '2021-09-20', 1),
    ('Hiba', 'Rehman', 'hiba.rehman@student.edu.pk', '2022-09-15', 4),
    ('Daniyal', 'Mustafa', 'daniyal.mustafa@student.edu.pk', '2024-02-10', 3),
    ('Khadija', 'Farooq', 'khadija.farooq@student.edu.pk', '2023-09-01', 7);

INSERT INTO student_profiles (student_id, date_of_birth, phone_number, address) VALUES
    (1, '2003-04-12', '+92 300 12345677', 'House 14, Street 3, Johar Town, Lahore'),
    (2, '2004-01-25', '+92 321 98765439', 'Flat 4B, Gulshan-e-Iqbal Block 5, Karachi'),
    (3, '2002-11-05', '+92 333 45678908', 'House 82, Sector F-8/2, Islamabad'),
    (4, '2005-06-18', '+92 345 67890127', 'House 19, Mall Road, Rawalpindi'),
    (5, '2002-08-30', '+92 312 34567896', 'Street 7, Model Town, Multan'),
    (6, '2003-12-14', '+92 301 23456782', 'House 45-A, Cavalry Ground, Lahore Cantt'),
    (7, '2004-09-22', '+92 322 87654324', 'House 102, Peoples Colony, Faisalabad'),
    (8, '2003-03-10', '+92 334 56789016', 'House 27, University Town, Peshawar'),
    (9, '2001-07-19', '+92 346 78901235', 'Flat 12, DHA Phase 5, Karachi'),
    (10, '2002-10-08', '+92 315 45678904', 'House 63, Satellite Town, Gujranwala'),
    (11, '2004-05-02', '+92 302 34567896', 'House 5, Officers Colony, Sialkot'),
    (12, '2003-08-16', '+92 323 65432107', 'House 88, Cantt Area, Quetta');


INSERT INTO instructors (instructor_name, education, biography, instructor_email, department_id) VALUES
    ('Dr. Tariq Mahmood', 'PhD in Computer Science', 'Over 15 years of experience researching distributed systems and machine learning algorithms.', 'tariq.mahmood@univ.edu.pk', 1),
    ('Dr. Asma Bilal', 'PhD in Social Science', 'Specializes in qualitative research methods and social policy analysis.', 'asma.bilal@univ.edu.pk', 2),
    ('Engr. Kamran Siddiqui', 'MS in Electrical Engineering', 'Expert in embedded systems, digital signal processing, and robotics control pipelines.', 'kamran.siddiqui@univ.edu.pk', 3),
    ('Dr. Noman Bashir', 'PhD in Finance & Management', 'Corporate consultant with a research focus on strategic management and financial markets.', 'noman.bashir@univ.edu.pk', 4),
    ('Prof. Saima Rashid', 'MPhil in Applied Mathematics', 'Dedicated educator with 12 years of experience teaching calculus, linear algebra, and discrete structures.', 'saima.rashid@univ.edu.pk', 5),
    ('Dr. Farhan Qureshi', 'PhD in Quantum Physics', 'Researcher focusing on solid-state physics, materials science, and optics.', 'farhan.qureshi@univ.edu.pk', 6),
    ('Ms. Samina Pervez', 'MPhil in English Linguistics', 'Lecturer specializing in academic writing, modern prose, and communication skills.', 'samina.pervez@univ.edu.pk', 7);

INSERT INTO courses (course_code, course_name, credit_hours, department_id) VALUES
    ('CS101', 'Introduction to Programming', 3, 1),
    ('CS201', 'Data Structures & Algorithms', 4, 1),
    ('SS301', 'Introduction to History', 3, 2),
    ('SS305', 'Introduction to Sociology', 4, 2),
    ('EE110', 'Circuit Analysis', 3, 3),
    ('EE220', 'Digital Logic Design', 4, 3),
    ('MGT101', 'Principles of Management', 3, 4),
    ('MGT205', 'Financial Accounting', 3, 4),
    ('MTH101', 'Calculus & Analytical Geometry', 3, 5),
    ('MTH202', 'Discrete Mathematics', 3, 5),
    ('PHY101', 'Mechanics & Thermodynamics', 3, 6),
    ('ENG101', 'English Composition & Comprehension', 3, 7);

INSERT INTO course_sections (course_id, instructor_id, semester, year, room) VALUES
    (1, 1, 'Fall', 2025, 'Lab 1 - CS Block'),
    (2, 1, 'Spring', 2026, 'Lab 2 - CS Block'),
    (3, 2, 'Fall', 2025, 'Room 201 - Academic Block'),
    (4, 2, 'Spring', 2026, 'Lab 3 - IT Block'),
    (5, 3, 'Fall', 2025, 'Room 105 - Engineering Hall'),
    (6, 3, 'Spring', 2026, 'Hardware Lab - Engineering Hall'),
    (7, 4, 'Fall', 2025, 'Room 302 - Management Wing'),
    (8, 4, 'Spring', 2026, 'Room 304 - Management Wing'),
    (9, 5, 'Fall', 2025, 'Room 101 - Science Block'),
    (10, 5, 'Spring', 2026, 'Room 102 - Science Block'),
    (11, 6, 'Fall', 2025, 'Physics Lab - Science Block'),
    (12, 7, 'Fall', 2025, 'Room 205 - Humanities Hall');

INSERT INTO enrollments (student_id, section_id, status, enrollment_date) VALUES
    (1, 1, 'completed', '2025-08-25'),
    (2, 3, 'completed', '2025-08-26'),
    (3, 1, 'completed', '2025-08-25'),
    (4, 7, 'completed', '2025-08-28'),
    (5, 5, 'completed', '2025-08-27'),
    (6, 9, 'completed', '2025-08-26'),
    (7, 3, 'completed', '2025-08-26'),
    (8, 11, 'completed', '2025-08-27'),
    (9, 1, 'completed', '2025-08-25'),
    (10, 7, 'completed', '2025-08-28'),
    (11, 5, 'completed', '2025-08-27'),
    (12, 12, 'completed', '2025-08-29'),
    (1, 2, 'active', '2026-01-20'),
    (2, 4, 'active', '2026-01-22'),
    (3, 2, 'active', '2026-01-20'),
    (4, 8, 'active', '2026-01-25'),
    (5, 6, 'active', '2026-01-21'),
    (6, 10, 'active', '2026-01-22'),
    (7, 4, 'active', '2026-01-23'),
    (9, 2, 'active', '2026-01-20'),
    (10, 8, 'active', '2026-01-25'),
    (11, 6, 'active', '2026-01-21'),
    (7, 2, 'dropped', '2026-01-20');

INSERT INTO grades (enrollment_id, total_marks, obtain_marks, grade) VALUES
    (1, 100, 88, 'A'),   
    (2, 100, 92, 'A+'),  
    (3, 100, 76, 'B'),   
    (4, 100, 84, 'A-'),  
    (5, 100, 68, 'C+'),  
    (6, 100, 95, 'A+'),  
    (7, 100, 79, 'B+'), 
    (8, 100, 72, 'B-'),  
    (9, 100, 85, 'A-'), 
    (10, 100, 90, 'A'), 
    (11, 100, 74, 'B'),  
    (12, 100, 81, 'B+');


INSERT INTO attendance (enrollment_id, attendance_date, status, notes) VALUES
    -- Monday: August 24, 2026
    (13, '2026-08-24', 'Present', NULL),
    (14, '2026-08-24', 'Present', NULL),
    (15, '2026-08-24', 'Present', NULL),
    (16, '2026-08-24', 'Late',    'Overslept'),
    (17, '2026-08-24', 'Present', NULL),

    -- Tuesday: August 25, 2026
    (13, '2026-08-25', 'Present', NULL),
    (14, '2026-08-25', 'Absent',  'No call no show'),
    (15, '2026-08-25', 'Present', NULL),
    (16, '2026-08-25', 'Present', NULL),
    (17, '2026-08-25', 'Present', NULL),

    -- Wednesday: August 26, 2026
    (13, '2026-08-26', 'Late',    'Bus delayed'),
    (14, '2026-08-26', 'Present', NULL),
    (15, '2026-08-26', 'Excused', 'Doctor appointment'),
    (16, '2026-08-26', 'Late',    'Traffic'),
    (17, '2026-08-26', 'Present', NULL),

    -- Thursday: August 27, 2026
    (13, '2026-08-27', 'Present', NULL),
    (14, '2026-08-27', 'Absent',  NULL),
    (15, '2026-08-27', 'Present', NULL),
    (16, '2026-08-27', 'Absent',  'Felt sick'),
    (17, '2026-08-27', 'Present', NULL),

    -- Friday: August 28, 2026
    (13, '2026-08-28', 'Present', NULL),
    (14, '2026-08-28', 'Present', NULL),
    (15, '2026-08-28', 'Present', NULL),
    (16, '2026-08-28', 'Present', NULL),
    (17, '2026-08-28', 'Present', NULL);
 