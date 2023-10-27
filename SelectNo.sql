-- Total number of tests
SELECT COUNT(numtest) as 'Total test'
FROM Tests;
-- List of score, specifying for each the name 
-- and first name of the student who obtained it
SELECT Notations.score,
    Students.student_name,
    Students.student_firstname
FROM Notations
    JOIN Students ON Notations.numstud = Students.numstud;
-- List of score, specifying for each the name 
-- and first name of the student who obtained it and the
-- wording of the matter concerned 
SELECT Notations.score,
    Students.student_name,
    Students.student_firstname,
    Matters.wording
FROM Notations
    JOIN Students ON Notations.numstud = Students.numstud
    JOIN Tests ON Notations.numtest = Tests.numtest
    JOIN Matters ON Tests.matter = Matters.codemat;
-- List of score greater than or equal to 10 
SELECT score
FROM Notations
WHERE score >= 10;
-- Last name and first name of the students 
-- who obtained at least a score equal to 20
SELECT Students.student_name,
    Students.student_firstname
FROM Notations
    JOIN Students ON Notations.numstud = Students.numstud
WHERE Notations.score = 20;
-- Average scores for each student 
-- (indicate name and first name)
SELECT AVG(Notations.score) as average_score,
    Students.student_name,
    Students.student_firstname
FROM Notations
    JOIN Students ON Notations.numstud = Students.numstud
GROUP BY Notations.numstud;
-- List of tests whose date is between 
-- January 1 and June 30, 2014
SELECT *
FROM Tests
WHERE testdate < '2014-06-30'
    AND testdate > '2014-01-01';
-- List of tests (number, date and place) 
-- including the matter of the subjec
SELECT Tests.numtest,
    Tests.testdate,
    Tests.place,
    Matters.wording
FROM Tests
    JOIN Matters ON Tests.matter = Matters.codemat;
-- Average scores for each student 
-- (indicate name and first name), ranked from best to wors
SELECT AVG(Notations.score) as average_score,
    Students.student_name,
    Students.student_firstname
FROM Notations
    JOIN Students ON Notations.numstud = Students.numstud
GROUP BY Notations.numstud
ORDER BY average_score DESC;
-- Average scores for matter (indicate the wording) 
-- comprising more than one test
SELECT AVG(Notations.score) as average_score,
    Matters.wording
FROM Notations
    JOIN Tests ON Notations.numtest = Tests.numtest
    JOIN Matters ON Tests.matter = Matters.codemat
GROUP BY Tests.matter
HAVING COUNT(DISTINCT Tests.numtest) > 1;
-- Average of score obtained in the tests 
-- (indicate the number of the test) where 
-- less than 6 students were rated
SELECT AVG(Notations.score) as average_score,
    Tests.numtest
FROM Notations
    JOIN Tests ON Notations.numtest = Tests.numtest
GROUP BY Notations.numtest
HAVING COUNT(Notations.numstud) < 6;