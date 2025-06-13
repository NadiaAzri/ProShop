USE ProShop;

CREATE TABLE Employee (
	EmployeeID VARCHAR(7) PRIMARY KEY,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL, 
	Gender CHAR(2),
	BirthDate DATE, 
	HireDate DATE, 
	Email VARCHAR(30), 
	Phone VARCHAR(12),
	DepartmentID VARCHAR(7), 
	ManagerID VARCHAR(7), 
	JobTitleID VARCHAR(7)
);

CREATE TABLE Department (
	DepartmentID VARCHAR(7) PRIMARY KEY, 
	DeptName VARCHAR(7) NOT NULL,
	FoundedIn INT, 
	Extension INT
);

CREATE TABLE Education(
	EducationID VARCHAR(7) PRIMARY KEY, 
	Degree VARCHAR(5),
	Level VARCHAR(20),
	Field VARCHAR(30),
	InstitutionName VARCHAR(30)
);

CREATE TABLE JobTitle (
    JobTitleID VARCHAR(7) PRIMARY KEY,
    Title VARCHAR(20) NOT NULL,
    RemoteEligibility BIT,
    BaseSalary INT
);

CREATE TABLE EmployeeEducation (
    EmployeeID VARCHAR(7) NOT NULL,
    EducationID VARCHAR(7) NOT NULL,
    GraduationYear INT,
    GPA DECIMAL(3,2),
PRIMARY KEY(EmployeeID, EducationID)
);

CREATE TABLE Training (
    TrainingID VARCHAR(7) PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Year INT NOT NULL,
    DurationDays INT,
    DepartmentID VARCHAR(7),
    CreatedBy VARCHAR(7)
);

CREATE TABLE EmployeeTraining (
    EmployeeID VARCHAR(7) NOT NULL,
    TrainingID VARCHAR(7) NOT NULL,
    TrainerID VARCHAR(7) NOT NULL,
    CompletingDate DATE,
    Score DECIMAL(5,2),
    PRIMARY KEY(EmployeeID, TrainingID)
);

--Alter Table
--FKs:
ALTER TABLE Employee ADD CONSTRAINT
FK_Employee_Department_DepartmentID
	FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID);

ALTER TABLE Employee ADD CONSTRAINT
FK_Employee_Manager_EmployeeID
	FOREIGN KEY (ManagerID) REFERENCES Employee(EmployeeID);

ALTER TABLE Employee ADD CONSTRAINT 
FK_Employee_JobTitle_JobTitleID
	FOREIGN KEY (JobTitleID) REFERENCES JobTitle(JobTitleID);

ALTER TABLE EmployeeEducation ADD CONSTRAINT FK_EmployeeEducation_Employee_EmployeeID
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID);

ALTER TABLE EmployeeEducation ADD CONSTRAINT FK_EmployeeEducation_Education_EducationID 
    FOREIGN KEY (EducationID) REFERENCES Education(EducationID);

ALTER TABLE Training ADD CONSTRAINT FK_Training_Department_DepartmentID 
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID);

ALTER TABLE Training ADD CONSTRAINT FK_Training_Employee_CreatedBy 
    FOREIGN KEY (CreatedBy) REFERENCES Employee(EmployeeID);

ALTER TABLE EmployeeTraining ADD CONSTRAINT FK_EmployeeTraining_Employee_EmployeeID 
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID);

ALTER TABLE EmployeeTraining ADD CONSTRAINT FK_EmployeeTraining_Training_TrainingID 
    FOREIGN KEY (TrainingID) REFERENCES Training(TrainingID);

ALTER TABLE EmployeeTraining ADD CONSTRAINT FK_EmployeeTraining_Employee_TrainerID
    FOREIGN KEY (TrainerID) REFERENCES Employee(EmployeeID);


--Check and Unique: 
--Employee
ALTER TABLE Employee ADD CONSTRAINT CK_Employee_Gender 
	CHECK (Gender IN ('M', 'F', 'U'));

