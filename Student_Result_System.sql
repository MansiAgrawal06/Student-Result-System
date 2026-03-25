CREATE DATABASE Student_Result_System;
USE Student_Result_System;

CREATE TABLE Students(
    Student_id INT PRIMARY KEY,
    Student_name VARCHAR(50),
    Gender VARCHAR(10),
    Department VARCHAR(50)
);

CREATE TABLE Courses(
    Course_id INT PRIMARY KEY,
    Course_name VARCHAR(50),
    Credits INT
);

CREATE TABLE Semesters(
    Semester_id INT PRIMARY KEY,
    Semester_name VARCHAR(20)
);

CREATE TABLE Grades(
    Grade_id INT PRIMARY KEY,
    Student_id INT,
    Course_id INT,
    Semester_id INT,
    Marks INT,
    Grade VARCHAR(2),
    
    FOREIGN KEY (Student_id) REFERENCES Students(Student_id),
    FOREIGN KEY (Course_id) REFERENCES Courses(Course_id),
    FOREIGN KEY (Semester_id) REFERENCES Semesters(Semester_id)
);

INSERT INTO Students VALUES
(1,'Aman Sharma','Male','BCA'),
(2,'Riya Verma','Female','BCA'),
(3,'Karan Singh','Male','BCA'),
(4,'Sneha Gupta','Female','BCA'),
(5,'Rahul Mehta','Male','BCA'),
(6,'Anjali Jain','Female','BCA'),
(7,'Vikas Yadav','Male','BCA'),
(8,'Neha Kapoor','Female','BCA'),
(9,'Arjun Patel','Male','BCA'),
(10,'Priya Saxena','Female','BCA');

INSERT INTO Courses VALUES
(101,'Database Management System',4),
(102,'Data Structures',4),
(103,'Operating System',3),
(104,'Computer Networks',3),
(105,'Software Engineering',3);

INSERT INTO Semesters VALUES
(1,'Semester 1'),
(2,'Semester 2'),
(3,'Semester 3'),
(4,'Semester 4'),
(5,'Semester 5'),
(6,'Semester 6');

INSERT INTO Grades VALUES
(1,1,101,1,85,'A'),
(2,1,102,1,78,'B'),
(3,1,103,2,82,'A'),

(4,2,101,1,75,'B'),
(5,2,104,2,69,'C'),
(6,2,105,3,80,'A'),

(7,3,101,1,90,'A'),
(8,3,102,2,88,'A'),
(9,3,103,3,84,'A'),

(10,4,101,1,65,'C'),
(11,4,104,2,72,'B'),
(12,4,105,3,74,'B'),

(13,5,101,1,55,'D'),
(14,5,102,2,60,'C'),
(15,5,103,3,70,'B'),

(16,6,101,1,92,'A'),
(17,6,104,2,89,'A'),
(18,6,105,3,87,'A'),

(19,7,102,1,68,'C'),
(20,7,103,2,73,'B'),
(21,7,104,3,77,'B'),

(22,8,101,1,81,'A'),
(23,8,105,2,79,'B'),
(24,8,103,3,76,'B'),

(25,9,102,1,83,'A'),
(26,9,104,2,80,'A'),
(27,9,105,3,85,'A'),

(28,10,101,1,74,'B'),
(29,10,102,2,71,'B'),
(30,10,103,3,69,'C'),
(31,10,104,4,82,'A');

SELECT s.Student_name, c.Course_name, sem.Semester_name, g.Marks, g.Grade
FROM Grades g
JOIN Students s ON g.Student_id = s.Student_id
JOIN Courses c ON g.Course_id = c.Course_id
JOIN Semesters sem ON g.Semester_id = sem.Semester_id;

SELECT Student_id, AVG(Marks) AS Average_Marks
FROM Grades
GROUP BY Student_id;

SELECT Student_id,
AVG(Marks) AS Avg_Marks,
RANK() OVER (ORDER BY AVG(Marks) DESC) AS Rank_Position
FROM Grades
GROUP BY Student_id;

SELECT 
Student_id,
AVG(
CASE 
WHEN Grade='A' THEN 4
WHEN Grade='B' THEN 3
WHEN Grade='C' THEN 2
WHEN Grade='D' THEN 1
ELSE 0
END
) AS GPA
FROM Grades
GROUP BY Student_id;


