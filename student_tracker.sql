
CREATE DATABASE student_tracker;

USE student_tracker;


CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE,
    gender VARCHAR(10),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address VARCHAR(255),
    admission_date DATE,
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
);


CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone_number VARCHAR(15),
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
);


CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    faculty_id INT,
    FOREIGN KEY (faculty_id)
        REFERENCES Faculty(faculty_id)
);


CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE,
    UNIQUE (student_id, course_id),
    FOREIGN KEY (student_id)
        REFERENCES Students(student_id),
    FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
);



CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    attendance_date DATE NOT NULL,
    status ENUM('Present', 'Absent', 'Late') NOT NULL,
    FOREIGN KEY (student_id)
        REFERENCES Students(student_id),
    FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
);



CREATE TABLE Grades (
    grade_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    marks_obtained DECIMAL(5,2),
    grade VARCHAR(5),
    FOREIGN KEY (student_id)
        REFERENCES Students(student_id),
    FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
);


SHOW TABLES;
+--------------------------+
| Tables_in_student_tracker|
+--------------------------+
| Attendance               |
| Courses                  |
| Departments              |
| Enrollments              |
| Faculty                  |
| Grades                   |
| Students                 |
+--------------------------+


INSERT INTO Departments
    (department_id, department_name)
VALUES
    (1, 'Computer Science'),
    (2, 'Information Technology'),
    (3, 'Mechanical');


SELECT * FROM Departments;
+---------------+------------------------+
| department_id | department_name        |
+---------------+------------------------+
|             1 | Computer Science       |
|             2 | Information Technology |
|             3 | Mechanical             |
+---------------+------------------------+


INSERT INTO Students
    (student_id, name, gender, email, department_id)
VALUES
    (101, 'Aarav Patel', 'Male', 'aarav@example.com', 1),
    (102, 'Diya Shah', 'Female', 'diya@example.com', 1),
    (103, 'Rohan Mehta', 'Male', 'rohan@example.com', 2),
    (104, 'Neha Joshi', 'Female', 'neha@example.com', 1),
    (105, 'Jay Shah', 'Male', 'jay@example.com', 3);


SELECT * FROM Students;
+------------+-------------+------+--------+-------------------+--------------+---------+----------------+---------------+
| student_id | name        | dob  | gender | email             | phone_number | address | admission_date | department_id |
+------------+-------------+------+--------+-------------------+--------------+---------+----------------+---------------+
|        101 | Aarav Patel | NULL | Male   | aarav@example.com | NULL         | NULL    | NULL           |             1 |
|        102 | Diya Shah   | NULL | Female | diya@example.com  | NULL         | NULL    | NULL           |             1 |
|        103 | Rohan Mehta | NULL | Male   | rohan@example.com | NULL         | NULL    | NULL           |             2 |
|        104 | Neha Joshi  | NULL | Female | neha@example.com  | NULL         | NULL    | NULL           |             1 |
|        105 | Jay Shah    | NULL | Male   | jay@example.com   | NULL         | NULL    | NULL           |             3 |
+------------+-------------+------+--------+-------------------+--------------+---------+----------------+---------------+


INSERT INTO Faculty
    (faculty_id, name, email, phone_number, department_id)
VALUES
    (1, 'Kiran Patel', 'kiran@example.com', '9876500001', 1),
    (2, 'Meena Shah', 'meena@example.com', '9876500002', 2),
    (3, 'Raj Mehta', 'raj@example.com', '9876500003', 3);

SELECT * FROM Faculty;
+------------+-------------+-------------------+--------------+---------------+
| faculty_id | name        | email             | phone_number | department_id |
+------------+-------------+-------------------+--------------+---------------+
|          1 | Kiran Patel | kiran@example.com | 9876500001   |             1 |
|          2 | Meena Shah  | meena@example.com | 9876500002   |             2 |
|          3 | Raj Mehta   | raj@example.com   | 9876500003   |             3 |
+------------+-------------+-------------------+--------------+---------------+


INSERT INTO Courses
    (course_id, course_name, faculty_id)
VALUES
    (1, 'Database Management', 1),
    (2, 'Python Programming', 1),
    (3, 'Computer Networks', 2),
    (4, 'Mechanical Engineering', 3);

SELECT * FROM Courses;
+-----------+------------------------+------------+
| course_id | course_name            | faculty_id |
+-----------+------------------------+------------+
|         1 | Database Management    |          1 |
|         2 | Python Programming     |          1 |
|         3 | Computer Networks      |          2 |
|         4 | Mechanical Engineering |          3 |
+-----------+------------------------+------------+


