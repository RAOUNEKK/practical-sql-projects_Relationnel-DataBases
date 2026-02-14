-- ============================================
-- TP2: 30 SQL Queries Solutions
-- Hospital Management System
-- ============================================

-- ========== PART 1: BASIC QUERIES (Q1-Q5) ==========

-- Q1. List all patients with their main information
-- Expected: file_number, full_name, date_of_birth, phone, city

SELECT 
    file_number,
    CONCAT(last_name, ' ', first_name) AS full_name,
    date_of_birth,
    phone,
    city
FROM patients
ORDER BY last_name, first_name;


-- Q2. Display all doctors with their specialty
-- Expected: doctor_name, specialty_name, office, active

SELECT 
    CONCAT(d.last_name, ' ', d.first_name) AS doctor_name,
    s.specialty_name,
    d.office,
    d.active
FROM doctors d
INNER JOIN specialties s ON d.specialty_id = s.specialty_id
ORDER BY s.specialty_name, d.last_name;


-- Q3. Find all medications with price less than 500 DA
-- Expected: medication_code, commercial_name, unit_price, available_stock

SELECT 
    medication_code,
    commercial_name,
    unit_price,
    available_stock
FROM medications
WHERE unit_price < 500
ORDER BY unit_price ASC;


-- Q4. List consultations from January 2025
-- Expected: consultation_date, patient_name, doctor_name, status

SELECT 
    c.consultation_date,
    CONCAT(p.last_name, ' ', p.first_name) AS patient_name,
    CONCAT(d.last_name, ' ', d.first_name) AS doctor_name,
    c.status
FROM consultations c
INNER JOIN patients p ON c.patient_id = p.patient_id
INNER JOIN doctors d ON c.doctor_id = d.doctor_id
WHERE c.consultation_date BETWEEN '2025-01-01' AND '2025-01-31 23:59:59'
ORDER BY c.consultation_date;


-- Q5. Display medications where stock is below minimum stock
-- Expected: commercial_name, available_stock, minimum_stock, difference

SELECT 
    commercial_name,
    available_stock,
    minimum_stock,
    (minimum_stock - available_stock) AS difference
FROM medications
WHERE available_stock < minimum_stock
ORDER BY difference DESC;


-- ========== PART 2: QUERIES WITH JOINS (Q6-Q10) ==========

-- Q6. Display all consultations with patient and doctor names
-- Expected: consultation_date, patient_name, doctor_name, diagnosis, amount

SELECT 
    c.consultation_date,
    CONCAT(p.last_name, ' ', p.first_name) AS patient_name,
    CONCAT(d.last_name, ' ', d.first_name) AS doctor_name,
    c.diagnosis,
    c.amount
FROM consultations c
INNER JOIN patients p ON c.patient_id = p.patient_id
INNER JOIN doctors d ON c.doctor_id = d.doctor_id
ORDER BY c.consultation_date DESC;


-- Q7. List all prescriptions with medication details
-- Expected: prescription_date, patient_name, medication_name, quantity, dosage_instructions
SELECT 
    pr.prescription_date,
    CONCAT(p.last_name, ' ', p.first_name) AS patient_name,
    m.commercial_name AS medication_name,
    pd.quantity,
    pd.dosage_instructions
FROM prescription_details pd
INNER JOIN prescriptions pr ON pd.prescription_id = pr.prescription_id
INNER JOIN consultations c ON pr.consultation_id = c.consultation_id
INNER JOIN patients p ON c.patient_id = p.patient_id
INNER JOIN medications m ON pd.medication_id = m.medication_id
ORDER BY pr.prescription_date DESC;


-- Q8. Display patients with their last consultation date
-- Expected: patient_name, last_consultation_date, doctor_name

SELECT 
    CONCAT(p.last_name, ' ', p.first_name) AS patient_name,
    MAX(c.consultation_date) AS last_consultation_date,
    CONCAT(d.last_name, ' ', d.first_name) AS doctor_name
