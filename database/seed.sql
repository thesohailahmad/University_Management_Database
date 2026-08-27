INSERT INTO departments(name)
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