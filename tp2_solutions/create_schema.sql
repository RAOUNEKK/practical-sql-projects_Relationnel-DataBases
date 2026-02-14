-- ============================================
-- ALGERIAN HOSPITAL MANAGEMENT SYSTEM - COMPLETE SCRIPT
-- ============================================

-- STEP 1: RESET DATABASE
SET FOREIGN_KEY_CHECKS = 0;
DROP DATABASE IF EXISTS hospital_db;
CREATE DATABASE hospital_db;
USE hospital_db;

-- STEP 2: CREATE TABLES
CREATE TABLE specialties (
    specialty_id INT PRIMARY KEY AUTO_INCREMENT,
    specialty_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    consultation_fee DECIMAL(10, 2) NOT NULL
);

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    specialty_id INT NOT NULL,
    license_number VARCHAR(20) UNIQUE NOT NULL,
    hire_date DATE,
    office VARCHAR(100),
    active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (specialty_id) REFERENCES specialties(specialty_id)
);

CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    file_number VARCHAR(20) UNIQUE NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('M', 'F') NOT NULL,
    blood_type VARCHAR(5),
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    address TEXT,
    city VARCHAR(50),
    province VARCHAR(50),
    registration_date DATE DEFAULT (CURRENT_DATE),
    insurance VARCHAR(100),
    insurance_number VARCHAR(50),
    allergies TEXT,
    medical_history TEXT,
    emergency_contact VARCHAR(100),
    emergency_phone VARCHAR(20)
);

CREATE TABLE medications (
    medication_id INT PRIMARY KEY AUTO_INCREMENT,
    medication_code VARCHAR(20) UNIQUE NOT NULL,
    commercial_name VARCHAR(150) NOT NULL,
    generic_name VARCHAR(150),
    form VARCHAR(50),
    dosage VARCHAR(50),
    manufacturer VARCHAR(100),
    unit_price DECIMAL(10, 2) NOT NULL,
    available_stock INT DEFAULT 0,
    minimum_stock INT DEFAULT 10,
    expiration_date DATE,
    prescription_required BOOLEAN DEFAULT TRUE,
    reimbursable BOOLEAN DEFAULT FALSE,
    description TEXT
);

