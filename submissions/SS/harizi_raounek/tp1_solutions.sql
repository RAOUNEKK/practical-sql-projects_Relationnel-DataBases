- Créer et utiliser la base de données
CREATE DATABASE IF NOT EXISTS university_db;
USE university_db;

-- ============================================
-- 1: SUPPRIMER LES TABLES EXISTANTES
-- ============================================

DROP TABLE IF EXISTS grades;
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS professors;
DROP TABLE IF EXISTS departments;

-- ============================================
-- 2: CRÉER LES TABLES
-- ============================================

CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    budget DECIMAL(12, 2) NOT NULL COMMENT 'Budget annuel en DZD',
    building VARCHAR(50),
    created_date DATE DEFAULT (CURRENT_DATE)
);

CREATE TABLE professors (
    professor_id INT PRIMARY KEY AUTO_INCREMENT,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    specialization VARCHAR(100),
    department_id INT,
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    matricule VARCHAR(20) UNIQUE NOT NULL COMMENT 'Numéro d\'inscription',
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    level VARCHAR(10) NOT NULL COMMENT 'L1, L2, L3, M1, M2',
    department_id INT,
    enrollment_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    semester INT NOT NULL,
    max_capacity INT DEFAULT 50,
    department_id INT,
    professor_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (professor_id) REFERENCES professors(professor_id)
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    status VARCHAR(20) DEFAULT 'Active',
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    UNIQUE KEY unique_enrollment (student_id, course_id)
);

