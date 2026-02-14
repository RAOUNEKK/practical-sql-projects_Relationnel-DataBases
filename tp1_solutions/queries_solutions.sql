-- TP1: 30 SQL Queries to Solve
-- University Management System
-- ============================================
-- INSTRUCTIONS: Write your SQL query below each question
-- Test your queries before submitting!
-- ============================================

-- ========== PART 1: BASIC QUERIES (Q1-Q5) ==========

-- Q1. List all students with their main information (name, email, level)
-- Expected columns: last_name, first_name, email, level

SELECT last_name, first_name, email, level
FROM students
ORDER BY last_name, first_name;


-- Q2. Display all professors from the Computer Science department
-- Expected columns: last_name, first_name, email, specialization

SELECT p.last_name, p.first_name, p.email, p.specialization
FROM professors p
INNER JOIN departments d ON p.department_id = d.department_id
WHERE d.department_name = 'Informatique' 
ORDER BY p.last_name, p.first_name;

-- Q3. Find all courses with more than 5 credits
-- Expected columns: course_code, course_name, credits

SELECT course_code, course_name, credits
FROM courses
WHERE credits > 5
ORDER BY credits DESC, course_code;


-- Q4. List students enrolled in L3 level
-- Expected columns: student_number, last_name, first_name, email

SELECT matricule, last_name, first_name, email
FROM students
WHERE level = 'L3' 
ORDER BY last_name, first_name;


-- Q5. Display courses from semester 1
-- Expected columns: course_code, course_name, credits, semester

SELECT course_code, course_name, credits, semester
FROM courses
WHERE semester = 1
ORDER BY course_code;


-- ========== PART 2: QUERIES WITH JOINS (Q6-Q10) ==========

-- Q6. Display all courses with the professor's name
-- Expected columns: course_code, course_name, professor_name (last + first)

SELECT 
    c.course_code,
    c.course_name,
    CONCAT(p.last_name, ' ', p.first_name) AS professor_name
FROM courses c
INNER JOIN professors p ON c.professor_id = p.professor_id
ORDER BY c.course_code;


-- Q7. List all enrollments with student name and course name
-- Expected columns: student_name, course_name, enrollment_date, status

SELECT 
    CONCAT(s.last_name, ' ', s.first_name) AS student_name,
    c.course_name,
    e.enrollment_date,
    e.status
FROM enrollments e
INNER JOIN students s ON e.student_id = s.student_id
INNER JOIN courses c ON e.course_id = c.course_id
ORDER BY e.enrollment_date DESC, student_name;


-- Q8. Display students with their department name
-- Expected columns: student_name, department_name, level

SELECT 
    CONCAT(s.last_name, ' ', s.first_name) AS student_name,
    d.department_name,
    s.level
FROM students s
INNER JOIN departments d ON s.department_id = d.department_id
ORDER BY d.department_name, s.level, student_name;


-- Q9. List grades with student name, course name, and grade obtained
-- Expected columns: student_name, course_name, evaluation_type, grade

SELECT 
    CONCAT(s.last_name, ' ', s.first_name) AS student_name,
    c.course_name,
    g.evaluation_type,
    g.grade
FROM grades g
INNER JOIN students s ON g.student_id = s.student_id
INNER JOIN courses c ON g.course_id = c.course_id
ORDER BY student_name, c.course_name, g.evaluation_date;


-- Q10. Display professors with the number of courses they teach
-- Expected columns: professor_name, number_of_courses

SELECT 
    CONCAT(p.last_name, ' ', p.first_name) AS professor_name,
    COUNT(c.course_id) AS number_of_courses
FROM professors p
LEFT JOIN courses c ON p.professor_id = c.professor_id
GROUP BY p.professor_id, p.last_name, p.first_name
ORDER BY number_of_courses DESC, professor_name;


-- ========== PART 3: AGGREGATE FUNCTIONS (Q11-Q15) ==========

-- Q11. Calculate the overall average grade for each student
-- Expected columns: student_name, average_grade

SELECT 
    CONCAT(s.last_name, ' ', s.first_name) AS student_name,
    ROUND(AVG(g.grade), 2) AS average_grade
FROM students s
INNER JOIN grades g ON s.student_id = g.student_id
GROUP BY s.student_id, s.last_name, s.first_name
ORDER BY average_grade DESC;


-- Q12. Count the number of students per department
-- Expected columns: department_name, student_count

SELECT 
    d.department_name,
    COUNT(s.student_id) AS student_count
FROM departments d
LEFT JOIN students s ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name
ORDER BY student_count DESC;