ALTER TABLE Employee ADD CONSTRAINT CK_Employee_HireDate
	CHECK (HireDate<GETDATE());

ALTER TABLE Employee ADD CONSTRAINT Unique_Employee_Email 
UNIQUE(Email);

ALTER TABLE Employee ADD CONSTRAINT CK_Employee_BirthDate
	CHECK (DATEDIFF(YEAR, BirthDate, GETDATE()) >= 18);


--Department
ALTER TABLE Department ADD CONSTRAINT CK_Department_FoundedIn 
CHECK (FoundedIn BETWEEN '1900' AND GETDATE());

ALTER TABLE Department
ALTER COLUMN DeptName VARCHAR(25)

ALTER TABLE Department ADD CONSTRAINT UNIQUE_Department_DeptName 
UNIQUE(DeptName);

ALTER TABLE Department ADD CONSTRAINT UNIQUE_Department_Extension
	UNIQUE(Extension);

-- JobTitle
ALTER TABLE JobTitle ADD CONSTRAINT UNIQUE_JobTitle_Title UNIQUE (Title);
ALTER TABLE JobTitle ADD CONSTRAINT CHECK_JobTitle_BaseSalary CHECK (BaseSalary >= 0);

-- EmployeeEducation
ALTER TABLE EmployeeEducation ADD CONSTRAINT CHECK_EmployeeEducation_GPA CHECK (GPA BETWEEN 0 AND 4);

-- Training
ALTER TABLE Training ADD CONSTRAINT CHECK_Training_Year CHECK (Year >= 2010);
ALTER TABLE Training ADD CONSTRAINT CHECK_Training_Duration CHECK (DurationDays > 0);

-- EmployeeTraining
ALTER TABLE EmployeeTraining ADD CONSTRAINT CHECK_EmployeeTraining_Score CHECK (Score BETWEEN 0 AND 100);

--INSERT RECORDS

INSERT INTO Department (DepartmentID, DeptName, FoundedIn, Extension) 
VALUES
('D01', 'IT', 2005, 552),
('D02', 'HR', 2010, 553),
('D03', 'Finance', 2008, 554),
('D04', 'Operations', 2011, 555);

--Education Table
INSERT INTO Education (EducationID, Level, Degree, InstitutionName, Field)
VALUES 
('ED01', 'Bachelor of Science', 'B.Sc', 'Touro University', 'Comp. Science'),
('ED04', 'Master of Science', 'M.Sc', 'St. Johns University', 'Systems Engineering'),
('ED03', 'Bachelor of Arts', 'B.A.', 'NYU', 'HR Management');

-- JobTitle Table
INSERT INTO JobTitle (JobTitleID, Title, RemoteEligibility, BaseSalary)
VALUES 
('J01', 'Developer', 1, 70000),
('J02', 'Manager', 1, 85000),
('J03', 'Analyst', 0, 55000),
('J04', 'Systems Admin', 0, 60000);

