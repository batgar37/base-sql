-- List of all students
SELECT *
from Students;
-- List of all students, sorted in reverse 
-- alphabetical order
SELECT *
FROM Students
ORDER BY student_name DESC;
-- Last student_name and student_firstname of students domiciled in Lyon
SELECT student_name,
    student_firstname
FROM Students
WHERE city = 'Lyon';
-- Last name, first name and city of students whose city 
-- contains the string « LL »
SELECT *
FROM Students
WHERE city LIKE '%LL%';
-- First name of students with Dupont, Durand or Martin names
SELECT student_name
FROM Students
WHERE student_name = 'Dupont'
    OR student_name = 'Durand'
    OR student_name = 'Martin'