FROM patients p
INNER JOIN consultations c ON p.patient_id = c.patient_id
INNER JOIN doctors d ON c.doctor_id = d.doctor_id
WHERE c.consultation_id = (
    SELECT c2.consultation_id 
    FROM consultations c2 
    WHERE c2.patient_id = p.patient_id 
    ORDER BY c2.consultation_date DESC 
    LIMIT 1
)
GROUP BY p.patient_id, p.last_name, p.first_name, d.last_name, d.first_name
ORDER BY last_consultation_date DESC;


-- Q9. List doctors and the number of consultations performed
-- Expected: doctor_name, consultation_count

SELECT 
    CONCAT(d.last_name, ' ', d.first_name) AS doctor_name,
    COUNT(c.consultation_id) AS consultation_count
FROM doctors d
LEFT JOIN consultations c ON d.doctor_id = c.doctor_id
GROUP BY d.doctor_id, d.last_name, d.first_name
ORDER BY consultation_count DESC;


-- Q10. Display revenue by medical specialty
-- Expected: specialty_name, total_revenue, consultation_count

SELECT 
    s.specialty_name,
    COALESCE(SUM(c.amount), 0) AS total_revenue,
    COUNT(c.consultation_id) AS consultation_count
FROM specialties s
LEFT JOIN doctors d ON s.specialty_id = d.specialty_id
LEFT JOIN consultations c ON d.doctor_id = c.doctor_id
GROUP BY s.specialty_id, s.specialty_name
ORDER BY total_revenue DESC;


-- ========== PART 3: AGGREGATE FUNCTIONS (Q11-Q15) ==========

-- Q11. Calculate total prescription amount per patient
-- Expected: patient_name, total_prescription_cost

SELECT 
    CONCAT(p.last_name, ' ', p.first_name) AS patient_name,
    COALESCE(SUM(pd.total_price), 0) AS total_prescription_cost
FROM patients p
LEFT JOIN consultations c ON p.patient_id = c.patient_id
LEFT JOIN prescriptions pr ON c.consultation_id = pr.consultation_id
LEFT JOIN prescription_details pd ON pr.prescription_id = pd.prescription_id
GROUP BY p.patient_id, p.last_name, p.first_name
HAVING total_prescription_cost > 0
ORDER BY total_prescription_cost DESC;


-- Q12. Count the number of consultations per doctor
-- Expected: doctor_name, consultation_count

SELECT 
    CONCAT(d.last_name, ' ', d.first_name) AS doctor_name,
    COUNT(c.consultation_id) AS consultation_count
FROM doctors d
LEFT JOIN consultations c ON d.doctor_id = c.doctor_id
GROUP BY d.doctor_id, d.last_name, d.first_name
ORDER BY consultation_count DESC;


-- Q13. Calculate total stock value of pharmacy
-- Expected: total_medications, total_stock_value

SELECT 
    COUNT(*) AS total_medications,
    SUM(unit_price * available_stock) AS total_stock_value
FROM medications;


-- Q14. Find average consultation price per specialty
-- Expected: specialty_name, average_price

SELECT 
    s.specialty_name,
    ROUND(AVG(c.amount), 2) AS average_price
FROM specialties s
INNER JOIN doctors d ON s.specialty_id = d.specialty_id
INNER JOIN consultations c ON d.doctor_id = c.doctor_id
GROUP BY s.specialty_id, s.specialty_name
ORDER BY average_price DESC;


-- Q15. Count number of patients by blood type
-- Expected: blood_type, patient_count

SELECT 
    blood_type,
    COUNT(*) AS patient_count
FROM patients
WHERE blood_type IS NOT NULL
GROUP BY blood_type
ORDER BY patient_count DESC;


-- ========== PART 4: ADVANCED QUERIES (Q16-Q20) ==========

-- Q16. Find the top 5 most prescribed medications
SELECT 
    m.commercial_name AS medication_name,
    COUNT(pd.prescription_id) AS times_prescribed,
    SUM(pd.quantity) AS total_quantity_prescribed
FROM medications m
INNER JOIN prescription_details pd ON m.medication_id = pd.medication_id
GROUP BY m.medication_id, m.commercial_name
ORDER BY times_prescribed DESC, total_quantity_prescribed DESC
LIMIT 5;


-- Q17. List patients who have never had a consultation
-- Expected: patient_name, registration_date

SELECT 
    CONCAT(p.last_name, ' ', p.first_name) AS patient_name,
    p.registration_date