--Employee Table
INSERT INTO Employee (EmployeeID, FirstName, LastName, Gender, BirthDate, HireDate, Email, Phone, ManagerID, JobTitleID, DepartmentID) 
VALUES
('E001', 'Ana', 'Torres', 'F',	'1990-03-15', '2020-06-01', 'ana@email.com',	 '555-123-4567', 'E005', 'J01', 'D01'),
('E002', 'Luis', 'Reyes', 'M', '1985-07-10', '2018-04-12', 'luis@email.com', '555-456-7890', 'E001', 'J02', 'D02'),
('E003', 'Maria', 'Silva', 'F', '1992-01-20', '2021-11-05', 'maria@email.com', '555-789-6543', 'E004', 'J03', 'D03'),
('E004', 'Jorge', 'Diaz', 'M', '1988-10-30', '2017-08-20', 'jorge@email.com', '555-888-1234', 'E002', 'J04', 'D04'),
('E005', 'Carla', 'Moreno', 'F', '1995-09-12', '2022-01-17', 'carla@email.com', 	'555-111-2222', 'E001', 'J01', 'D01'),
('HR01', 'Natalie', 'Chen', 'F', '1989-02-17', '2016-03-14', 'natalie@email.com', '555-201-1234', NULL, 'J02', 'D02'),
('IT01', 'Ahmed',  'El-Sayed', 'M', '1985-11-03', '2014-07-21',	'ahmed@email.com', '555-202-2345', 'E005', 'J01', 'D01'),
('FIN01', 'Isabella', 'Rossi', 'F', '1992-07-24', '2015-11-09', 'isabella@email.com', '555-203-3456', 'E004', 'J03', 'D03'),
('OPS01', 'Samuel',  'Ofori', 'M', '1988-05-11', '2013-05-27', 'samuel@email.com', '555-204-4567', 'E002', 'J04', 'D04'),
('TR01', 'Leila', 'Haddad', 'F', '1991-09-08', '2016-08-01', 'leila@email.com', '555-205-5678', NULL, 'J02', 'D02'),
('TR03', 'David', 'Kim', 'M', '1990-12-30', '2012-01-16', 'david@email.com', '555-206-6789', 'E005', 'J01', 'D01'),
('TR04', 'Fatima', 'Alvarez', 'F', '1993-04-15', '2015-04-30', 'fatima@email.com', '555-207-7890', 'E004', 'J03', 'D03');


-- Training table
INSERT INTO Training (TrainingID, Title, DurationDays, Year, DepartmentID, CreatedBy)
VALUES 
('T001', 'Agile Basics', 5, 2023, 'D02', 'HR01'),
('T005', 'Python Essentials', 5, 2023, 'D01', 'IT01'),
('T003', 'Financial Modeling', 6, 2023, 'D03', 'FIN01'),
('T004', 'Network Security', 8, 2024, 'D04', 'OPS01');

-- EmployeeEducation table
INSERT INTO EmployeeEducation (EducationID, EmployeeID, GraduationYear, GPA)
VALUES 
('ED01', 'E001', 2012, 3.8),
('ED04', 'E001', 2015, 3.9),
('ED03', 'E002', 2008, 3.5),
('ED03', 'E003', 2013, 3.7),
('ED04', 'E004', 2014, 3.9),
('ED01', 'E005', 2018, 3.85),
('ED03', 'HR01', 2008, 3.9);

-- EmployeeTraining table
INSERT INTO EmployeeTraining (TrainingID, EmployeeID, TrainerID, CompletingDate, Score)
VALUES 
('T001', 'E001', 'TR01', '2023-03-10', 90),
('T001', 'E002', 'TR01', '2023-03-10', 88),
('T005', 'E002', 'TR01', '2023-06-10', 97),
('T003', 'E003', 'TR03', '2023-07-15', 91),
('T004', 'E004', 'TR04', '2024-03-25', 89),
('T005', 'E005', 'TR01', '2023-06-10', 94);



--QUERIES

--WHERE

--Find the employees who are women
SELECT EmployeeID, FirstName, LastName
FROM Employee
WHERE Gender='F';

--Find employees who were hired after 2016
SELECT FirstName, LastName, HireDate
FROM Employee
WHERE HireDate>= '2016-01-01';

--Find the employees id, first and last name whose birthday is in May
SELECT EmployeeID, FirstName, LastName, BirthDate
FROM Employee
WHERE MONTH(BirthDate)='05';

--Find the full name and title of employees whose Title is Developer or Manager
SELECT FirstName, LastName, JobTitle.Title
FROM Employee INNER JOIN JobTitle ON Employee.JobTitleID=JobTitle.JobTitleID
WHERE Title= 'Developer' 
OR Title= 'Manager';