CREATE TABLE consultations (
    consultation_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    consultation_date DATETIME NOT NULL,
    reason TEXT NOT NULL,
    diagnosis TEXT,
    observations TEXT,
    blood_pressure VARCHAR(20),
    temperature DECIMAL(4, 2),
    weight DECIMAL(5, 2),
    height DECIMAL(5, 2),
    status ENUM('Scheduled', 'In Progress', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    amount DECIMAL(10, 2),
    paid BOOLEAN DEFAULT FALSE,
    notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE prescriptions (
    prescription_id INT PRIMARY KEY AUTO_INCREMENT,
    consultation_id INT NOT NULL,
    prescription_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    treatment_duration INT,
    general_instructions TEXT,
    FOREIGN KEY (consultation_id) REFERENCES consultations(consultation_id)
);

CREATE TABLE prescription_details (
    detail_id INT PRIMARY KEY AUTO_INCREMENT,
    prescription_id INT NOT NULL,
    medication_id INT NOT NULL,
    quantity INT NOT NULL,
    dosage_instructions VARCHAR(200) NOT NULL,
    duration INT NOT NULL,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (prescription_id) REFERENCES prescriptions(prescription_id),
    FOREIGN KEY (medication_id) REFERENCES medications(medication_id)
);

-- STEP 3: INSERT DATA
-- Insert Specialties
INSERT INTO specialties (specialty_name, description, consultation_fee) VALUES
('Médecine Générale', 'Consultation générale', 1500.00), ('Cardiologie', 'Cœur', 3500.00),
('Pédiatrie', 'Enfants', 2500.00), ('Dermatologie', 'Peau', 2800.00),
('Orthopédie', 'Os', 3000.00), ('Gynécologie', 'Femmes', 3200.00),
('Chirurgie', 'Interventions', 4000.00), ('ORL', 'Nez/Gorge', 2600.00),
('Ophtalmologie', 'Yeux', 2800.00), ('Neurologie', 'Système nerveux', 3500.00);

-- Insert Doctors
INSERT INTO doctors (last_name, first_name, specialty_id, office, phone, email, hire_date, active, license_number) VALUES
('Benabdallah', 'Karim', 1, 'C101', '0550123456', 'k.b@h.dz', '2015-03-15', 1, 'DZ001'),
('Bouziane', 'Amina', 1, 'C102', '0551234567', 'a.b@h.dz', '2018-09-20', 1, 'DZ002'),
('Hamidi', 'Rachid', 1, 'C103', '0552345678', 'r.h@h.dz', '2019-06-10', 1, 'DZ003'),
('Mansouri', 'Ahmed', 2, 'C201', '0553456789', 'a.m@h.dz', '2012-06-20', 1, 'DZ004'),
('Boudjema', 'Farida', 2, 'C202', '0554567890', 'f.b@h.dz', '2016-11-05', 1, 'DZ005'),
('Sebaihi', 'Mohamed', 3, 'C301', '0555678901', 'm.s@h.dz', '2014-04-12', 1, 'DZ006'),
('Meziani', 'Soraya', 3, 'C302', '0556789012', 's.m@h.dz', '2017-08-25', 1, 'DZ007'),
('Sahraoui', 'Leila', 7, 'B401', '0557890123', 'l.s@h.dz', '2011-02-18', 1, 'DZ008'),
('Messaoud', 'Djamel', 7, 'B402', '0558901234', 'd.m@h.dz', '2013-10-30', 1, 'DZ009'),
('Belaidi', 'Anissa', 6, 'C501', '0559012345', 'a.bel@h.dz', '2015-07-14', 1, 'DZ010');

-- Insert Patients
INSERT INTO patients (file_number, last_name, first_name, date_of_birth, gender, blood_type, phone, city) VALUES
('P001', 'Abahri', 'Wassim', '2015-05-12', 'M', 'O+', '0660111222', 'Alger'),
('P002', 'Abbaci', 'Zoulikha', '1985-03-22', 'F', 'A+', '0661222333', 'Alger'),
('P003', 'Abboud', 'Massi', '1992-07-18', 'F', 'O-', '0662333444', 'Alger'),
('P004', 'Abdelhamid', 'Rahma', '1988-11-30', 'F', 'A-', '0663444555', 'Alger'),
('P005', 'Abderrezague', 'Ismail', '1990-11-08', 'M', 'AB-', '0664555666', 'Alger');

-- Insert Medications
INSERT INTO medications (medication_code, commercial_name, unit_price, available_stock) VALUES
('M001', 'Doliprane 1000mg', 150.00, 500), ('M002', 'Paracétamol Sirop', 280.00, 190),
('M003', 'Aspégic 1000mg', 280.00, 250), ('M004', 'Amoxicilline 1g', 450.00, 300),
('M005', 'Voltarène 50mg', 320.00, 200), ('M006', 'Oméprazole 20mg', 290.00, 180),
('M007', 'Prednisolone 20mg', 210.00, 95), ('M008', 'Furosémide 40mg', 180.00, 140);

-- Insert Consultations
INSERT INTO consultations (patient_id, doctor_id, consultation_date, reason, status, amount) VALUES
(1, 6, '2025-01-15 09:30:00', 'Fièvre', 'Completed', 2500.00),
(2, 1, '2025-01-18 10:00:00', 'Hypertension', 'Completed', 1500.00),
(3, 4, '2025-01-20 14:30:00', 'Eczéma', 'Completed', 2800.00);

-- Insert Prescriptions
INSERT INTO prescriptions (consultation_id, prescription_date, treatment_duration) VALUES
(1, '2025-01-15 10:00:00', 7), (2, '2025-01-18 10:30:00', 30), (3, '2025-01-20 15:00:00', 14);

-- Insert Prescription Details 
INSERT INTO prescription_details (prescription_id, medication_id, quantity, dosage_instructions, duration) VALUES
(1, 1, 21, '1 comp 3x/jour', 7),
(1, 2, 1, '1 ampoule', 1),
(2, 4, 30, '1 comp/matin', 30),
(3, 5, 14, '1 comp/jour', 14);

-- STEP 4: RE-ENABLE CHECKS
SET FOREIGN_KEY_CHECKS = 1;

-- STEP 5: TEST SEARCH
SELECT 'DATABASE LOADED SUCCESSFULLY' as status;
SELECT * FROM patients;