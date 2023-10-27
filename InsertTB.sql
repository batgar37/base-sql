-- 7 students, including 3 in the same city and 3 whose names are: 
-- Dupont, Durand, and Martin.
-- Their is also 2 cities whose name contains LL
INSERT INTO Students (
        numstud,
        student_name,
        student_firstname,
        date_of_birth,
        street,
        postalcod,
        city
    )
VALUES (
        1,
        'Dupont',
        'Alice',
        '2000-01-10',
        '123 Main St',
        '12345',
        'Paris'
    ),
    (
        2,
        'Durand',
        'David',
        '1998-04-25',
        '101 Pine St',
        '45678',
        'Toulouse'
    ),
    (
        3,
        'Martin',
        'Eva',
        '2002-05-30',
        '202 Cedar St',
        '56789',
        'Lille'
    ),
    (
        4,
        'Dubois',
        'Bob',
        '2001-02-15',
        '456 Elm St',
        '23456',
        'Lyon'
    ),
    (
        5,
        'Jaquet',
        'Charlie',
        '1999-03-20',
        '789 Oak St',
        '34567',
        'Paris'
    ),
    (
        6,
        'Smith',
        'Frank',
        '2003-06-05',
        '303 Birch St',
        '67890',
        'Marseille'
    ),
    (
        7,
        'Johnson',
        'Grace',
        '2000-07-10',
        '404 Oak St',
        '78901',
        'Baltimore'
    );
-- 3 subjects with a coefficient greater than or equal to 1 
-- and at least one of which it is greater than 1
INSERT INTO Matters (codemat, wording, coef)
VALUES (
        'MAT001',
        'Mathematics',
        2.0
    ),
    (
        'PHY001',
        'Physics',
        1.5
    ),
    (
        'CHEM001',
        'Chemistry',
        1.0
    );
-- 5 tests are required, 3 of which have the date 
-- between 1/1/2014 and 30/6/2014 (inclusive)
INSERT INTO Tests (numtest, matter, testdate, place)
VALUES (
        1,
        'MAT001',
        '2013-12-15',
        'Room A'
    ),
    (
        2,
        'PHY001',
        '2014-02-20',
        'Room B'
    ),
    (
        3,
        'CHEM001',
        '2014-05-10',
        'Room C'
    ),
    (
        4,
        'MAT001',
        '2014-06-25',
        'Room D'
    ),
    (
        5,
        'CHEM001',
        '2014-08-10',
        'Room E'
    );
-- Insert 18 marks greater than or equal to 10 for various students and tests
INSERT INTO Notations (score, numstud, numtest)
SELECT ROUND(RAND() * 10) + 10,
    numstud,
    numtest
FROM Students,
    Tests
WHERE numstud BETWEEN 1 AND 7
    AND numtest BETWEEN 1 AND 3
LIMIT 18;
-- Insert 2 marks equal to 20 for different students and tests
INSERT INTO Notations (score, numstud, numtest)
SELECT 20,
    numstud,
    numtest
FROM Students,
    Tests
WHERE numstud BETWEEN 1 AND 7
    AND numtest BETWEEN 1 AND 3
LIMIT 2;
-- Insert 10 marks for 2 different test 
-- and less than 6 students marked per test
INSERT INTO Notations (score, numstud, numtest)
SELECT ROUND(RAND() * 20),
    numstud,
    numtest
FROM Students,
    Tests
WHERE numstud BETWEEN 1 AND 7
    AND numtest BETWEEN 4 AND 5
LIMIT 10;