-- Q13. Calculate the total budget of all departments
-- Expected result: One row with total_budget

SELECT 
    SUM(budget) AS total_budget
FROM departments;


-- Q14. Find the total number of courses per department
-- Expected columns: department_name, course_count

SELECT 
    d.department_name,
    COUNT(c.course_id) AS course_count
FROM departments d
LEFT JOIN courses c ON d.department_id = c.department_id
GROUP BY d.department_id, d.department_name
ORDER BY course_count DESC;


-- Q15. Calculate the average salary of professors per department
-- Expected columns: department_name, average_salary

SELECT d.department_name, 
       ROUND(AVG(p.salary), 2) AS average_salary
FROM departments d
LEFT JOIN professors p ON d.department_id = p.department_id
GROUP BY d.department_id, d.department_name
ORDER BY average_salary DESC;


-- ========== PART 4: ADVANCED QUERIES (Q16-Q20) ==========

-- Q16. Find the top 3 students with the best averages
-- Expected columns: student_name, average_grade
-- Order by average_grade DESC, limit 3

SELECT 
    CONCAT(s.last_name, ' ', s.first_name) AS student_name,
    ROUND(AVG(g.grade), 2) AS average_grade
FROM students s
INNER JOIN grades g ON s.student_id = g.student_id
GROUP BY s.student_id, s.last_name, s.first_name
ORDER BY average_grade DESC
LIMIT 3;


-- Q17. List courses with no enrolled students
-- Expected columns: course_code, course_name

SELECT 
    c.course_code,
    c.course_name
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
WHERE e.enrollment_id IS NULL
ORDER BY c.course_code;


-- Q18. Display students who have passed all their courses (status = 'Passed')
-- Expected columns: student_name, passed_courses_count

SELECT 
    CONCAT(s.last_name, ' ', s.first_name) AS student_name,
    COUNT(e.enrollment_id) AS passed_courses_count
FROM students s
INNER JOIN enrollments e ON s.student_id = e.student_id
WHERE e.status = 'Passed'
GROUP BY s.student_id, s.last_name, s.first_name
HAVING COUNT(e.enrollment_id) = (
    SELECT COUNT(*)
    FROM enrollments e2
    WHERE e2.student_id = s.student_id
)
ORDER BY passed_courses_count DESC;


-- Q19. Find professors who teach more than 2 courses
-- Expected columns: professor_name, courses_taught

SELECT 
    CONCAT(p.last_name, ' ', p.first_name) AS professor_name,
    COUNT(c.course_id) AS courses_taught
FROM professors p
INNER JOIN courses c ON p.professor_id = c.professor_id
GROUP BY p.professor_id, p.last_name, p.first_name
HAVING COUNT(c.course_id) > 2
ORDER BY courses_taught DESC;


-- Q20. List students enrolled in more than 2 courses
-- Expected columns: student_name, enrolled_courses_count

SELECT 
    CONCAT(s.last_name, ' ', s.first_name) AS student_name,
    COUNT(e.enrollment_id) AS enrolled_courses_count
FROM students s
INNER JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.last_name, s.first_name
HAVING COUNT(e.enrollment_id) > 2
ORDER BY enrolled_courses_count DESC;


-- ========== PART 5: SUBQUERIES (Q21-Q25) ==========

-- Q21. Find students with an average higher than their department's average
-- Expected columns: student_name, student_avg, department_avg

SELECT 
    CONCAT(s.last_name, ' ', s.first_name) AS student_name,
    ROUND(AVG(g.grade), 2) AS student_avg,
    (
        SELECT ROUND(AVG(g2.grade), 2)
        FROM grades g2
        INNER JOIN students s2 ON g2.student_id = s2.student_id
        WHERE s2.department_id = s.department_id
    ) AS department_avg
FROM students s
INNER JOIN grades g ON s.student_id = g.student_id
GROUP BY s.student_id, s.last_name, s.first_name, s.department_id
HAVING AVG(g.grade) > (
    SELECT AVG(g2.grade)
    FROM grades g2
    INNER JOIN students s2 ON g2.student_id = s2.student_id
    WHERE s2.department_id = s.department_id
)
ORDER BY student_avg DESC;


-- Q22. List courses with more enrollments than the average number of enrollments
-- Expected columns: course_name, enrollment_count

