------1.DATABASE
create database sis_db;
use sis_db;
-----2.DDL
create table students
(
student_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
date_of_birth DATE,
email VARCHAR(100),
phone_number varchar(20)
);
create table Courses 
(
course_id INT PRIMARY KEY,
course_name VARCHAR(255),
credits INT,
teacher_id INT FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id) 
);
CREATE TABLE Enrollments 
(
enrollment_id INT PRIMARY KEY,
student_id INT FOREIGN KEY (student_id) REFERENCES Students(student_id),
course_id INT FOREIGN KEY (course_id) REFERENCES Courses(course_id),
enrollment_date DATE,
);
CREATE TABLE Teacher 
(
teacher_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100)
);
CREATE TABLE Payments 
(
payment_id INT PRIMARY KEY,
student_id INT FOREIGN KEY (student_id) REFERENCES Students(student_id),
amount DECIMAL(10, 2),
payment_date DATE,
);

------3.DML
--3(a)
INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES
(1, 'John', 'Doe', '1995-03-15', 'john@example.com', '1234567660'),
(2, 'Jane', 'Smith', '1998-07-22', 'jane.smith@example.com', '9876543210'),
(3, 'Mike', 'Johnson', '1996-11-10', 'mike.johnson@example.com', '5551234567'),
(4, 'Sara', 'Brown', '1997-04-05', 'sara.brown@example.com', '1112223333'),
(5, 'David', 'Clark', '1999-09-18', 'david.clark@example.com', '9998887777'),
(6, 'Emily', 'Taylor', '1994-12-30', 'emily.taylor@example.com', '4445556666'),
(7, 'Chris', 'Williams', '1993-06-08', 'chris.williams@example.com', '7776665555'),
(8, 'Amy', 'Anderson', '1992-02-14', 'amy.anderson@example.com', '2223334444'),
(9, 'Ryan', 'Miller', '1990-10-25', 'ryan.miller@example.com', '6667778888'),
(10, 'Megan', 'Lee', '1991-08-03', 'megan.lee@example.com', '8889990000');

INSERT INTO Courses (course_id, course_name, credits, teacher_id)
VALUES(1, 'Mathematics 101', 3, 101),(2, 'Physics 201', 4, 102),
(3, 'English Composition', 3, 103),(4, 'Computer Science 101', 4, 104),
(5, 'History of Art', 3, 105),(6, 'Biology 301', 4, 106),
(7, 'Chemistry 201', 4, 107),(8, 'Economics 101', 3, 108),
(9, 'Spanish 101', 3, 109),(10, 'Psychology 201', 3, 110);

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(1, 1, 1, '2023-01-15'),
(2, 2, 2, '2022-02-20'),
(3, 3, 3, '2021-03-25'),
(4, 4, 4, '2020-04-10'),
(5, 5, 5, '2021-05-05'),
(6, 6, 6, '2019-06-15'),
(7, 7, 7, '2023-07-20'),
(8, 8, 8, '2020-08-25'),
(9, 9, 9, '2023-09-10'),
(10, 10, 10, '2023-10-05');

INSERT INTO Teacher (teacher_id, first_name, last_name, email)
VALUES
(101, 'John', 'Doe', 'john.doe@example.com'),
(102, 'Jane', 'Smith', 'jane.smith@example.com'),
(103, 'Michael', 'Johnson', 'michael.johnson@example.com'),
(104, 'Emily', 'Williams', 'emily.williams@example.com'),
(105, 'David', 'Brown', 'david.brown@example.com'),
(106, 'Emma', 'Davis', 'emma.davis@example.com'),
(107, 'Christopher', 'Miller', 'christopher.miller@example.com'),
(108, 'Olivia', 'Wilson', 'olivia.wilson@example.com'),
(109, 'Daniel', 'Moore', 'daniel.moore@example.com'),
(110, 'Sophia', 'Taylor', 'sophia.taylor@example.com');

INSERT INTO Payments([payment_id],[student_id],[amount],[payment_date]) 
VALUES
(1, 1, 500.00, '2023-01-15'),(2, 2, 700.50, '2023-02-02'),
(3, 3, 300.25, '2022-03-10'),(4, 4, 450.75, '2019-04-22'),
(5, 5, 600.00, '2020-05-05'),(6, 6, 800.20, '2023-06-18'),
(7, 7, 350.50, '2021-07-01'),(8, 8, 900.75, '2022-08-14'),
(9, 9, 250.00, '2023-09-29'),(10, 10, 550.50, '2023-10-12');

SELECT * FROM students;
SELECT * FROM Teacher;
SELECT * FROM Payments;
SELECT * FROM Enrollments;
SELECT * FROM Courses;

---3(b)
--Q1
INSERT INTO Students ( student_id, last_name, date_of_birth, email, phone_number)
VALUES( 11,'John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');
--Q2
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(11, 2, 1, '2023-03-15');
--Q3
UPDATE Teacher SET email='michael@example.com' WHERE teacher_id=103;
--Q4
DELETE FROM Enrollments WHERE student_id=1 AND course_id=1;
--Q5
UPDATE Courses SET teacher_id=105 WHERE course_id=2;
--Q6
DELETE FROM students WHERE student_id=2;----ON DELETE CASCADE
--Q7
UPDATE Payments SET amount=800.00 WHERE payment_id=2;

