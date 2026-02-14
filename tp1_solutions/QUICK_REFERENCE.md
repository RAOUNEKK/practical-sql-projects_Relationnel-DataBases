# QUICK REFERENCE GUIDE - 30 SQL QUERIES

## 🔥 PART 1: BASIC QUERIES (Q1-Q5)

### Q1: List All Students
```sql
SELECT last_name, first_name, email, level FROM students;
```
**Explanation:** Simple SELECT with multiple columns. Returns all student records.

---

### Q2: Computer Science Professors
```sql
SELECT p.last_name, p.first_name, p.email, p.specialization
FROM professors p
INNER JOIN departments d ON p.department_id = d.department_id
WHERE d.department_name = 'Computer Science';
```
**Explanation:** JOIN professors with departments, filter by department name.

---

### Q3: Courses with More Than 5 Credits
```sql
SELECT course_code, course_name, credits FROM courses WHERE credits > 5;
```
**Explanation:** Simple filter using WHERE with comparison operator.

---

### Q4: L3 Level Students
```sql
SELECT student_number, last_name, first_name, email FROM students WHERE level = 'L3';
```
**Explanation:** Filter by exact string match on level column.

---

### Q5: Semester 1 Courses
```sql
SELECT course_code, course_name, credits, semester FROM courses WHERE semester = 1;
```
**Explanation:** Filter by numeric value (semester 1).

---

## 🔗 PART 2: QUERIES WITH JOINS (Q6-Q10)

### Q6: Courses with Professor Names
```sql
SELECT c.course_code, c.course_name, CONCAT(p.last_name, ' ', p.first_name) AS professor_name
FROM courses c
INNER JOIN professors p ON c.professor_id = p.professor_id;
```
**Explanation:** INNER JOIN to link courses with professors. CONCAT combines first and last names.

---

### Q7: All Enrollments Details
```sql
SELECT CONCAT(s.last_name, ' ', s.first_name) AS student_name,
       c.course_name, e.enrollment_date, e.status
FROM enrollments e
INNER JOIN students s ON e.student_id = s.student_id
INNER JOIN courses c ON e.course_id = c.course_id;
```
**Explanation:** Two INNER JOINs to connect enrollments with both students and courses.

---

### Q8: Students with Department Names
```sql
SELECT CONCAT(s.last_name, ' ', s.first_name) AS student_name,
       d.department_name, s.level
FROM students s
INNER JOIN departments d ON s.department_id = d.department_id;
```
**Explanation:** JOIN students with departments to show department name.

---

### Q9: Grades with Full Details
```sql
SELECT CONCAT(s.last_name, ' ', s.first_name) AS student_name,
       c.course_name, g.evaluation_type, g.grade
FROM grades g
INNER JOIN students s ON g.student_id = s.student_id
INNER JOIN courses c ON g.course_id = c.course_id;
```
**Explanation:** Two JOINs to show student name, course name, and grade details.

---

### Q10: Professor Course Count
```sql
SELECT CONCAT(p.last_name, ' ', p.first_name) AS professor_name,
       COUNT(c.course_id) AS number_of_courses
FROM professors p
LEFT JOIN courses c ON p.professor_id = c.professor_id
GROUP BY p.professor_id, p.last_name, p.first_name;
```
**Explanation:** LEFT JOIN (includes professors with 0 courses) + GROUP BY + COUNT.

---

## 📊 PART 3: AGGREGATE FUNCTIONS (Q11-Q15)

### Q11: Student Average Grades
```sql
SELECT CONCAT(s.last_name, ' ', s.first_name) AS student_name,
       ROUND(AVG(g.grade), 2) AS average_grade
FROM students s
INNER JOIN grades g ON s.student_id = g.student_id
GROUP BY s.student_id, s.last_name, s.first_name;
```
**Explanation:** GROUP BY student, calculate AVG of all their grades, ROUND to 2 decimals.

---

