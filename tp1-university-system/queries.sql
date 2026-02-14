-- ============================================
-- TP1: 30 SQL Queries to Solve
-- University Management System
-- ============================================
-- INSTRUCTIONS: Write your SQL query below each question
-- Test your queries before submitting!
-- ============================================

-- ========== PART 1: BASIC QUERIES (Q1-Q5) ==========

-- Q1. List all students with their main information (name, email, level)
-- Expected columns: last_name, first_name, email, level


-- Q2. Display all professors from the Computer Science department
-- Expected columns: last_name, first_name, email, specialization


-- Q3. Find all courses with more than 5 credits
-- Expected columns: course_code, course_name, credits


-- Q4. List students enrolled in L3 level
-- Expected columns: student_number, last_name, first_name, email


-- Q5. Display courses from semester 1
-- Expected columns: course_code, course_name, credits, semester


-- ========== PART 2: QUERIES WITH JOINS (Q6-Q10) ==========

-- Q6. Display all courses with the professor's name
-- Expected columns: course_code, course_name, professor_name (last + first)


-- Q7. List all enrollments with student name and course name
-- Expected columns: student_name, course_name, enrollment_date, status


-- Q8. Display students with their department name
-- Expected columns: student_name, department_name, level


-- Q9. List grades with student name, course name, and grade obtained
-- Expected columns: student_name, course_name, evaluation_type, grade


-- Q10. Display professors with the number of courses they teach
-- Expected columns: professor_name, number_of_courses


-- ========== PART 3: AGGREGATE FUNCTIONS (Q11-Q15) ==========

-- Q11. Calculate the overall average grade for each student
-- Expected columns: student_name, average_grade


-- Q12. Count the number of students per department
-- Expected columns: department_name, student_count


-- Q13. Calculate the total budget of all departments
-- Expected result: One row with total_budget


-- Q14. Find the total number of courses per department
-- Expected columns: department_name, course_count


-- Q15. Calculate the average salary of professors per department
-- Expected columns: department_name, average_salary


-- ========== PART 4: ADVANCED QUERIES (Q16-Q20) ==========

-- Q16. Find the top 3 students with the best averages
-- Expected columns: student_name, average_grade
-- Order by average_grade DESC, limit 3


-- Q17. List courses with no enrolled students
-- Expected columns: course_code, course_name


-- Q18. Display students who have passed all their courses (status = 'Passed')
-- Expected columns: student_name, passed_courses_count


-- Q19. Find professors who teach more than 2 courses
-- Expected columns: professor_name, courses_taught


-- Q20. List students enrolled in more than 2 courses
-- Expected columns: student_name, enrolled_courses_count


-- ========== PART 5: SUBQUERIES (Q21-Q25) ==========

-- Q21. Find students with an average higher than their department's average
-- Expected columns: student_name, student_avg, department_avg


-- Q22. List courses with more enrollments than the average number of enrollments
-- Expected columns: course_name, enrollment_count


-- Q23. Display professors from the department with the highest budget
-- Expected columns: professor_name, department_name, budget


-- Q24. Find students with no grades recorded
-- Expected columns: student_name, email


-- Q25. List departments with more students than the average
-- Expected columns: department_name, student_count


-- ========== PART 6: BUSINESS ANALYSIS (Q26-Q30) ==========

-- Q26. Calculate the pass rate per course (grades >= 10/20)
-- Expected columns: course_name, total_grades, passed_grades, pass_rate_percentage


-- Q27. Display student ranking by descending average
-- Expected columns: rank, student_name, average_grade


-- Q28. Generate a report card for student with student_id = 1
-- Expected columns: course_name, evaluation_type, grade, coefficient, weighted_grade


-- Q29. Calculate teaching load per professor (total credits taught)
-- Expected columns: professor_name, total_credits


-- Q30. Identify overloaded courses (enrollments > 80% of max capacity)
-- Expected columns: course_name, current_enrollments, max_capacity, percentage_full