INSERT INTO Attendance
    (attendance_id, student_id, course_id, attendance_date, status)
VALUES
    (1, 101, 1, '2026-02-01', 'Present'),
    (2, 101, 1, '2026-02-02', 'Present'),
    (3, 101, 1, '2026-02-03', 'Absent'),
    (4, 102, 1, '2026-02-01', 'Present'),
    (5, 102, 1, '2026-02-02', 'Absent'),
    (6, 103, 3, '2026-02-01', 'Late'),
    (7, 104, 1, '2026-02-01', 'Present'),
    (8, 105, 4, '2026-02-01', 'Absent');


INSERT INTO Grades
    (grade_id, student_id, course_id, marks_obtained, grade)
VALUES
    (1, 101, 1, 95, 'A'),
    (2, 101, 2, 88, 'B'),
    (3, 102, 1, 76, 'B'),
    (4, 102, 2, 92, 'A'),
    (5, 103, 3, 45, 'F'),
    (6, 104, 1, 85, 'B'),
    (7, 105, 4, 65, 'C');

SELECT * FROM Students;
+------------+-------------+------+--------+-------------------+--------------+---------+----------------+---------------+
| student_id | name        | dob  | gender | email             | phone_number | address | admission_date | department_id |
+------------+-------------+------+--------+-------------------+--------------+---------+----------------+---------------+
|        101 | Aarav Patel | NULL | Male   | aarav@example.com | NULL         | NULL    | NULL           |             1 |
|        102 | Diya Shah   | NULL | Female | diya@example.com  | NULL         | NULL    | NULL           |             1 |
|        103 | Rohan Mehta | NULL | Male   | rohan@example.com | NULL         | NULL    | NULL           |             2 |
|        104 | Neha Joshi  | NULL | Female | neha@example.com  | NULL         | NULL    | NULL           |             1 |
|        105 | Jay Shah    | NULL | Male   | jay@example.com   | NULL         | NULL    | NULL           |             3 |
+------------+-------------+------+--------+-------------------+--------------+---------+----------------+---------------+

SELECT * FROM Faculty;
+------------+-------------+-------------------+--------------+---------------+
| faculty_id | name        | email             | phone_number | department_id |
+------------+-------------+-------------------+--------------+---------------+
|          1 | Kiran Patel | kiran@example.com | 9876500001   |             1 |
|          2 | Meena Shah  | meena@example.com | 9876500002   |             2 |
|          3 | Raj Mehta   | raj@example.com   | 9876500003   |             3 |
+------------+-------------+-------------------+--------------+---------------+

SELECT * FROM Courses;
+-----------+------------------------+------------+
| course_id | course_name            | faculty_id |
+-----------+------------------------+------------+
|         1 | Database Management    |          1 |
|         2 | Python Programming     |          1 |
|         3 | Computer Networks      |          2 |
|         4 | Mechanical Engineering |          3 |
+-----------+------------------------+------------+

SELECT * FROM Enrollments;
+---------------+------------+-----------+-----------------+
| enrollment_id | student_id | course_id | enrollment_date |
+---------------+------------+-----------+-----------------+
|             1 |        101 |         1 | 2026-01-10      |
|             2 |        101 |         2 | 2026-01-10      |
|             3 |        102 |         1 | 2026-01-11      |
|             4 |        103 |         3 | 2026-01-12      |
|             5 |        104 |         1 | 2026-01-13      |
|             6 |        105 |         4 | 2026-01-14      |
|             7 |        102 |         2 | 2026-01-15      |
+---------------+------------+-----------+-----------------+

SELECT * FROM Attendance;
+---------------+------------+-----------+-----------------+---------+
| attendance_id | student_id | course_id | attendance_date | status  |
+---------------+------------+-----------+-----------------+---------+
|             1 |        101 |         1 | 2026-02-01      | Present |
|             2 |        101 |         1 | 2026-02-02      | Present |
|             3 |        101 |         1 | 2026-02-03      | Absent  |
|             4 |        102 |         1 | 2026-02-01      | Present |
|             5 |        102 |         1 | 2026-02-02      | Absent  |
|             6 |        103 |         3 | 2026-02-01      | Late    |
|             7 |        104 |         1 | 2026-02-01      | Present |
|             8 |        105 |         4 | 2026-02-01      | Absent  |
+---------------+------------+-----------+-----------------+---------+