--Find The Manager's names
SELECT EmployeeID, FirstName, LastName, JobTitle.Title
FROM Employee INNER JOIN JobTitle ON Employee.JobTitleID=JobTitle.JobTitleID
WHERE Title = 'Manager'; 

--Find the department with extension ending in 3
SELECT DeptName, Extension
FROM Department
WHERE Extension LIKE '%3';

--Find the employees and their gpa for those who have a Bachelors and Master of Science
SELECT EmployeeID, GPA
FROM EmployeeEducation
WHERE EducationID IN ('ED01', 'ED04');

--Get the employees that have remote eligibility
SELECT E.FirstName, E.LastName, JT.Title
FROM Employee E
JOIN JobTitle JT ON E.JobTitleID = JT.JobTitleID
WHERE JT.RemoteEligibility = 1;

--Employees who scored more than 90 in training
SELECT E.FirstName, E.LastName, T.Title AS [Training Title], ET.Score
FROM Employee E
JOIN 
    EmployeeTraining ET ON E.EmployeeID = ET.EmployeeID
JOIN 
    Training T ON ET.TrainingID = T.TrainingID
WHERE 
    ET.Score > 90;

--Find employees without a manager 
SELECT EmployeeID, FirstName, LastName
FROM Employee
WHERE ManagerID IS NULL;

--Find employees with GPA greater than or equal 3.5
SELECT EE.EmployeeID, E.FirstName, E.LastName, GPA
FROM EmployeeEducation EE
JOIN 
Employee E ON EE.EmployeeID = E.EmployeeID
WHERE GPA > 3.5;

--Find employees in a specific department 
SELECT EmployeeID, FirstName, LastName
FROM Employee
WHERE DepartmentID = 'D01';

--GROUP BY AND HAVING

--Count and find any duplicates in the employee table
SELECT EmployeeID, COUNT(*) AS Repetitions
FROM Employee
GROUP BY EmployeeID
HAVING COUNT(*)>1

--How many employees are there per degree?
SELECT EducationID, COUNT(*) AS MultipleDegrees
FROM EmployeeEducation
GROUP BY EducationID
HAVING COUNT(*)>1

--How many departments have more than 3 employees?
SELECT COUNT(*) AS DepartmentsWithMoreThan3Employees
FROM (
    SELECT DepartmentID
    FROM Employee
    GROUP BY DepartmentID
    HAVING COUNT(*) > 3
) AS DeptCount;

-- Average score per training, only above 85
SELECT TrainingID, AVG(Score) AS AvgScore
FROM EmployeeTraining
GROUP BY TrainingID
HAVING AVG(Score) > 85;

-- Number of employees with each job title, titles with more than 1 employee
SELECT JobTitleID, COUNT(*) AS EmployeeCount
FROM Employee
GROUP BY JobTitleID
HAVING COUNT(*) > 1;


--UPDATES 

--Change Carla's E005 email
UPDATE Employee
SET Email='carla2@gmail.com'
WHERE EmployeeID='E005';

-- Change the M.Sc to M.Science
UPDATE Education
SET Degree= 'M.Science'
WHERE EducationID='ED02';

-- Update phone number for an employee
UPDATE Employee
SET Phone = '5551234567'
WHERE EmployeeID = 'E001';

-- Increase base salary for a specific job title
UPDATE JobTitle
SET BaseSalary = BaseSalary + 5000
WHERE JobTitleID = 'J03';

-- Update duration of a specific training
UPDATE Training
SET DurationDays = 10
WHERE TrainingID = 'T005';


--DELETE

-- Delete any records where gender is ‘unknown'
DELETE 
FROM Employee
WHERE Gender='U'

-- Delete any records where the employees didn't score higher than 85 in their trainings
DELETE 
FROM EmployeeTraining
WHERE Score<85

-- Delete any records with the information for Master of Business Administration from education. 
DELETE
FROM Education
WHERE Degree='M.BA'

-- Delete all job titles called ‘Intern'
DELETE
FROM JobTitle
WHERE Title='Intern'