CREATE TABLE grades (
    grade_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    evaluation_type VARCHAR(50) COMMENT 'Contrôle, Examen, TP, TD',
    grade DECIMAL(5, 2) COMMENT 'Note sur 20',
    coefficient DECIMAL(3, 2) DEFAULT 1.0,
    evaluation_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- ============================================
-- 3: CRÉER LES INDEX
-- ============================================

CREATE INDEX idx_student_department ON students(department_id);
CREATE INDEX idx_professor_department ON professors(department_id);
CREATE INDEX idx_course_department ON courses(department_id);
CREATE INDEX idx_course_professor ON courses(professor_id);
CREATE INDEX idx_enrollment_student ON enrollments(student_id);
CREATE INDEX idx_enrollment_course ON enrollments(course_id);
CREATE INDEX idx_grade_student ON grades(student_id);
CREATE INDEX idx_grade_course ON grades(course_id);

-- ============================================
--  4: INSÉRER LES DONNÉES
-- ============================================

-- Départements
INSERT INTO departments (department_name, budget, building) VALUES
('Informatique', 8500000.00, 'Bâtiment A'),
('Mathématiques', 6200000.00, 'Bâtiment B'),
('Physique', 7800000.00, 'Bâtiment C'),
('Gestion', 7000000.00, 'Bâtiment D'),
('Génie Électrique', 9500000.00, 'Bâtiment E');

-- Professeurs
INSERT INTO professors (last_name, first_name, email, specialization, department_id, hire_date) VALUES
('Benabdallah', 'Karim', 'k.benabdallah@univ.dz', 'Algorithmique', 1, '2015-09-01'),
('Bouziane', 'Amina', 'a.bouziane@univ.dz', 'Bases de Données', 1, '2016-09-01'),
('Hamidi', 'Rachid', 'r.hamidi@univ.dz', 'Intelligence Artificielle', 1, '2014-09-01'),
('Khelifi', 'Nadia', 'n.khelifi@univ.dz', 'Réseaux Informatiques', 1, '2017-09-01'),
('Mansouri', 'Ahmed', 'a.mansouri@univ.dz', 'Analyse Mathématique', 2, '2013-09-01'),
('Boudjema', 'Farida', 'f.boudjema@univ.dz', 'Statistiques', 2, '2015-09-01'),
('Larbi', 'Youcef', 'y.larbi@univ.dz', 'Algèbre Linéaire', 2, '2016-09-01'),
('Sebaihi', 'Mohamed', 'm.sebaihi@univ.dz', 'Physique Quantique', 3, '2014-09-01'),
('Meziani', 'Soraya', 's.meziani@univ.dz', 'Thermodynamique', 3, '2015-09-01'),
('Benmohamed', 'Hicham', 'h.benmohamed@univ.dz', 'Marketing', 4, '2016-09-01'),
('Sahraoui', 'Leila', 'l.sahraoui@univ.dz', 'Finance', 4, '2014-09-01'),
('Messaoud', 'Djamel', 'd.messaoud@univ.dz', 'Électronique', 5, '2013-09-01'),
('Boumediene', 'Samia', 's.boumediene@univ.dz', 'Circuits Électriques', 5, '2015-09-01');

-- Étudiants 
INSERT INTO students (matricule, last_name, first_name, email, level, department_id, enrollment_date) VALUES
('232332029109', 'Abadelia', 'Mohammed Imad Eddine', 'abadelia.mohammed@esi.dz', 'L3', 1, '2022-09-01'),
('222232026818', 'Abbaci', 'Ilham', 'abbaci.ilham@esi.dz', 'L3', 1, '2022-09-01'),
('232337625201', 'Abid', 'Saadia', 'abid.saadia@esi.dz', 'L2', 1, '2023-09-01'),
('202235074304', 'Abida', 'Hiba', 'abida.hiba@esi.dz', 'L2', 1, '2023-09-01'),
('232335393407', 'Adjal', 'Anes', 'adjal.anes@esi.dz', 'L1', 1, '2024-09-01'),
('232335548206', 'Ahdibi', 'Khanssa', 'ahdibi.khanssa@esi.dz', 'L1', 1, '2024-09-01'),
('222235333913', 'Ait Fella', 'Anissa', 'aitfella.anissa@esi.dz', 'L3', 2, '2022-09-01'),
('232337189812', 'Ali Abderrahmane', 'Fiche', 'ali.fiche@esi.dz', 'L3', 2, '2022-09-01'),
('212132079046', 'Alili', 'Khadidja', 'alili.khadidja@esi.dz', 'L2', 2, '2023-09-01'),
('222239026513', 'Aouya', 'Oussama Abdelhadi', 'aouya.oussama@esi.dz', 'L1', 2, '2024-09-01'),
('232335236909', 'Badsi', 'Chaima', 'badsi.chaima@esi.dz', 'L3', 3, '2022-09-01'),
('232337137506', 'Baghdadi', 'Ichrak Malek', 'baghdadi.ichrak@esi.dz', 'L2', 3, '2023-09-01'),
('232331633501', 'Bahi', 'Adem Abderrahim', 'bahi.adem@esi.dz', 'L1', 3, '2024-09-01'),
('222236328602', 'Bechiche', 'Toufik', 'bechiche.toufik@esi.dz', 'L3', 4, '2022-09-01'),
('232333201103', 'Bedrane', 'Sid Ali', 'bedrane.sidali@esi.dz', 'L2', 4, '2023-09-01'),
('222238502208', 'Bekki', 'Mustapha Aimen', 'bekki.mustapha@esi.dz', 'L1', 4, '2024-09-01'),
('232331551514', 'Belaidi', 'Walid', 'belaidi.walid@esi.dz', 'L3', 5, '2022-09-01'),
('202234440605', 'Belaiouar', 'Abderraouf', 'belaiouar.abderraouf@esi.dz', 'L2', 5, '2023-09-01'),
('232332349307', 'Belfaci', 'Younes', 'belfaci.younes@esi.dz', 'L1', 5, '2024-09-01'),
('232332226014', 'Belghait', 'Mohamed', 'belghait.mohamed@esi.dz', 'L1', 5, '2024-09-01');

-- Cours
INSERT INTO courses (course_code, course_name, credits, semester, max_capacity, department_id, professor_id) VALUES
('INF101', 'Introduction à la Programmation', 6, 1, 50, 1, 1),
('INF201', 'Structures de Données', 6, 1, 40, 1, 1),
('INF202', 'Systèmes de Bases de Données', 7, 2, 40, 1, 2),
('INF301', 'Algorithmique Avancée', 6, 1, 30, 1, 1),
('INF302', 'Apprentissage Automatique', 7, 2, 30, 1, 3),
('INF303', 'Réseaux Informatiques', 5, 1, 35, 1, 4),
('MATH101', 'Analyse I', 6, 1, 60, 2, 5),
('MATH102', 'Analyse II', 6, 2, 50, 2, 5),
('MATH201', 'Algèbre Linéaire', 6, 1, 45, 2, 7),
('MATH202', 'Probabilités et Statistiques', 5, 2, 40, 2, 6),
('MATH301', 'Analyse Avancée', 7, 1, 30, 2, 5),
('PHY101', 'Physique I', 6, 1, 50, 3, 8),
('PHY201', 'Mécanique Quantique', 7, 2, 35, 3, 8),
('PHY202', 'Thermodynamique', 6, 1, 35, 3, 9),
('GEST101', 'Introduction à la Gestion', 4, 1, 60, 4, 10),
('GEST201', 'Principes de Marketing', 5, 1, 45, 4, 10),
('GEST202', 'Gestion Financière', 6, 2, 40, 4, 11),
('GELEC101', 'Fondamentaux du Génie Électrique', 6, 1, 50, 5, 12),
('GELEC201', 'Conception Électrique', 7, 2, 40, 5, 12),
('GELEC202', 'Circuits Électriques', 7, 1, 40, 5, 13);

-- Inscriptions
INSERT INTO enrollments (student_id, course_id, enrollment_date, status) VALUES
(1, 4, '2024-09-01', 'Passed'), (1, 5, '2024-09-01', 'Passed'), (1, 6, '2024-09-01', 'Passed'),
(2, 4, '2024-09-01', 'Passed'), (2, 5, '2024-09-01', 'Failed'), (2, 6, '2024-09-01', 'Passed'),
(3, 2, '2024-09-01', 'Passed'), (3, 3, '2024-09-01', 'Passed'), (3, 6, '2024-09-01', 'Active'),
(4, 2, '2024-09-01', 'Passed'), (4, 3, '2024-09-01', 'Passed'),
(5, 1, '2024-09-01', 'Active'), (5, 7, '2024-09-01', 'Active'),
(6, 1, '2024-09-01', 'Active'), (6, 7, '2024-09-01', 'Active'),
(7, 11, '2024-09-01', 'Passed'), (7, 9, '2024-09-01', 'Passed'), (7, 10, '2024-09-01', 'Passed'),
(8, 11, '2024-09-01', 'Passed'), (8, 9, '2024-09-01', 'Passed'),
(9, 8, '2024-09-01', 'Passed'), (9, 9, '2024-09-01', 'Active'), (9, 10, '2024-09-01', 'Active'),
(10, 7, '2024-09-01', 'Active'),
(11, 13, '2024-09-01', 'Passed'), (11, 14, '2024-09-01', 'Passed'),
(12, 12, '2024-09-01', 'Active'), (12, 14, '2024-09-01', 'Active'),
(13, 12, '2024-09-01', 'Active'),
(14, 16, '2024-09-01', 'Passed'), (14, 17, '2024-09-01', 'Passed'), (14, 15, '2024-09-01', 'Passed'),
(15, 15, '2024-09-01', 'Active'), (15, 16, '2024-09-01', 'Active'),
(16, 15, '2024-09-01', 'Active'),
(17, 19, '2024-09-01', 'Passed'), (17, 20, '2024-09-01', 'Passed'),
(18, 18, '2024-09-01', 'Active'), (18, 20, '2024-09-01', 'Active'),
(19, 18, '2024-09-01', 'Active'),
(20, 18, '2024-09-01', 'Active');

-- Notes 
INSERT INTO grades (student_id, course_id, evaluation_type, grade, coefficient, evaluation_date) VALUES
(1, 4, 'Contrôle', 16.5, 0.4, '2024-10-15'), (1, 4, 'Examen', 17.0, 0.6, '2024-12-10'),
(1, 5, 'Contrôle', 15.0, 0.4, '2024-10-20'), (1, 5, 'Examen', 16.5, 0.6, '2024-12-15'),
(1, 6, 'Contrôle', 14.5, 0.4, '2024-10-25'), (1, 6, 'Examen', 15.5, 0.6, '2024-12-20'),
(2, 4, 'Contrôle', 13.5, 0.4, '2024-10-15'), (2, 4, 'Examen', 14.0, 0.6, '2024-12-10'),
(2, 5, 'Contrôle', 8.0, 0.4, '2024-10-20'), (2, 5, 'Examen', 7.5, 0.6, '2024-12-15'),
(2, 6, 'Contrôle', 12.0, 0.4, '2024-10-25'), (2, 6, 'Examen', 13.5, 0.6, '2024-12-20'),
(3, 2, 'Contrôle', 14.0, 0.4, '2024-10-15'), (3, 2, 'Examen', 15.0, 0.6, '2024-12-10'),
(3, 3, 'Contrôle', 13.0, 0.4, '2024-10-20'), (3, 3, 'Examen', 14.0, 0.6, '2024-12-15'),
(4, 2, 'Contrôle', 15.5, 0.4, '2024-10-15'), (4, 2, 'Examen', 16.0, 0.6, '2024-12-10'),
(4, 3, 'Contrôle', 14.5, 0.4, '2024-10-20'), (4, 3, 'Examen', 15.5, 0.6, '2024-12-15'),
(7, 11, 'Contrôle', 17.0, 0.4, '2024-10-15'), (7, 11, 'Examen', 18.0, 0.6, '2024-12-10'),
(7, 9, 'Contrôle', 16.5, 0.4, '2024-10-20'), (7, 9, 'Examen', 17.0, 0.6, '2024-12-15'),
(7, 10, 'Contrôle', 15.5, 0.4, '2024-10-25'), (7, 10, 'Examen', 16.5, 0.6, '2024-12-20'),
(8, 11, 'Contrôle', 14.0, 0.4, '2024-10-15'), (8, 11, 'Examen', 15.0, 0.6, '2024-12-10'),
(8, 9, 'Contrôle', 13.5, 0.4, '2024-10-20'), (8, 9, 'Examen', 14.5, 0.6, '2024-12-15'),
(9, 8, 'Contrôle', 11.0, 0.4, '2024-10-15'), (9, 8, 'Examen', 12.0, 0.6, '2024-12-10'),
(11, 13, 'Contrôle', 14.5, 0.4, '2024-10-15'), (11, 13, 'Examen', 15.0, 0.6, '2024-12-10'),
(11, 14, 'Contrôle', 13.0, 0.4, '2024-10-20'), (11, 14, 'Examen', 14.0, 0.6, '2024-12-15'),
(14, 16, 'Contrôle', 16.0, 0.4, '2024-10-15'), (14, 16, 'Examen', 17.0, 0.6, '2024-12-10'),
(14, 17, 'Contrôle', 15.5, 0.4, '2024-10-20'), (14, 17, 'Examen', 16.0, 0.6, '2024-12-15'),
(14, 15, 'Contrôle', 14.0, 0.4, '2024-10-25'), (14, 15, 'Examen', 15.0, 0.6, '2024-12-20'),
(17, 19, 'Contrôle', 13.5, 0.4, '2024-10-15'), (17, 19, 'Examen', 14.5, 0.6, '2024-12-10'),
(17, 20, 'Contrôle', 12.5, 0.4, '2024-10-20'), (17, 20, 'Examen', 13.5, 0.6, '2024-12-15');

-- ============================================
-- CONFIGURATION TERMINÉE!
-- ============================================

SELECT 'Configuration de la base de données terminée avec succès!' AS Statut;
SELECT COUNT(*) AS Départements FROM departments;
SELECT COUNT(*) AS Professeurs FROM professors;
SELECT COUNT(*) AS Étudiants FROM students;
SELECT COUNT(*) AS Cours FROM courses;
SELECT COUNT(*) AS Inscriptions FROM enrollments;
SELECT COUNT(*) AS Notes FROM grades;
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