FROM patients p
LEFT JOIN consultations c ON p.patient_id = c.patient_id
WHERE c.consultation_id IS NULL
ORDER BY p.registration_date DESC;


-- Q18. Display doctors who performed more than 2 consultations
-- Expected: doctor_name, specialty, consultation_count

SELECT 
    CONCAT(d.last_name, ' ', d.first_name) AS doctor_name,
    s.specialty_name AS specialty,
    COUNT(c.consultation_id) AS consultation_count
FROM doctors d
INNER JOIN specialties s ON d.specialty_id = s.specialty_id
INNER JOIN consultations c ON d.doctor_id = c.doctor_id
GROUP BY d.doctor_id, d.last_name, d.first_name, s.specialty_name
HAVING COUNT(c.consultation_id) > 2
ORDER BY consultation_count DESC;


-- Q19. Find unpaid consultations with total amount
-- Expected: patient_name, consultation_date, amount, doctor_name

SELECT 
    CONCAT(p.last_name, ' ', p.first_name) AS patient_name,
    c.consultation_date,
    c.amount,
    CONCAT(d.last_name, ' ', d.first_name) AS doctor_name
FROM consultations c
INNER JOIN patients p ON c.patient_id = p.patient_id
INNER JOIN doctors d ON c.doctor_id = d.doctor_id
WHERE c.paid = FALSE
ORDER BY c.consultation_date DESC;


-- Q20. List medications expiring in less than 6 months from today
-- Expected: medication_name, expiration_date, days_until_expiration

SELECT 
    commercial_name AS medication_name,
    expiration_date,
    DATEDIFF(expiration_date, CURRENT_DATE) AS days_until_expiration
FROM medications
WHERE expiration_date BETWEEN CURRENT_DATE AND DATE_ADD(CURRENT_DATE, INTERVAL 6 MONTH)
ORDER BY days_until_expiration ASC;


-- ========== PART 5: SUBQUERIES (Q21-Q25) ==========

-- Q21. Find patients who consulted more than the average
-- Expected: patient_name, consultation_count, average_count

SELECT 
    CONCAT(p.last_name, ' ', p.first_name) AS patient_name,
    COUNT(c.consultation_id) AS consultation_count,
    (SELECT ROUND(AVG(consultation_count), 2)
     FROM (SELECT COUNT(*) AS consultation_count 
           FROM consultations 
           GROUP BY patient_id) AS avg_calc) AS average_count
FROM patients p
INNER JOIN consultations c ON p.patient_id = c.patient_id
GROUP BY p.patient_id, p.last_name, p.first_name
HAVING COUNT(c.consultation_id) > (
    SELECT AVG(consultation_count)
    FROM (SELECT COUNT(*) AS consultation_count 
          FROM consultations 
          GROUP BY patient_id) AS subquery
)
ORDER BY consultation_count DESC;


-- Q22. List medications more expensive than average price
-- Expected: medication_name, unit_price, average_price

SELECT 
    commercial_name AS medication_name,
    unit_price,
    (SELECT ROUND(AVG(unit_price), 2) FROM medications) AS average_price
FROM medications
WHERE unit_price > (SELECT AVG(unit_price) FROM medications)
ORDER BY unit_price DESC;


-- Q23. Display doctors from the most requested specialty
-- Expected: doctor_name, specialty_name, specialty_consultation_count

SELECT 
    CONCAT(d.last_name, ' ', d.first_name) AS doctor_name,
    s.specialty_name,
    (SELECT COUNT(*) 
     FROM consultations c2 
     INNER JOIN doctors d2 ON c2.doctor_id = d2.doctor_id 
     WHERE d2.specialty_id = s.specialty_id) AS specialty_consultation_count