SELECT 
    c.course_name,
    COUNT(e.enrollment_id) AS enrollment_count
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
HAVING COUNT(e.enrollment_id) > (
    SELECT AVG(enrollment_count)
    FROM (
        SELECT COUNT(e2.enrollment_id) AS enrollment_count
        FROM courses c2
        LEFT JOIN enrollments e2 ON c2.course_id = e2.course_id
        GROUP BY c2.course_id
    ) AS avg_enrollments
)
ORDER BY enrollment_count DESC;


-- Q23. Display professors from the department with the highest budget
-- Expected columns: professor_name, department_name, budget

SELECT 
    CONCAT(p.last_name, ' ', p.first_name) AS professor_name,
    d.department_name,
    d.budget
FROM professors p
INNER JOIN departments d ON p.department_id = d.department_id
WHERE d.budget = (
    SELECT MAX(budget)
    FROM departments
)
ORDER BY professor_name;


-- Q24. Find students with no grades recorded
-- Expected columns: student_name, email

SELECT 
    CONCAT(s.last_name, ' ', s.first_name) AS student_name,
    s.email
FROM students s
LEFT JOIN grades g ON s.student_id = g.student_id
WHERE g.grade_id IS NULL
ORDER BY student_name;


-- Q25. List departments with more students than the average
-- Expected columns: department_name, student_count

SELECT 
    d.department_name,
    COUNT(s.student_id) AS student_count
FROM departments d
LEFT JOIN students s ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(s.student_id) > (
    SELECT AVG(student_count)
    FROM (
        SELECT COUNT(s2.student_id) AS student_count
        FROM departments d2
        LEFT JOIN students s2 ON d2.department_id = s2.department_id
        GROUP BY d2.department_id
    ) AS avg_students
)
ORDER BY student_count DESC;


-- ========== PART 6: BUSINESS ANALYSIS (Q26-Q30) ==========

-- Q26. Calculate the pass rate per course (grades >= 10/20)
-- Expected columns: course_name, total_grades, passed_grades, pass_rate_percentage

SELECT 
    c.course_name,
    COUNT(g.grade_id) AS total_grades,
    SUM(CASE WHEN g.grade >= 10 THEN 1 ELSE 0 END) AS passed_grades,
    ROUND(
        (SUM(CASE WHEN g.grade >= 10 THEN 1 ELSE 0 END) * 100.0) / COUNT(g.grade_id),
        2
    ) AS pass_rate_percentage
FROM courses c
INNER JOIN grades g ON c.course_id = g.course_id
GROUP BY c.course_id, c.course_name
ORDER BY pass_rate_percentage DESC;


-- Q27. Display student ranking by descending average
-- Expected columns: rank, student_name, average_grade

SET @student_pos := 0;

SELECT 
    (@student_pos := @student_pos + 1) AS student_position, 
    t.student_full_name, 
    t.average_grade
FROM (
    SELECT 
        CONCAT(s.last_name, ' ', s.first_name) AS student_full_name,
        ROUND(AVG(g.grade), 2) AS average_grade
    FROM students s
    INNER JOIN grades g ON s.student_id = g.student_id
    GROUP BY s.student_id, s.last_name, s.first_name
    ORDER BY average_grade DESC
) AS t;

-- Q28. Generate a report card for student with student_id = 1
-- Expected columns: course_name, evaluation_type, grade, coefficient, weighted_grade

SELECT 
    c.course_name,
    g.evaluation_type,
    g.grade,
    g.coefficient,
    ROUND(g.grade * g.coefficient, 2) AS weighted_grade
FROM grades g
INNER JOIN courses c ON g.course_id = c.course_id
WHERE g.student_id = 1
ORDER BY c.course_name, g.evaluation_date;


-- Q29. Calculate teaching load per professor (total credits taught)
-- Expected columns: professor_name, total_credits

SELECT 
    CONCAT(p.last_name, ' ', p.first_name) AS professor_name,
    COALESCE(SUM(c.credits), 0) AS total_credits
FROM professors p
LEFT JOIN courses c ON p.professor_id = c.professor_id
GROUP BY p.professor_id, p.last_name, p.first_name
ORDER BY total_credits DESC;


-- Q30. Identify overloaded courses (enrollments > 80% of max capacity)
-- Expected columns: course_name, current_enrollments, max_capacity, percentage_full

SELECT 
    c.course_name,
    COUNT(e.enrollment_id) AS current_enrollments,
    c.max_capacity,
    ROUND(
        (COUNT(e.enrollment_id) * 100.0) / c.max_capacity,
        2
    ) AS percentage_full
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name, c.max_capacity
HAVING (COUNT(e.enrollment_id) * 100.0) / c.max_capacity > 80
ORDER BY percentage_full DESC;