SELECT * FROM Grades;
+----------+------------+-----------+----------------+-------+
| grade_id | student_id | course_id | marks_obtained | grade |
+----------+------------+-----------+----------------+-------+
|        1 |        101 |         1 |          95.00 | A     |
|        2 |        101 |         2 |          88.00 | B     |
|        3 |        102 |         1 |          76.00 | B     |
|        4 |        102 |         2 |          92.00 | A     |
|        5 |        103 |         3 |          45.00 | F     |
|        6 |        104 |         1 |          85.00 | B     |
|        7 |        105 |         4 |          65.00 | C     |
+----------+------------+-----------+----------------+-------+


SELECT
    s.student_id,
    s.name,
    d.department_name
FROM Students s
INNER JOIN Departments d
    ON s.department_id = d.department_id
ORDER BY s.student_id;
+------------+-------------+------------------------+
| student_id | name        | department_name        |
+------------+-------------+------------------------+
|        101 | Aarav Patel | Computer Science       |
|        102 | Diya Shah   | Computer Science       |
|        103 | Rohan Mehta | Information Technology |
|        104 | Neha Joshi  | Computer Science       |
|        105 | Jay Shah    | Mechanical             |
+------------+-------------+------------------------+


SELECT
    s.student_id,
    s.name,
    d.department_name
FROM Students s
INNER JOIN Departments d
    ON s.department_id = d.department_id
ORDER BY s.student_id;
+------------+-------------+------------------------+
| student_id | name        | department_name        |
+------------+-------------+------------------------+
|        101 | Aarav Patel | Computer Science       |
|        102 | Diya Shah   | Computer Science       |
|        103 | Rohan Mehta | Information Technology |
|        104 | Neha Joshi  | Computer Science       |
|        105 | Jay Shah    | Mechanical             |
+------------+-------------+------------------------+


SELECT
    s.name,
    c.course_name,
    g.marks_obtained
FROM Students s
INNER JOIN Grades g
    ON s.student_id = g.student_id
INNER JOIN Courses c
    ON g.course_id = c.course_id
ORDER BY g.marks_obtained DESC
LIMIT 10;
+-------------+------------------------+----------------+
| name        | course_name            | marks_obtained |
+-------------+------------------------+----------------+
| Aarav Patel | Database Management    |          95.00 |
| Diya Shah   | Python Programming     |          92.00 |
| Aarav Patel | Python Programming     |          88.00 |
| Neha Joshi  | Database Management    |          85.00 |
| Diya Shah   | Database Management    |          76.00 |
| Jay Shah    | Mechanical Engineering |          65.00 |
| Rohan Mehta | Computer Networks      |          45.00 |
+-------------+------------------------+----------------+


SELECT
    s.name,
    COUNT(*) AS total_classes,
    SUM(CASE
        WHEN a.status = 'Present' THEN 1
        ELSE 0
    END) AS present_classes,
    ROUND(
        100.0 * SUM(
            CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END
        ) / COUNT(*), 2
    ) AS attendance_percentage
FROM Students s
INNER JOIN Attendance a
    ON s.student_id = a.student_id
GROUP BY s.student_id, s.name;
+-------------+---------------+-----------------+-----------------------+
| name        | total_classes | present_classes | attendance_percentage |
+-------------+---------------+-----------------+-----------------------+
| Aarav Patel |             3 |               2 |                 66.67 |
| Diya Shah   |             2 |               1 |                 50.00 |
| Rohan Mehta |             1 |               0 |                  0.00 |
| Neha Joshi  |             1 |               1 |                100.00 |
| Jay Shah    |             1 |               0 |                  0.00 |
+-------------+---------------+-----------------+-----------------------+


SELECT s.name, g.marks_obtained
FROM Students s
JOIN Grades g ON s.student_id = g.student_id
WHERE g.marks_obtained < 50;
+-------------+----------------+
| name        | marks_obtained |
+-------------+----------------+
| Rohan Mehta |          45.00 |
+-------------+----------------+

SELECT s.name, g.marks_obtained
FROM Students s
JOIN Grades g ON s.student_id = g.student_id
WHERE g.marks_obtained >= 90;
+-------------+----------------+
| name        | marks_obtained |
+-------------+----------------+
| Aarav Patel |          95.00 |
| Diya Shah   |          92.00 |
+-------------+----------------+


