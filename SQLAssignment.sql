-- Course: Database Management Systems 

-- Instructor: Md Hossain 

-- Student: Ryan McCutcheon 

 

-- Assignment: DDL 


-- Task 1: Southern Arkansas University Database Creation 

-- Below is a schema of Southern Arkansas University database. Create the database and all tables using SQL command. Also, insert at least 3 rows in each table using SQL command. In phpMyAdmin, Name your database as “universitydb”. 


CREATE TABLE Department ( 

    dept_name VARCHAR (20) PRIMARY KEY, 

    building VARCHAR (30), 

    budget NUMERIC( 10,2) 

) 

INSERT INTO Department (dept_name, building, budget)  

VALUES 

        ('Computer Science', 'Reynolds', 500000.00),  

        ('Biology', 'Biology Building', 750000.00),  

        ('Business', 'Business Building', 1000000.00); 


CREATE TABLE Course ( 

    course_id VARCHAR (8) PRIMARY KEY, 

    title VARCHAR (50), 

    dept_name VARCHAR (20), 

    credits NUMERIC (2,0), 

    FOREIGN KEY (dept_name) REFERENCES Department (dept_name) 

    ); 

INSERT INTO Course (course_id, title, dept_name, credits) 

VALUES 

	    ('CS101', 'Introduction to Computer Science', 'Computer Science', 3), 

     	('BIO101', 'Introduction to Biology', 'Biology', 4), 

     	('BUS101', 'Introduction to Business', 'Business', 3); 


CREATE TABLE Instructor ( 

    ID INTEGER PRIMARY KEY, 

    name VARCHAR (50), 

    dept_name VARCHAR (20), 

    salary NUMERIC (10,2), 

    FOREIGN KEY (dept_name) REFERENCES Department (dept_name) 

    ); 

INSERT INTO Instructor (ID, name, dept_name, salary) 

VALUES 

	    (1001, 'Md Hossain', 'Computer Science', 75000.00), 

        (1002, 'Jane Smith', 'Biology', 80000.00), 

   	    (1003, 'John Doe', 'Business', 90000.00); 
 

CREATE TABLE Section ( 

    course_id VARCHAR (8),  

    sec_id INTEGER,  

    semester VARCHAR (10),  

    year INTEGER,  

    building VARCHAR (30),  

    room_number VARCHAR (10), 

    PRIMARY KEY (course_id, sec_id), 

    FOREIGN KEY (course_id) REFERENCES Course (course_id) 

); 


INSERT INTO Section (course_id, sec_id, semester, year, building, room_number)  

VALUES  

        ('CS101', 1, 'Fall', 2022, 'Reynolds', '101'),  

        ('BIO101', 1, 'Spring', 2023, 'Biology Building', '105'),  

        ('BUS101', 1, 'Fall', 2022, 'Business Building', '201'); 


CREATE TABLE Teaches (  

ID INTEGER,  

course_id VARCHAR (8),  

sec_id INTEGER,  

semester VARCHAR (10),  

year INTEGER,  

PRIMARY KEY (ID, course_id, sec_id, semester, year),  

FOREIGN KEY (ID) REFERENCES Instructor (ID),  

FOREIGN KEY (course_id, sec_id) REFERENCES Section (course_id, sec_id)  

); 

INSERT INTO Teaches (ID, course_id, sec_id, semester, year) 

VALUES 

	    (1001, 'CS101', 1, 'Fall', 2022), 

    	(1002, 'BIO101', 1, 'Spring', 2023), 

    	(1003, 'BUS101', 1, 'Fall', 2022); 


CREATE TABLE Student ( 

    ID INTEGER PRIMARY KEY,  

    name VARCHAR (50), 

    dept_name VARCHAR (20), 

    tot_cred NUMERIC (3,0), 

    FOREIGN KEY (dept_name) REFERENCES Department (dept_name) 

    ); 

INSERT INTO Student (ID, name, dept_name, tot_cred) 

VALUES 

	    (10001, 'Ryan McCutcheon', 'Computer Science', 100), 

    	(10002, 'Nolan McCutcheon', 'Biology', 90), 

    	(10003, 'Jake Ramos', 'Business', 75); 




-- Task 2: Data Manipulation using SQL Command [5 points] 

-- Perform following data manipulation: 

-- Increase the budget of law department by 5 percent. (Not sure where we were required to have a law department, so I increased the budget of the Computer Science department I created in my universitydb database.) 

UPDATE Department 

SET budget = budget * 1.05  

WHERE dept_name = 'Computer Science' 


-- Show the budget of CSC department. 

SELECT budget 

FROM Department 

WHERE dept_name = 'Computer Science' 


-- List name and salary of all instructors of CSC department. 

SELECT name, salary 

FROM Instructor 

WHERE dept_name = 'Computer Science' 


-- List name and total credits of all students. 

SELECT name, tot_cred 

FROM Student 


-- Assignment: DML 

-- Download SQLAssignment.sql database from Blackboard and import the database to phpMyAdmin as a new database named “SQLAssignment”. Write the SQL commands for the following queries and execute those in your machine.  Also, show the output tables.  

-- List the property numbers and city of all properties that have been viewed. You need to eliminate duplicates from the list. Also, arrange the list by ascending order of city (alphabetic order), and within city, in descending order of property number (alphabetic order). 

-- [3 Points] 

-- SQL Command: 

SELECT DISTINCT p.propertyNo, p.city 

FROM propertyforrent p 

JOIN viewing v ON p.propertyNo = v.propertyNo 

ORDER BY p.city ASC, p.propertyNo DESC; 


-- Assume, the salary column in staff table presents the annual salary of a staff. Now, list all staff with monthly salary less than 1000. In your list, show staff number, last name, and monthly salary. [2 Points] 

-- SQL Command: 

SELECT staffNo, lName, salary/12 AS monthly_salary 

FROM staff 

WHERE salary / 12 < 1000 

-- Find all clients with the string ‘flintyrock’ in their email address. In your list, show client number, last name, and email address. [1 Point] 

-- SQL Command: 

SELECT clientNo, lName, email 

FROM client 

WHERE email LIKE '%flintyrock%' 

-- Find the total number of female staff in the Staff table. You need to name the output column as ‘NumOfFemaleStaff’. [1 Point] 

-- SQL Command: 

SELECT COUNT(*) AS NumOfFemaleStaff  

FROM staff  

WHERE sex = 'F' 