### Q12: Students Per Department
```sql
SELECT d.department_name, COUNT(s.student_id) AS student_count
FROM departments d
LEFT JOIN students s ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name;
```
**Explanation:** LEFT JOIN (includes departments with 0 students) + COUNT.

---

### Q13: Total Budget
```sql
SELECT SUM(budget) AS total_budget FROM departments;
```
**Explanation:** Simple SUM aggregation across all departments.

---

### Q14: Courses Per Department
```sql
SELECT d.department_name, COUNT(c.course_id) AS course_count
FROM departments d
LEFT JOIN courses c ON d.department_id = c.department_id
GROUP BY d.department_id, d.department_name;
```
**Explanation:** Similar to Q12 but counting courses instead of students.

---

### Q15: Average Salary Per Department
```sql
SELECT d.department_name, ROUND(AVG(p.salary), 2) AS average_salary
FROM departments d
LEFT JOIN professors p ON d.department_id = p.department_id
GROUP BY d.department_id, d.department_name;
```
**Explanation:** GROUP BY department, calculate AVG salary.

---

## 🎯 PART 4: ADVANCED QUERIES (Q16-Q20)

### Q16: Top 3 Students
```sql
SELECT CONCAT(s.last_name, ' ', s.first_name) AS student_name,
       ROUND(AVG(g.grade), 2) AS average_grade
FROM students s
INNER JOIN grades g ON s.student_id = g.student_id
GROUP BY s.student_id, s.last_name, s.first_name
ORDER BY average_grade DESC
LIMIT 3;
```
**Explanation:** Calculate averages, ORDER BY descending, LIMIT to top 3.

---

### Q17: Courses with No Enrollments
```sql
SELECT c.course_code, c.course_name
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
WHERE e.enrollment_id IS NULL;
```
**Explanation:** LEFT JOIN courses to enrollments, filter for NULL (no matches).

---

### Q18: Students Who Passed Everything
```sql
SELECT CONCAT(s.last_name, ' ', s.first_name) AS student_name,
       COUNT(e.enrollment_id) AS passed_courses_count
FROM students s
INNER JOIN enrollments e ON s.student_id = e.student_id
WHERE e.status = 'Passed'
GROUP BY s.student_id, s.last_name, s.first_name
HAVING COUNT(e.enrollment_id) = (
    SELECT COUNT(*) FROM enrollments e2 WHERE e2.student_id = s.student_id
);
```
**Explanation:** Count passed enrollments, compare to total enrollments in HAVING clause.

---

### Q19: Professors Teaching 3+ Courses
```sql
SELECT CONCAT(p.last_name, ' ', p.first_name) AS professor_name,
       COUNT(c.course_id) AS courses_taught
FROM professors p
INNER JOIN courses c ON p.professor_id = c.professor_id
GROUP BY p.professor_id, p.last_name, p.first_name
HAVING COUNT(c.course_id) > 2;
```
**Explanation:** GROUP BY professor, use HAVING to filter aggregated count.

---

### Q20: Students in 3+ Courses
```sql
SELECT CONCAT(s.last_name, ' ', s.first_name) AS student_name,
       COUNT(e.enrollment_id) AS enrolled_courses_count
FROM students s
INNER JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.last_name, s.first_name
HAVING COUNT(e.enrollment_id) > 2;
```
**Explanation:** Similar to Q19 but for students and enrollments.

---

## 🧠 PART 5: SUBQUERIES (Q21-Q25)

### Q21: Students Above Department Average
```sql
SELECT CONCAT(s.last_name, ' ', s.first_name) AS student_name,
       ROUND(AVG(g.grade), 2) AS student_avg,
       (SELECT ROUND(AVG(g2.grade), 2)
        FROM grades g2
        INNER JOIN students s2 ON g2.student_id = s2.student_id
        WHERE s2.department_id = s.department_id) AS department_avg
FROM students s
INNER JOIN grades g ON s.student_id = g.student_id
GROUP BY s.student_id, s.last_name, s.first_name, s.department_id
HAVING AVG(g.grade) > (
    SELECT AVG(g2.grade)
    FROM grades g2
    INNER JOIN students s2 ON g2.student_id = s2.student_id
    WHERE s2.department_id = s.department_id
);
```
**Explanation:** Correlated subquery calculates department average, HAVING compares student avg.