SELECT
    d.department_name,
    COUNT(s.student_id) AS total_students
FROM Departments d
LEFT JOIN Students s
    ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(s.student_id) >= 1;
+------------------------+----------------+
| department_name        | total_students |
+------------------------+----------------+
| Computer Science       |              3 |
| Information Technology |              1 |
| Mechanical             |              1 |
+------------------------+----------------+


SELECT
    AVG(marks_obtained) AS average_marks,
    MAX(marks_obtained) AS highest_marks,
    MIN(marks_obtained) AS lowest_marks,
    COUNT(*) AS total_records
FROM Grades;
+---------------+---------------+--------------+---------------+
| average_marks | highest_marks | lowest_marks | total_records |
+---------------+---------------+--------------+---------------+
|     78.000000 |         95.00 |        45.00 |             7 |
+---------------+---------------+--------------+---------------+


SELECT
    s.name,
    g.marks_obtained,
    CASE
        WHEN g.marks_obtained > 90 THEN 'Excellent'
        WHEN g.marks_obtained BETWEEN 75 AND 90 THEN 'Good'
        ELSE 'Needs Improvement'
    END AS performance_level
FROM Students s
JOIN Grades g ON s.student_id = g.student_id;
+-------------+----------------+-------------------+
| name        | marks_obtained | performance_level |
+-------------+----------------+-------------------+
| Aarav Patel |          95.00 | Excellent         |
| Aarav Patel |          88.00 | Good              |
| Diya Shah   |          76.00 | Good              |
| Diya Shah   |          92.00 | Excellent         |
| Rohan Mehta |          45.00 | Needs Improvement |
| Neha Joshi  |          85.00 | Good              |
| Jay Shah    |          65.00 | Needs Improvement |
+-------------+----------------+-------------------+


SELECT
    s.name,
    g.marks_obtained,
    RANK() OVER (
        ORDER BY g.marks_obtained DESC
    ) AS student_rank
FROM Students s
JOIN Grades g ON s.student_id = g.student_id;
+-------------+----------------+--------------+
| name        | marks_obtained | student_rank |
+-------------+----------------+--------------+
| Aarav Patel |          95.00 |            1 |
| Diya Shah   |          92.00 |            2 |
| Aarav Patel |          88.00 |            3 |
| Neha Joshi  |          85.00 |            4 |
| Diya Shah   |          76.00 |            5 |
| Jay Shah    |          65.00 |            6 |
| Rohan Mehta |          45.00 |            7 |
+-------------+----------------+--------------+


SELECT name
FROM Students
WHERE student_id IN (
    SELECT student_id
    FROM Grades
    WHERE marks_obtained > (
        SELECT AVG(marks_obtained)
        FROM Grades
    )
);
+-------------+
| name        |
+-------------+
| Aarav Patel |
| Diya Shah   |
| Neha Joshi  |
+-------------+


SELECT s.name, COUNT(*) AS absent_classes
FROM Students s
JOIN Attendance a
    ON s.student_id = a.student_id
WHERE a.status = 'Absent'
GROUP BY s.student_id, s.name
HAVING COUNT(*) > 10;



SELECT
    name,
    admission_date,
    TIMESTAMPDIFF(
        YEAR, admission_date, CURDATE()
    ) AS years_since_admission
FROM Students;
+-------------+----------------+-----------------------+
| name        | admission_date | years_since_admission |
+-------------+----------------+-----------------------+
| Aarav Patel | NULL           |                  NULL |
| Diya Shah   | NULL           |                  NULL |
| Rohan Mehta | NULL           |                  NULL |
| Neha Joshi  | NULL           |                  NULL |
| Jay Shah    | NULL           |                  NULL |
+-------------+----------------+-----------------------+\

SELECT
    attendance_date,
    MONTH(attendance_date) AS attendance_month,
    DATE_FORMAT(attendance_date, '%d-%m-%Y') AS formatted_date
FROM Attendance;
+-----------------+------------------+----------------+
| attendance_date | attendance_month | formatted_date |
+-----------------+------------------+----------------+
| 2026-02-01      |                2 | 01-02-2026     |
| 2026-02-02      |                2 | 02-02-2026     |
| 2026-02-03      |                2 | 03-02-2026     |
| 2026-02-01      |                2 | 01-02-2026     |
| 2026-02-02      |                2 | 02-02-2026     |
| 2026-02-01      |                2 | 01-02-2026     |
| 2026-02-01      |                2 | 01-02-2026     |
| 2026-02-01      |                2 | 01-02-2026     |
+-----------------+------------------+----------------+


