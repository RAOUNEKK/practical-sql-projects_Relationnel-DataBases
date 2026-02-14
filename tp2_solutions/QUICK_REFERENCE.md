# QUICK REFERENCE GUIDE - 30 SQL QUERIES


## PART 1: BASIC QUERIES (Q1-Q5)

### Q1: List All Patients
```sql
SELECT 
    file_number,
    CONCAT(last_name, ' ', first_name) AS full_name,
    date_of_birth,
    phone,
    city
FROM patients;
```
**Explanation:** Simple SELECT with CONCAT to combine last and first names into full name.

---

### Q2: Doctors with Specialty
```sql
SELECT 
    CONCAT(d.last_name, ' ', d.first_name) AS doctor_name,
    s.specialty_name,
    d.office,
    d.active
FROM doctors d
INNER JOIN specialties s ON d.specialty_id = s.specialty_id;
```
**Explanation:** JOIN doctors with specialties table to show specialty name.

---

### Q3: Medications Under 500 DA
```sql
SELECT 
    medication_code,
    commercial_name,
    unit_price,
    available_stock
FROM medications
WHERE unit_price < 500;
```
**Explanation:** Simple WHERE clause filtering by price.

---

### Q4: January 2025 Consultations
```sql
SELECT 
    c.consultation_date,
    CONCAT(p.last_name, ' ', p.first_name) AS patient_name,
    CONCAT(d.last_name, ' ', d.first_name) AS doctor_name,
    c.status
FROM consultations c
INNER JOIN patients p ON c.patient_id = p.patient_id
INNER JOIN doctors d ON c.doctor_id = d.doctor_id
WHERE c.consultation_date BETWEEN '2025-01-01' AND '2025-01-31 23:59:59';
```
**Explanation:** Two JOINs with DATETIME range filter using BETWEEN.

---

### Q5: Low Stock Medications
```sql
SELECT 
    commercial_name,
    available_stock,
    minimum_stock,
    (minimum_stock - available_stock) AS difference
FROM medications
WHERE available_stock < minimum_stock;
```
**Explanation:** Calculated field (difference) with WHERE condition.

---

## PART 2: QUERIES WITH JOINS (Q6-Q10)

### Q6: All Consultations with Details
```sql
SELECT 
    c.consultation_date,
    CONCAT(p.last_name, ' ', p.first_name) AS patient_name,
    CONCAT(d.last_name, ' ', d.first_name) AS doctor_name,
    c.diagnosis,
    c.amount
FROM consultations c
INNER JOIN patients p ON c.patient_id = p.patient_id
INNER JOIN doctors d ON c.doctor_id = d.doctor_id;
```
**Explanation:** Two INNER JOINs to show consultation details with patient and doctor names.

---

### Q7: Prescription Details with Medications
```sql
SELECT 
    pr.prescription_date,
    CONCAT(p.last_name, ' ', p.first_name) AS patient_name,
    m.commercial_name AS medication_name,
    pd.quantity,
    pd.dosage_instructions
FROM prescriptions pr
INNER JOIN consultations c ON pr.consultation_id = c.consultation_id
INNER JOIN patients p ON c.patient_id = p.patient_id
INNER JOIN prescription_details pd ON pr.prescription_id = pd.prescription_id
INNER JOIN medications m ON pd.medication_id = m.medication_id;
```
**Explanation:** Five-table JOIN connecting prescriptions with medications through consultation and junction table.  
**Note:** Table renamed from `prescription_medications` to `prescription_details`

---

### Q19: Unpaid Consultations
```sql
SELECT 
    CONCAT(p.last_name, ' ', p.first_name) AS patient_name,
    c.consultation_date,
    c.amount,
    CONCAT(d.last_name, ' ', d.first_name) AS doctor_name
FROM consultations c
INNER JOIN patients p ON c.patient_id = p.patient_id
INNER JOIN doctors d ON c.doctor_id = d.doctor_id
WHERE c.paid = FALSE;
```
**Explanation:** Filter using BOOLEAN field `paid`.  
**Note:** Changed from `payment_status = 'Non payé'` to `paid = FALSE`

---

## KEY SQL PATTERNS

### Pattern: Paid vs Unpaid Consultations
```sql
-- Paid consultations
WHERE c.paid = TRUE

-- Unpaid consultations  
WHERE c.paid = FALSE
```

### Pattern: DATETIME Filtering
```sql
-- Specific date range
WHERE consultation_date BETWEEN '2025-01-01' AND '2025-01-31 23:59:59'

-- Within 6 months
WHERE expiration_date BETWEEN CURRENT_DATE AND DATE_ADD(CURRENT_DATE, INTERVAL 6 MONTH)
```

### Pattern: Status ENUM
```sql
-- Valid status values
WHERE status = 'Scheduled'
WHERE status = 'In Progress'
WHERE status = 'Completed'
WHERE status = 'Cancelled'
```

---

## ALGERIAN HOSPITAL SPECIFICS

**Currency:** All amounts in DZD (Dinar Algérien)  

**Insurance Companies:**
- CNAS (Caisse Nationale des Assurances Sociales) - Employees
- CASNOS (Caisse Nationale de Sécurité Sociale des Non-Salariés) - Self-employed

**Medication Manufacturers:**
- SAIDAL (State pharmaceutical company)
- BIOPHARM (Algerian pharma)
- IBN SINA (Local manufacturer)
- Sanofi Algérie (International branch)

**Provinces:**
- Alger (16) - Capital
- Béjaïa (06) - Kabylie region
- Sidi-Bel-Abbès (22) - Western Algeria

**Patient Names:** Real names 


---

## QUERY COMPLEXITY LEVELS

### Level 1 (Q1-Q5): Basic
- Simple SELECT
- WHERE clauses
- Basic calculations
- Simple JOINs

### Level 2 (Q6-Q15): Intermediate
- Multiple JOINs
- GROUP BY
- Aggregate functions
- LEFT JOIN vs INNER JOIN

### Level 3 (Q16-Q25): Advanced
- HAVING clauses
- Subqueries
- Complex filtering
- Date functions

### Level 4 (Q26-Q30): Expert
- Window functions (RANK)
- Complex aggregations
- CASE statements
- Percentage calculations

---

**Last Updated:** February 2026
