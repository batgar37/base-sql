DROP TABLE IF EXISTS Notations,
Tests,
Students,
Matters;
CREATE TABLE Matters (
    codemat VARCHAR(255) NOT NULL,
    wording VARCHAR(255),
    coef FLOAT,
    PRIMARY KEY (codemat)
);
CREATE TABLE Students (
    numstud INT NOT NULL,
    student_name VARCHAR(255),
    student_firstname VARCHAR(255),
    date_of_birth Date,
    street VARCHAR(255),
    postalcod VARCHAR(255),
    city VARCHAR(255),
    PRIMARY KEY (numstud)
);
CREATE TABLE Tests (
    numtest INT NOT NULL,
    matter VARCHAR(255),
    testdate Date,
    place VARCHAR(255),
    PRIMARY KEY(numtest),
    FOREIGN KEY (matter) REFERENCES Matters(codemat)
);
CREATE TABLE Notations (
    score FLOAT,
    numstud INT,
    numtest INT,
    FOREIGN KEY (numstud) REFERENCES Students(numstud),
    FOREIGN KEY (numtest) REFERENCES Tests(numtest)
);