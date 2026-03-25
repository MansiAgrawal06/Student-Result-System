# Student Result System (SQL Project)

## Project Overview
The **Student Result System** is a SQL-based database project designed to manage student academic records.  
This system stores information about students, courses, semesters, and grades and performs operations such as GPA calculation, grade reporting, and student ranking.

---

## Objectives
- Store student academic data in a structured database.
- Manage courses and semester information.
- Record student grades and marks.
- Generate GPA and performance reports.
- Create student rank lists based on marks.

---

## Database Schema

### Tables Used

1. **Students**
   - student_id (Primary Key)
   - student_name
   - gender
   - department

2. **Courses**
   - course_id (Primary Key)
   - course_name
   - credits

3. **Semesters**
   - semester_id (Primary Key)
   - semester_name

4. **Grades**
   - grade_id (Primary Key)
   - student_id (Foreign Key)
   - course_id (Foreign Key)
   - semester_id (Foreign Key)
   - marks
   - grade

---

## Features

- Store student academic information
- Maintain course and semester data
- Record marks and grades
- Calculate GPA for students
- Generate grade reports
- Generate student rank lists using SQL window functions

---

## SQL Concepts Used

- CREATE TABLE
- INSERT INTO
- PRIMARY KEY & FOREIGN KEY
- JOINS
- GROUP BY
- CASE Statements
- Aggregate Functions (AVG)
- Window Functions (RANK)

---

## Sample Queries

### Grade Report
Displays student result information including course, semester, marks, and grade.

```sql
SELECT s.student_name, c.course_name, sem.semester_name, g.marks, g.grade
FROM Grades g
JOIN Students s ON g.student_id = s.student_id
JOIN Courses c ON g.course_id = c.course_id
JOIN Semesters sem ON g.semester_id = sem.semester_id;