FROM doctors d
INNER JOIN specialties s ON d.specialty_id = s.specialty_id
WHERE s.specialty_id = (
    SELECT d3.specialty_id
    FROM consultations c3
    INNER JOIN doctors d3 ON c3.doctor_id = d3.doctor_id
    GROUP BY d3.specialty_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
ORDER BY doctor_name;


-- Q24. Find consultations with amount higher than average
-- Expected: consultation_date, patient_name, amount, average_amount

SELECT 
    c.consultation_date,
    CONCAT(p.last_name, ' ', p.first_name) AS patient_name,
    c.amount,
    (SELECT ROUND(AVG(amount), 2) FROM consultations) AS average_amount
FROM consultations c
INNER JOIN patients p ON c.patient_id = p.patient_id
WHERE c.amount > (SELECT AVG(amount) FROM consultations)
ORDER BY c.amount DESC;


-- Q25. List allergic patients who received a prescription
-- Expected: patient_name, allergies, prescription_count

SELECT 
    CONCAT(p.last_name, ' ', p.first_name) AS patient_name,
    p.allergies,
    COUNT(DISTINCT pr.prescription_id) AS prescription_count
FROM patients p
INNER JOIN consultations c ON p.patient_id = c.patient_id
INNER JOIN prescriptions pr ON c.consultation_id = pr.consultation_id
WHERE p.allergies IS NOT NULL AND p.allergies != ''
GROUP BY p.patient_id, p.last_name, p.first_name, p.allergies
ORDER BY prescription_count DESC;


-- ========== PART 6: BUSINESS ANALYSIS (Q26-Q30) ==========

-- Q26. Calculate total revenue per doctor (paid consultations only)
-- Expected: doctor_name, total_consultations, total_revenue

SELECT 
    CONCAT(d.last_name, ' ', d.first_name) AS doctor_name,
    COUNT(c.consultation_id) AS total_consultations,
    SUM(c.amount) AS total_revenue
FROM doctors d
INNER JOIN consultations c ON d.doctor_id = c.doctor_id
WHERE c.paid = TRUE
GROUP BY d.doctor_id, d.last_name, d.first_name
ORDER BY total_revenue DESC;


-- Q27. Display top 3 most profitable specialties
-- Expected: rank, specialty_name, total_revenue
SET @row_pos := 0; 
SELECT 
    (@row_pos := @row_pos + 1) AS ranking_position,
    t.specialty_name,
    t.total_revenue
FROM (
    SELECT 
        s.specialty_name,
        SUM(c.amount) AS total_revenue
    FROM specialties s
    JOIN doctors d ON s.specialty_id = d.specialty_id
    JOIN consultations c ON d.doctor_id = c.doctor_id
    GROUP BY s.specialty_id, s.specialty_name
    ORDER BY total_revenue DESC
) AS t
LIMIT 3;

-- Q28. List medications to restock (stock < minimum)
-- Expected: medication_name, current_stock, minimum_stock, quantity_needed

SELECT 
    commercial_name AS medication_name,
    available_stock AS current_stock,
    minimum_stock,
    (minimum_stock - available_stock) AS quantity_needed
FROM medications
WHERE available_stock < minimum_stock
ORDER BY quantity_needed DESC;


-- Q29. Calculate average number of medications per prescription
-- Expected: average_medications_per_prescription

SELECT 
    ROUND(AVG(med_count), 2) AS average_medications_per_prescription
FROM (
    SELECT 
        pr.prescription_id,
        COUNT(pd.medication_id) AS med_count
    FROM prescriptions pr
    LEFT JOIN prescription_details pd ON pr.prescription_id = pd.prescription_id
    GROUP BY pr.prescription_id
) AS prescription_counts;


-- Q30. Generate patient demographics report by age group
-- Age groups: 0-18, 19-40, 41-60, 60+
-- Expected: age_group, patient_count, percentage

SELECT 
    age_group,
    patient_count,
    ROUND((patient_count * 100.0 / (SELECT COUNT(*) FROM patients)), 2) AS percentage
FROM (
    SELECT 
        CASE 
            WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURRENT_DATE) BETWEEN 0 AND 18 THEN '0-18'
            WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURRENT_DATE) BETWEEN 19 AND 40 THEN '19-40'
            WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURRENT_DATE) BETWEEN 41 AND 60 THEN '41-60'
            ELSE '60+'
        END AS age_group,
        COUNT(*) AS patient_count
    FROM patients
    GROUP BY age_group
) AS age_groups
ORDER BY 
    CASE age_group
        WHEN '0-18' THEN 1
        WHEN '19-40' THEN 2
        WHEN '41-60' THEN 3
        WHEN '60+' THEN 4
    END;