SELECT UPPER(name) AS faculty_name
FROM Faculty;
+--------------+
| faculty_name |
+--------------+
| KIRAN PATEL  |
| MEENA SHAH   |
| RAJ MEHTA    |
+--------------+


SELECT
    name,
    COALESCE(email, 'Email Not Provided') AS email
FROM Students;
+-------------+-------------------+
| name        | email             |
+-------------+-------------------+
| Aarav Patel | aarav@example.com |
| Diya Shah   | diya@example.com  |
| Rohan Mehta | rohan@example.com |
| Neha Joshi  | neha@example.com  |
| Jay Shah    | jay@example.com   |
+-------------+-------------------+


SELECT s.student_id, s.name
FROM Students s
LEFT JOIN Enrollments e
    ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;



SELECT c.course_name, f.name AS faculty_name
FROM Faculty f
RIGHT JOIN Courses c
    ON f.faculty_id = c.faculty_id;
+------------------------+--------------+
| course_name            | faculty_name |
+------------------------+--------------+
| Database Management    | Kiran Patel  |
| Python Programming     | Kiran Patel  |
| Computer Networks      | Meena Shah   |
| Mechanical Engineering | Raj Mehta    |
+------------------------+--------------+

ALTER TABLE Faculty
ADD COLUMN experience_years INT DEFAULT 0;


UPDATE Faculty
SET experience_years = CASE faculty_id
    WHEN 1 THEN 6
    WHEN 2 THEN 3
    WHEN 3 THEN 8
    ELSE 0
END;

SELECT name, experience_years
FROM Faculty
WHERE experience_years >= 5;
+-------------+------------------+
| name        | experience_years |
+-------------+------------------+
| Kiran Patel |                6 |
| Raj Mehta   |                8 |
+-------------+------------------+

SELECT
    s.name,
    ROUND(
        100.0 * SUM(
            CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END
        ) / COUNT(*), 2
    ) AS attendance_percentage
FROM Students s
JOIN Attendance a
    ON s.student_id = a.student_id
GROUP BY s.student_id, s.name
HAVING attendance_percentage < 75;
+-------------+-----------------------+
| name        | attendance_percentage |
+-------------+-----------------------+
| Aarav Patel |                 66.67 |
| Diya Shah   |                 50.00 |
| Rohan Mehta |                  0.00 |
| Jay Shah    |                  0.00 |
+-------------+-----------------------+

SELECT
    enrollment_month,
    monthly_enrollments,
    SUM(monthly_enrollments) OVER (
        ORDER BY enrollment_month
    ) AS running_total
FROM (
    SELECT
        DATE_FORMAT(enrollment_date, '%Y-%m') AS enrollment_month,
        COUNT(*) AS monthly_enrollments
    FROM Enrollments
    GROUP BY DATE_FORMAT(enrollment_date, '%Y-%m')
) AS monthly_data;
+------------------+---------------------+---------------+
| enrollment_month | monthly_enrollments | running_total |
+------------------+---------------------+---------------+
| 2026-01          |                   7 |             7 |
+------------------+---------------------+---------------+

SELECT
    course_id,
    attendance_date,
    status,
    ROUND(
        100.0 * SUM(
            CASE WHEN status = 'Present' THEN 1 ELSE 0 END
        ) OVER (
            PARTITION BY course_id
            ORDER BY attendance_date, attendance_id
        ) / COUNT(*) OVER (
            PARTITION BY course_id
            ORDER BY attendance_date, attendance_id
        ), 2
    ) AS cumulative_attendance_percentage
FROM Attendance;
+-----------+-----------------+---------+----------------------------------+
| course_id | attendance_date | status  | cumulative_attendance_percentage |
+-----------+-----------------+---------+----------------------------------+
|         1 | 2026-02-01      | Present |                           100.00 |
|         1 | 2026-02-01      | Present |                           100.00 |
|         1 | 2026-02-01      | Present |                           100.00 |
|         1 | 2026-02-02      | Present |                           100.00 |
|         1 | 2026-02-02      | Absent  |                            80.00 |
|         1 | 2026-02-03      | Absent  |                            66.67 |
|         3 | 2026-02-01      | Late    |                             0.00 |
|         4 | 2026-02-01      | Absent  |                             0.00 |
+-----------+-----------------+---------+----------------------------------+