---

### Q22: Courses Above Average Enrollment
```sql
SELECT c.course_name, COUNT(e.enrollment_id) AS enrollment_count
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
);
```
**Explanation:** Subquery calculates average enrollment count, HAVING filters courses above it.

---

### Q23: Professors from Highest Budget Department
```sql
SELECT CONCAT(p.last_name, ' ', p.first_name) AS professor_name,
       d.department_name, d.budget
FROM professors p
INNER JOIN departments d ON p.department_id = d.department_id
WHERE d.budget = (SELECT MAX(budget) FROM departments);
```
**Explanation:** Subquery finds MAX budget, WHERE filters for that value.

---

### Q24: Students with No Grades
```sql
SELECT CONCAT(s.last_name, ' ', s.first_name) AS student_name, s.email
FROM students s
LEFT JOIN grades g ON s.student_id = g.student_id
WHERE g.grade_id IS NULL;
```
**Explanation:** LEFT JOIN students to grades, filter for NULL (no grades recorded).

---

### Q25: Departments Above Average Student Count
```sql
SELECT d.department_name, COUNT(s.student_id) AS student_count
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
);
```
**Explanation:** Subquery calculates average student count per department, HAVING filters.

---

## 💼 PART 6: BUSINESS ANALYSIS (Q26-Q30)

### Q26: Pass Rate Per Course
```sql
SELECT c.course_name,
       COUNT(g.grade_id) AS total_grades,
       SUM(CASE WHEN g.grade >= 10 THEN 1 ELSE 0 END) AS passed_grades,
       ROUND((SUM(CASE WHEN g.grade >= 10 THEN 1 ELSE 0 END) * 100.0) / COUNT(g.grade_id), 2) AS pass_rate_percentage
FROM courses c
INNER JOIN grades g ON c.course_id = g.course_id
GROUP BY c.course_id, c.course_name;
```
**Explanation:** CASE WHEN counts passing grades (>=10), calculate percentage.

---

### Q27: Student Ranking
```sql
SELECT RANK() OVER (ORDER BY AVG(g.grade) DESC) AS rank,
       CONCAT(s.last_name, ' ', s.first_name) AS student_name,
       ROUND(AVG(g.grade), 2) AS average_grade
FROM students s
INNER JOIN grades g ON s.student_id = g.student_id
GROUP BY s.student_id, s.last_name, s.first_name;
```
**Explanation:** Window function RANK() assigns ranking based on average grade.

---

### Q28: Student Report Card (student_id = 1)
```sql
SELECT c.course_name, g.evaluation_type, g.grade, g.coefficient,
       ROUND(g.grade * g.coefficient, 2) AS weighted_grade
FROM grades g
INNER JOIN courses c ON g.course_id = c.course_id
WHERE g.student_id = 1;
```
**Explanation:** Filter for specific student, show all grades with weighted calculation.

---

### Q29: Professor Teaching Load
```sql
SELECT CONCAT(p.last_name, ' ', p.first_name) AS professor_name,
       COALESCE(SUM(c.credits), 0) AS total_credits
FROM professors p
LEFT JOIN courses c ON p.professor_id = c.professor_id
GROUP BY p.professor_id, p.last_name, p.first_name;
```
**Explanation:** SUM course credits per professor, COALESCE handles NULL for 0 courses.

---

### Q30: Overloaded Courses (>80% capacity)
```sql
SELECT c.course_name,
       COUNT(e.enrollment_id) AS current_enrollments,
       c.max_capacity,
       ROUND((COUNT(e.enrollment_id) * 100.0) / c.max_capacity, 2) AS percentage_full
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name, c.max_capacity
HAVING (COUNT(e.enrollment_id) * 100.0) / c.max_capacity > 80;
```
**Explanation:** Calculate percentage of capacity filled, HAVING filters >80%.

---
