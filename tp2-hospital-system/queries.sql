-- ============================================
-- TP2: 30 SQL Queries to Solve
-- Hospital Management System
-- ============================================
-- INSTRUCTIONS: Write your SQL query below each question
-- ============================================

-- ========== PART 1: BASIC QUERIES (Q1-Q5) ==========

-- Q1. List all patients with their main information
-- Expected: file_number, full_name, date_of_birth, phone, city


-- Q2. Display all doctors with their specialty
-- Expected: doctor_name, specialty_name, office, active


-- Q3. Find all medications with price less than 500 DA
-- Expected: medication_code, commercial_name, unit_price, available_stock


-- Q4. List consultations from January 2025
-- Expected: consultation_date, patient_name, doctor_name, status


-- Q5. Display medications where stock is below minimum stock
-- Expected: commercial_name, available_stock, minimum_stock, difference


-- ========== PART 2: QUERIES WITH JOINS (Q6-Q10) ==========

-- Q6. Display all consultations with patient and doctor names
-- Expected: consultation_date, patient_name, doctor_name, diagnosis, amount


-- Q7. List all prescriptions with medication details
-- Expected: prescription_date, patient_name, medication_name, quantity, dosage_instructions


-- Q8. Display patients with their last consultation date
-- Expected: patient_name, last_consultation_date, doctor_name


-- Q9. List doctors and the number of consultations performed
-- Expected: doctor_name, consultation_count


-- Q10. Display revenue by medical specialty
-- Expected: specialty_name, total_revenue, consultation_count


-- ========== PART 3: AGGREGATE FUNCTIONS (Q11-Q15) ==========

-- Q11. Calculate total prescription amount per patient
-- Expected: patient_name, total_prescription_cost


-- Q12. Count the number of consultations per doctor
-- Expected: doctor_name, consultation_count


-- Q13. Calculate total stock value of pharmacy
-- Expected: total_medications, total_stock_value


-- Q14. Find average consultation price per specialty
-- Expected: specialty_name, average_price


-- Q15. Count number of patients by blood type
-- Expected: blood_type, patient_count


-- ========== PART 4: ADVANCED QUERIES (Q16-Q20) ==========

-- Q16. Find the top 5 most prescribed medications
-- Expected: medication_name, times_prescribed, total_quantity


-- Q17. List patients who have never had a consultation
-- Expected: patient_name, registration_date


-- Q18. Display doctors who performed more than 2 consultations
-- Expected: doctor_name, specialty, consultation_count


-- Q19. Find unpaid consultations with total amount
-- Expected: patient_name, consultation_date, amount, doctor_name


-- Q20. List medications expiring in less than 6 months from today
-- Expected: medication_name, expiration_date, days_until_expiration


-- ========== PART 5: SUBQUERIES (Q21-Q25) ==========

-- Q21. Find patients who consulted more than the average
-- Expected: patient_name, consultation_count, average_count


-- Q22. List medications more expensive than average price
-- Expected: medication_name, unit_price, average_price


-- Q23. Display doctors from the most requested specialty
-- Expected: doctor_name, specialty_name, specialty_consultation_count


-- Q24. Find consultations with amount higher than average
-- Expected: consultation_date, patient_name, amount, average_amount


-- Q25. List allergic patients who received a prescription
-- Expected: patient_name, allergies, prescription_count


-- ========== PART 6: BUSINESS ANALYSIS (Q26-Q30) ==========

-- Q26. Calculate total revenue per doctor (paid consultations only)
-- Expected: doctor_name, total_consultations, total_revenue


-- Q27. Display top 3 most profitable specialties
-- Expected: rank, specialty_name, total_revenue


-- Q28. List medications to restock (stock < minimum)
-- Expected: medication_name, current_stock, minimum_stock, quantity_needed


-- Q29. Calculate average number of medications per prescription
-- Expected: average_medications_per_prescription


-- Q30. Generate patient demographics report by age group
-- Age groups: 0-18, 19-40, 41-60, 60+
-- Expected: age_group, patient_count, percentage