-----4.JOINS
--Q1
SELECT SUM(P.amount) FROM Payments AS P
JOIN students AS S ON P.student_id= S.student_id
GROUP BY S.student_id
HAVING S.student_id=3;
--Q2
SELECT C.course_name,COUNT(*)AS STU_COUNT FROM Courses AS C
JOIN Enrollments AS E ON C.course_id=E.course_id
GROUP BY C.course_name;
--Q3
SELECT S.first_name FROM students AS S
LEFT JOIN Enrollments AS E ON S.student_id=E.student_id
WHERE E.enrollment_id IS NULL;
--Q4
SELECT S.first_name,S.first_name,C.course_name FROM students AS S
JOIN Enrollments AS E ON S.student_id=E.student_id
JOIN Courses AS C ON E.course_id=C.course_id
--Q5
SELECT T.first_name,C.course_name FROM Teacher AS T
JOIN Courses AS C ON T.teacher_id=C.teacher_id
--Q6
SELECT S.first_name,E.enrollment_date FROM students AS S
JOIN Enrollments AS E ON S.student_id=E.student_id
JOIN Courses AS C ON E.course_id=C.course_id
WHERE C.course_id=2;
--Q7
SELECT S.first_name FROM students AS S
LEFT JOIN Payments AS P ON S.student_id=P.student_id
WHERE P.amount IS NULL;
--Q8
SELECT C.course_name FROM Courses AS C
LEFT JOIN Enrollments AS E ON C.course_id=E.course_id
WHERE E.enrollment_id IS NULL;
--Q9
SELECT DISTINCT E.student_id FROM Enrollments AS E
JOIN Enrollments AS N ON E.student_id=N.student_id AND E.course_id!=N.course_id
--Q10
SELECT T.first_name FROM Teacher AS T
LEFT JOIN Courses AS C ON T.teacher_id=C.teacher_id
WHERE C.course_id IS NULL;

-----5.AGG FUN & SUBQUERY
--Q1
SELECT COURSE_NAME,COURSE_ID ,AVG (STU_COUNT) AS AVG_STU_ENROLL FROM 
(SELECT C.course_name,C.COURSE_ID,COUNT(*)AS STU_COUNT FROM Courses AS C
LEFT JOIN Enrollments AS E ON C.course_id=E.course_id
GROUP BY C.course_name,C.course_id)AS S
GROUP BY course_name,course_id
--Q2
SELECT S.student_id,S.first_name,S.last_name,P.amount AS highest_payment FROM students AS S
join Payments AS P ON S.student_id=P.payment_id
WHERE P.amount=(SELECT MAX(amount) FROM Payments);
--Q4
SELECT teacher_id,course_id,SUM(amount) AS Amount
FROM (
    SELECT B.teacher_id,B.course_id, C.amount
    FROM Courses B
	JOIN Enrollments E ON E.course_id = B.course_id
    JOIN Payments C ON E.student_id = C.student_id     
) AS Subquery
GROUP BY teacher_id,course_id;
--Q5
SELECT * FROM 
(
SELECT A.student_id,COUNT(A.course_id) course_id
FROM Enrollments A
group by A.student_id
HAVING COUNT(course_id)>=10
ORDER BY course_id DESC
OFFSET 0 ROWS
)B
--Q6
SELECT T.first_name,T.last_name FROM Teacher AS T
WHERE T.teacher_id NOT IN (SELECT DISTINCT teacher_id FROM Courses);
--Q8
SELECT C.course_id, C.course_name FROM Courses AS C
WHERE C.course_id NOT IN (SELECT DISTINCT course_id FROM Enrollments);
--Q10
SELECT S.student_id,S.first_name,S.last_name FROM Students AS S
JOIN Payments AS P ON S.student_id = P.student_id
GROUP BY S.student_id, S.first_name, S.last_name
HAVING COUNT(P.payment_id) > 1;
--Q11
SELECT S.student_id,S.first_name,S.last_name,
    COALESCE(SUM(P.amount), 0) AS total_payments
FROM Students AS S
LEFT JOIN Payments AS P ON S.student_id = P.student_id
GROUP BY S.student_id, S.first_name, S.last_name;
--Q12
SELECT C.course_id,C.course_name,COUNT(E.student_id) AS student_count FROM Courses AS C
LEFT JOIN Enrollments AS E ON C.course_id = E.course_id
GROUP BY C.course_id, C.course_name;
--Q13
SELECT S.student_id, S.first_name, S.last_name,
    COALESCE(AVG(P.amount), 0) AS average_payment
FROM Students AS S
LEFT JOIN Payments AS P ON S.student_id = P.student_id
GROUP BY S.student_id, S.first_name, S.last_name;

