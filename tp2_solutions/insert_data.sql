-- ============================================
-- ALGERIAN HOSPITAL MANAGEMENT SYSTEM - INSERT DATA
-- ============================================

-- Insert Specialties
INSERT INTO specialties (specialty_name, description, consultation_fee) VALUES
('Médecine Générale', 'Consultation générale et diagnostic de première ligne', 1500.00),
('Cardiologie', 'Spécialiste des maladies cardiovasculaires', 3500.00),
('Pédiatrie', 'Spécialiste de la santé des enfants et adolescents', 2500.00),
('Dermatologie', 'Spécialiste des maladies de la peau', 2800.00),
('Orthopédie', 'Spécialiste des os, articulations et muscles', 3000.00),
('Gynécologie-Obstétrique', 'Santé féminine et suivi de grossesse', 3200.00),
('Chirurgie Générale', 'Interventions chirurgicales diverses', 4000.00),
('ORL', 'Oreille, nez, gorge', 2600.00),
('Ophtalmologie', 'Spécialiste des yeux et de la vision', 2800.00),
('Neurologie', 'Spécialiste du système nerveux', 3500.00);

-- Insert Doctors
INSERT INTO doctors (last_name, first_name, specialty_id, office, phone, email, hire_date, active, license_number) VALUES
('Benabdallah', 'Karim', 1, 'Cabinet 101', '0550123456', 'k.benabdallah@hospital.dz', '2015-03-15', TRUE, 'DZ-MED-2015-001'),
('Bouziane', 'Amina', 1, 'Cabinet 102', '0551234567', 'a.bouziane@hospital.dz', '2018-09-20', TRUE, 'DZ-MED-2018-089'),
('Hamidi', 'Rachid', 1, 'Cabinet 103', '0552345678', 'r.hamidi@hospital.dz', '2019-06-10', TRUE, 'DZ-MED-2019-134'),
('Mansouri', 'Ahmed', 2, 'Cabinet 201', '0553456789', 'a.mansouri@hospital.dz', '2012-06-20', TRUE, 'DZ-MED-2012-045'),
('Boudjema', 'Farida', 2, 'Cabinet 202', '0554567890', 'f.boudjema@hospital.dz', '2016-11-05', TRUE, 'DZ-MED-2016-223'),
('Sebaihi', 'Mohamed', 3, 'Cabinet 301', '0555678901', 'm.sebaihi@hospital.dz', '2014-04-12', TRUE, 'DZ-MED-2014-078'),
('Meziani', 'Soraya', 3, 'Cabinet 302', '0556789012', 's.meziani@hospital.dz', '2017-08-25', TRUE, 'DZ-MED-2017-156'),
('Sahraoui', 'Leila', 7, 'Bloc 401', '0557890123', 'l.sahraoui@hospital.dz', '2011-02-18', TRUE, 'DZ-MED-2011-023'),
('Messaoud', 'Djamel', 7, 'Bloc 402', '0558901234', 'd.messaoud@hospital.dz', '2013-10-30', TRUE, 'DZ-MED-2013-167'),
('Belaidi', 'Anissa', 6, 'Cabinet 501', '0559012345', 'a.belaidi@hospital.dz', '2015-07-14', TRUE, 'DZ-MED-2015-234'),
('Belhamri', 'Zelikha', 6, 'Cabinet 502', '0550234567', 'z.belhamri@hospital.dz', '2016-03-22', TRUE, 'DZ-MED-2016-098'),
('Cherif', 'Thanina', 4, 'Cabinet 601', '0551345678', 't.cherif@hospital.dz', '2014-11-05', TRUE, 'DZ-MED-2014-122'),
('Khelifi', 'Nadia', 8, 'Cabinet 701', '0552456789', 'n.khelifi@hospital.dz', '2017-05-18', TRUE, 'DZ-MED-2017-189'),
('Benali', 'Youcef', 9, 'Cabinet 801', '0553567890', 'y.benali@hospital.dz', '2013-12-09', TRUE, 'DZ-MED-2013-201'),
('Larbi', 'Youcef', 10, 'Cabinet 901', '0554678901', 'y.larbi@hospital.dz', '2012-08-15', TRUE, 'DZ-MED-2012-067'),
('Boumediene', 'Samia', 5, 'Cabinet 1001', '0555789012', 's.boumediene@hospital.dz', '2016-01-20', TRUE, 'DZ-MED-2016-045'),
('Benmohamed', 'Hicham', 5, 'Cabinet 1002', '0556890123', 'h.benmohamed@hospital.dz', '2018-04-11', TRUE, 'DZ-MED-2018-178');

-- Insert Patients
INSERT INTO patients (file_number, last_name, first_name, date_of_birth, gender, blood_type, phone, email, address, city, province, allergies, emergency_contact, emergency_phone, registration_date, insurance, insurance_number, medical_history) VALUES
('P-2024-0001', 'Abahri', 'Wassim', '2015-05-12', 'M', 'O+', '0660111222', NULL, '12 Rue Didouche Mourad', 'Alger', 'Alger', NULL, 'Abahri Kamel (père)', '0660111223', '2024-01-15', 'CNAS', 'CNAS-2024-001', 'Vaccination à jour'),
('P-2024-0002', 'Abbaci', 'Zoulikha', '1985-03-22', 'F', 'A+', '0661222333', 'z.abbaci@email.dz', '78 Rue Larbi Ben M''hidi', 'Alger', 'Alger', 'Pénicilline', 'Abbaci Mohamed (époux)', '0661222334', '2024-01-10', 'CNAS', 'CNAS-2024-112', 'Hypertension depuis 2020'),
('P-2024-0003', 'Abboud', 'Massi-Nissa', '1992-07-18', 'F', 'O-', '0662333444', 'm.abboud@email.dz', '45 Avenue Pasteur', 'Alger', 'Alger', NULL, 'Abboud Rachid (frère)', '0662333445', '2024-01-20', NULL, NULL, 'Aucun antécédent'),
('P-2024-0004', 'Abdelhamid', 'Rahma', '1988-11-30', 'F', 'A-', '0663444555', 'r.abdelhamid@email.dz', '23 Rue Hassiba Ben Bouali', 'Alger', 'Alger', 'Iode', 'Abdelhamid Farid (époux)', '0663444556', '2024-02-05', 'CNAS', 'CNAS-2024-223', 'Allergie iode'),
('P-2024-0005', 'Abderrezague', 'Ismail', '1990-11-08', 'M', 'AB-', '0664555666', 'i.abderrezague@email.dz', '23 Boulevard Mohamed V', 'Alger', 'Alger', NULL, 'Abderrezague Samira (mère)', '0664555667', '2024-02-05', NULL, NULL, 'Aucun antécédent'),
('P-2024-0006', 'Aidouni', 'Sid Ahmed Ouassim', '1995-06-15', 'M', 'O+', '0665666777', 's.aidouni@email.dz', '89 Rue Didouche Mourad', 'Alger', 'Alger', NULL, 'Aidouni Nadia (sœur)', '0665666778', '2024-02-10', 'CASNOS', 'CASNOS-2024-178', NULL),
('P-2024-0007', 'Aissaoui', 'Wissam', '1982-09-25', 'M', 'A+', '0666777888', 'w.aissaoui@email.dz', '34 Avenue de l''ALN', 'Alger', 'Alger', NULL, 'Aissaoui Leila (épouse)', '0666777889', '2024-02-15', 'CNAS', 'CNAS-2024-334', 'Diabète type 2'),
('P-2024-0008', 'Ait Ferhat', 'Maria', '1978-03-12', 'F', 'B+', '0667888999', 'm.aitferhat@email.dz', '56 Rue Frantz Fanon', 'Alger', 'Alger', NULL, 'Ait Ferhat Mohand (époux)', '0667889000', '2024-02-20', 'CNAS', 'CNAS-2024-445', 'Hypertension'),
('P-2024-0009', 'Addou', 'Aicha Amira', '1991-12-05', 'F', 'B+', '0668000111', 'a.addou@email.dz', '12 Boulevard Said Touati', 'Béjaïa', 'Béjaïa', NULL, 'Addou Karim (frère)', '0668000112', '2024-01-25', 'CASNOS', 'CASNOS-2024-089', NULL),
('P-2024-0010', 'Adjou', 'Amine', '1996-04-22', 'M', 'O-', '0669111222', 'a.adjou@email.dz', '78 Rue de la Liberté', 'Béjaïa', 'Béjaïa', NULL, 'Adjou Fatima (mère)', '0669111223', '2024-02-01', NULL, NULL, NULL),
('P-2024-0011', 'Aiboud', 'Katia', '1987-08-14', 'F', 'B-', '0660222333', 'k.aiboud@email.dz', '45 Avenue Amirouche', 'Béjaïa', 'Béjaïa', NULL, 'Aiboud Rachid (frère)', '0660222334', '2024-02-08', 'CNAS', 'CNAS-2024-556', NULL),
('P-2024-0012', 'Alik', 'Nadjet', '1955-09-18', 'F', 'AB+', '0661333444', 'n.alik@email.dz', '34 Rue des Frères Bouadou', 'Alger', 'Alger', 'Latex', 'Alik Mourad (fils)', '0661333445', '2024-02-18', 'CNAS', 'CNAS-2024-667', 'Arthrose, Hypertension'),
('P-2024-0013', 'Alilat', 'Zohra', '1948-02-10', 'F', 'O-', '0662444555', 'z.alilat@email.dz', '67 Boulevard Krim Belkacem', 'Alger', 'Alger', NULL, 'Alilat Farid (fils)', '0662444556', '2024-03-01', 'CNAS', 'CNAS-2024-778', 'Diabète, Arthrite'),
('P-2024-0014', 'Abbad', 'Hiba', '2010-06-20', 'F', 'B+', '0663555666', NULL, '23 Rue Emir Abdelkader', 'Béjaïa', 'Béjaïa', NULL, 'Abbad Ahmed (père)', '0663555667', '2024-01-12', 'CASNOS', 'CASNOS-2024-234', 'Vaccination à jour'),
('P-2024-0015', 'Ait Lounis', 'Mohamed', '1980-10-15', 'M', 'AB+', '0664666777', 'm.aitlounis@email.dz', '89 Avenue de la Soummam', 'Béjaïa', 'Béjaïa', NULL, 'Ait Lounis Djamila (épouse)', '0664666778', '2024-01-18', 'CNAS', 'CNAS-2024-345', NULL),
('P-2024-0016', 'Ait Said', 'Sarah', '2018-08-20', 'F', 'A+', '0665777888', NULL, '45 Avenue Pasteur', 'Béjaïa', 'Béjaïa', 'Pénicilline', 'Ait Said Karim (père)', '0665777889', '2024-02-20', 'CASNOS', 'CASNOS-2024-045', 'Asthme léger'),
('P-2024-0017', 'Agoun', 'Zakaria', '1993-05-08', 'M', 'A-', '0666888999', 'z.agoun@email.dz', '12 Rue Colonel Amirouche', 'Béjaïa', 'Béjaïa', NULL, 'Agoun Nadia (sœur)', '0666889000', '2024-02-25', NULL, NULL, NULL),
('P-2024-0018', 'Alane', 'Amine', '1995-12-30', 'M', 'B+', '0667000111', 'a.alane@email.dz', '89 Avenue de l''Indépendance', 'Béjaïa', 'Béjaïa', NULL, 'Alane Leila (mère)', '0667000112', '2024-01-25', 'CASNOS', 'CASNOS-2024-456', 'Fracture jambe gauche en 2020'),
('P-2024-0019', 'Abbou', 'Riyadh', '1960-04-25', 'M', 'AB+', '0668111222', 'r.abbou@email.dz', '67 Boulevard de la Liberté', 'Sidi-Bel-Abbès', 'Sidi-Bel-Abbès', 'Aspirine', 'Abbou Fatima (épouse)', '0668111223', '2024-03-05', 'CNAS', 'CNAS-2024-567', 'Maladie coronarienne, Diabète'),
('P-2024-0020', 'Abid', 'Abdeldjebbar', '1975-07-18', 'M', 'O+', '0669222333', 'a.abid@email.dz', '23 Rue Ben Badis', 'Sidi-Bel-Abbès', 'Sidi-Bel-Abbès', NULL, 'Abid Zohra (épouse)', '0669222334', '2024-03-10', NULL, NULL, NULL),
('P-2024-0021', 'Achiri', 'Asma', '1978-07-15', 'F', 'A+', '0660333444', 'a.achiri@email.dz', '56 Rue Emir Abdelkader', 'Sidi-Bel-Abbès', 'Sidi-Bel-Abbès', 'Antibiotiques', 'Achiri Karim (époux)', '0660333445', '2024-03-12', 'CNAS', 'CNAS-2024-678', 'Diabète type 2 depuis 2019'),
('P-2024-0022', 'Adem', 'Maroua', '1989-11-22', 'F', 'AB+', '0661444555', 'm.adem@email.dz', '12 Avenue Mohamed Khemisti', 'Sidi-Bel-Abbès', 'Sidi-Bel-Abbès', NULL, 'Adem Rachid (frère)', '0661444556', '2024-03-15', 'CNAS', 'CNAS-2024-789', NULL),
('P-2024-0023', 'Akermi', 'Yahia', '1992-02-28', 'M', 'A+', '0662555666', 'y.akermi@email.dz', '45 Rue Larbi Ben M''hidi', 'Sidi-Bel-Abbès', 'Sidi-Bel-Abbès', NULL, 'Akermi Nadia (sœur)', '0662555667', '2024-03-18', NULL, NULL, NULL),
('P-2024-0024', 'Aid', 'Abderrahmane', '1985-09-05', 'M', 'AB-', '0663666777', 'a.aid@email.dz', '78 Boulevard de la République', 'Sidi-Bel-Abbès', 'Sidi-Bel-Abbès', NULL, 'Aid Fatima (mère)', '0663666778', '2024-03-20', 'CNAS', 'CNAS-2024-890', NULL),
('P-2024-0025', 'Abdelmoumen', 'Hatem Mohamed', '1994-03-15', 'M', 'B-', '0664777888', 'h.abdelmoumen@email.dz', '34 Rue Colonel Lotfi', 'Alger', 'Alger', NULL, 'Abdelmoumen Leila (mère)', '0664777889', '2024-01-28', NULL, NULL, NULL);

-- Insert Medications
INSERT INTO medications (medication_code, commercial_name, generic_name, form, dosage, unit_price, available_stock, minimum_stock, expiration_date, manufacturer, description, prescription_required, reimbursable) VALUES
('MED-001', 'Doliprane 1000mg', 'Paracétamol', 'Comprimé', '1000mg', 150.00, 500, 100, '2026-12-31', 'SAIDAL', 'Antalgique et antipyrétique', FALSE, TRUE),
('MED-002', 'Paracétamol Sirop', 'Paracétamol', 'Sirop', '120mg/5ml', 280.00, 190, 50, '2026-11-30', 'BIOPHARM', 'Pour enfants, antalgique', FALSE, TRUE),
('MED-003', 'Aspégic 1000mg', 'Acide acétylsalicylique', 'Sachet', '1000mg', 280.00, 250, 50, '2026-10-15', 'BIOPHARM', 'Antalgique, antipyrétique', FALSE, TRUE),
('MED-004', 'Amoxicilline 1g', 'Amoxicilline', 'Comprimé', '1g', 450.00, 300, 60, '2026-09-20', 'SAIDAL', 'Antibiotique', TRUE, TRUE),
('MED-005', 'Voltarène 50mg', 'Diclofénac', 'Comprimé', '50mg', 320.00, 200, 40, '2026-08-15', 'IBN SINA', 'Anti-inflammatoire', TRUE, TRUE),
('MED-006', 'Oméprazole 20mg', 'Oméprazole', 'Gélule', '20mg', 290.00, 180, 40, '2026-09-10', 'IBN SINA', 'Inhibiteur pompe à protons', TRUE, TRUE),
('MED-007', 'Prednisolone 20mg', 'Prednisolone', 'Comprimé', '20mg', 210.00, 95, 25, '2027-01-31', 'SAIDAL', 'Corticoïde', TRUE, TRUE),
('MED-008', 'Furosémide 40mg', 'Furosémide', 'Comprimé', '40mg', 180.00, 140, 30, '2026-07-20', 'BIOPHARM', 'Diurétique', TRUE, TRUE),
('MED-009', 'Loratadine 10mg', 'Loratadine', 'Comprimé', '10mg', 160.00, 150, 35, '2027-02-28', 'IBN SINA', 'Antihistaminique', FALSE, TRUE),
('MED-010', 'Calcium 500mg', 'Carbonate de calcium', 'Comprimé', '500mg', 220.00, 200, 50, '2027-03-15', 'SAIDAL', 'Supplément calcique', FALSE, FALSE),
('MED-011', 'Vitamine D3', 'Cholécalciférol', 'Ampoule', '200000 UI', 250.00, 180, 40, '2027-04-30', 'BIOPHARM', 'Supplément vitamine D', FALSE, FALSE),
('MED-012', 'Insuline Lantus', 'Insuline glargine', 'Stylo injectable', '100 UI/ml', 2800.00, 45, 15, '2026-06-15', 'Sanofi Algérie', 'Insuline longue durée', TRUE, TRUE),
('MED-013', 'Augmentin 1g', 'Amoxicilline + Acide clavulanique', 'Comprimé', '1g', 850.00, 180, 40, '2026-08-30', 'Sanofi Algérie', 'Antibiotique à large spectre', TRUE, TRUE),
('MED-014', 'Ceftriaxone Injectable', 'Ceftriaxone', 'Poudre injectable', '1g', 950.00, 90, 20, '2026-05-15', 'SAIDAL', 'Antibiotique injectable', TRUE, TRUE),
('MED-015', 'Atorvastatine 40mg', 'Atorvastatine', 'Comprimé', '40mg', 720.00, 120, 25, '2026-11-25', 'BIOPHARM', 'Hypolipémiant', TRUE, TRUE),
('MED-016', 'Azithromycine 500mg', 'Azithromycine', 'Comprimé', '500mg', 680.00, 110, 30, '2026-10-10', 'IBN SINA', 'Antibiotique macrolide', TRUE, TRUE),
('MED-017', 'Ventoline Spray', 'Salbutamol', 'Spray', '100mcg', 650.00, 80, 20, '2027-02-28', 'GSK Algérie', 'Bronchodilatateur', TRUE, TRUE),
('MED-018', 'Ciprofloxacine 500mg', 'Ciprofloxacine', 'Comprimé', '500mg', 580.00, 5, 20, '2026-06-30', 'SAIDAL', 'Antibiotique quinolone', TRUE, TRUE),
('MED-019', 'Bisoprolol 5mg', 'Bisoprolol', 'Comprimé', '5mg', 520.00, 100, 25, '2026-12-10', 'BIOPHARM', 'Bêta-bloquant', TRUE, TRUE),
('MED-020', 'Losartan 50mg', 'Losartan', 'Comprimé', '50mg', 480.00, 160, 30, '2027-01-10', 'SAIDAL', 'Antihypertenseur', TRUE, TRUE),
('MED-021', 'Metformine 850mg', 'Metformine', 'Comprimé', '850mg', 320.00, 200, 50, '2027-04-05', 'SAIDAL', 'Antidiabétique', TRUE, TRUE),
('MED-022', 'Ranitidine 150mg', 'Ranitidine', 'Comprimé', '150mg', 190.00, 8, 25, '2026-08-20', 'IBN SINA', 'Anti-H2', TRUE, TRUE),
('MED-023', 'Metronidazole 500mg', 'Metronidazole', 'Comprimé', '500mg', 280.00, 12, 18, '2026-07-15', 'BIOPHARM', 'Antibiotique antiprotozoaire', TRUE, TRUE),
('MED-024', 'Cardioaspirine 100mg', 'Acide acétylsalicylique', 'Comprimé', '100mg', 210.00, 180, 40, '2027-05-30', 'SAIDAL', 'Antiagrégant plaquettaire', TRUE, TRUE),
('MED-025', 'Lévothyroxine 100mcg', 'Lévothyroxine', 'Comprimé', '100mcg', 380.00, 150, 35, '2026-11-15', 'BIOPHARM', 'Hormone thyroïdienne', TRUE, TRUE);

-- Insert Consultations
INSERT INTO consultations (patient_id, doctor_id, consultation_date, reason, diagnosis, observations, blood_pressure, temperature, weight, height, status, amount, paid, notes) VALUES
(1, 6, '2025-01-15 09:30:00', 'Fièvre et toux depuis 3 jours', 'Grippe saisonnière', 'Repos recommandé, hydratation abondante', '110/70', 38.5, 25.5, 120.0, 'Completed', 2500.00, TRUE, 'Arrêt scolaire 5 jours'),
(2, 1, '2025-01-18 10:00:00', 'Contrôle hypertension', 'Hypertension artérielle bien contrôlée', 'Continuer traitement actuel', '135/85', 36.8, 72.0, 165.0, 'Completed', 1500.00, TRUE, NULL),
(5, 4, '2025-01-20 14:30:00', 'Éruption cutanée', 'Eczéma de contact', 'Éviter allergènes, crème corticoïde', '120/80', 36.7, 78.0, 175.0, 'Completed', 2800.00, TRUE, NULL),
(7, 1, '2025-01-22 11:00:00', 'Glycémie instable', 'Diabète type 2 en déséquilibre', 'Ajuster traitement, régime strict', '145/92', 36.6, 88.0, 170.0, 'Completed', 1500.00, TRUE, NULL),
(4, 1, '2025-01-25 09:00:00', 'Douleurs abdominales', 'Gastrite aiguë', 'Régime alimentaire, IPP', '125/78', 36.9, 65.0, 168.0, 'Completed', 1500.00, FALSE, NULL),
(12, 16, '2025-02-03 10:30:00', 'Douleur genou droit', 'Arthrose débutante', 'Kinésithérapie recommandée', '145/88', 36.6, 68.0, 158.0, 'Completed', 3000.00, TRUE, NULL),
(19, 4, '2025-02-05 15:00:00', 'Douleur thoracique à l''effort', 'Angor stable', 'Repos, traitement antianginal, ECG de contrôle', '160/95', 36.8, 82.0, 172.0, 'Completed', 3500.00, TRUE, 'Consultation cardiologie urgente'),
(21, 1, '2025-02-08 11:15:00', 'Suivi diabète', 'Diabète type 2 stable', 'Glycémie correcte, poursuivre traitement', '140/90', 36.7, 85.0, 162.0, 'Completed', 1500.00, TRUE, NULL),
(3, 10, '2025-02-10 14:00:00', 'Consultation de grossesse 2ème trimestre', 'Grossesse normale évolutive', 'Tout va bien, échographie normale', '115/70', 36.8, 68.0, 167.0, 'Completed', 3200.00, TRUE, NULL),
(8, 1, '2025-02-12 09:30:00', 'Céphalées fréquentes', 'Migraine commune', 'Traitement de crise', '130/82', 36.7, 70.0, 164.0, 'Completed', 1500.00, FALSE, NULL),
(14, 7, '2025-02-14 10:15:00', 'Angine rouge', 'Angine virale', 'Antalgiques, antiseptiques locaux', '105/68', 38.2, 32.0, 142.0, 'Completed', 2500.00, TRUE, 'Arrêt scolaire 3 jours'),
(16, 6, '2025-02-14 09:00:00', 'Crise d''asthme', 'Asthme allergique', 'Traitement de fond à instaurer', '110/65', 36.9, 18.5, 110.0, 'In Progress', 2500.00, FALSE, NULL),
(6, 1, '2025-02-15 10:00:00', 'Fatigue généralisée', 'Syndrome grippal', 'Repos, hydratation', '118/75', 37.8, 75.0, 178.0, 'Completed', 1500.00, FALSE, NULL),
(13, 15, '2025-02-16 11:30:00', 'Vertiges', 'Vertige positionnel paroxystique bénin', 'Manœuvres de Dix-Hallpike', '155/90', 36.6, 72.0, 162.0, 'Completed', 3500.00, TRUE, NULL),
(22, 11, '2025-02-18 14:30:00', 'Pertes blanches', 'Mycose vaginale', 'Traitement antifongique local et oral', '120/75', 36.7, 65.0, 165.0, 'Completed', 3200.00, TRUE, NULL),
(9, 1, '2025-02-20 09:15:00', 'Mal de gorge', 'Pharyngite virale', 'Antalgiques, collutoire', '115/72', 37.5, 62.0, 170.0, 'Completed', 1500.00, TRUE, NULL),
(20, 8, '2025-02-22 15:45:00', 'Douleur oreille droite', 'Otite moyenne aiguë', 'Antibiotiques nécessaires', '125/80', 38.0, 78.0, 175.0, 'Completed', 2600.00, FALSE, NULL),
(23, 1, '2025-02-25 10:30:00', 'Rhinite allergique', 'Rhinite allergique saisonnière', 'Antihistaminiques', '120/78', 36.8, 68.0, 172.0, 'Completed', 1500.00, FALSE, NULL),
(15, 5, '2025-02-26 14:00:00', 'Entorse cheville gauche', 'Entorse bénigne', 'Repos, glace, bandage', '122/79', 36.7, 82.0, 176.0, 'Completed', 3000.00, TRUE, NULL),
(10, 12, '2025-02-28 09:00:00', 'Acné du visage', 'Acné juvénile modérée', 'Traitement local et systémique', '118/74', 36.8, 68.0, 180.0, 'Completed', 2800.00, TRUE, NULL),
(24, 1, '2025-03-01 11:00:00', 'Toux sèche persistante', 'Trachéite', 'Antitussifs, hydratation', '120/80', 36.9, 75.0, 178.0, 'Completed', 1500.00, FALSE, NULL),
(25, 1, '2025-03-03 10:15:00', 'Bilan de santé', 'Aucune anomalie détectée', 'Bon état général', '115/75', 36.7, 72.0, 182.0, 'Completed', 1500.00, TRUE, NULL),
(11, 16, '2025-03-05 15:00:00', 'Douleur épaule droite', 'Tendinite sus-épineuse', 'Repos, AINS, kinésithérapie', '128/82', 36.8, 65.0, 168.0, 'Completed', 3000.00, TRUE, NULL),
(17, 14, '2025-03-07 09:30:00', 'Troubles visuels', 'Myopie légère', 'Correction optique nécessaire', '120/78', 36.7, 70.0, 175.0, 'Completed', 2800.00, TRUE, NULL),
(18, 16, '2025-03-08 14:30:00', 'Douleur lombaire', 'Lombalgie commune', 'Repos relatif, AINS', '125/80', 36.8, 82.0, 178.0, 'Completed', 3000.00, FALSE, NULL),
(5, 4, '2025-03-10 10:00:00', 'Contrôle dermatologique', 'Eczéma bien contrôlé', 'Poursuivre traitement actuel', '118/76', 36.7, 78.0, 175.0, 'Completed', 2800.00, TRUE, NULL),
(7, 2, '2025-03-12 11:30:00', 'Essoufflement', 'Insuffisance cardiaque légère', 'Traitement diurétique, régime sans sel', '150/92', 36.8, 90.0, 170.0, 'Completed', 3500.00, TRUE, NULL),
(2, 4, '2025-03-14 09:00:00', 'Suivi hypertension', 'HTA équilibrée sous traitement', 'Continuer traitement', '132/84', 36.7, 72.0, 165.0, 'Completed', 2800.00, TRUE, NULL),
(6, 16, '2025-03-15 10:30:00', 'Douleur épaule', NULL, NULL, NULL, NULL, 82.0, 178.0, 'Scheduled', 3000.00, FALSE, 'RDV programmé'),
(19, 4, '2025-03-16 14:00:00', 'Suivi cardiologie', NULL, NULL, NULL, NULL, 75.0, 172.0, 'Scheduled', 3500.00, FALSE, 'Contrôle ECG');

-- Insert Prescriptions
INSERT INTO prescriptions (consultation_id, prescription_date, treatment_duration, general_instructions) VALUES
(1, '2025-01-15 10:00:00', 7, 'Prendre les médicaments après les repas. Repos complet pendant 7 jours. Boire beaucoup d''eau.'),
(2, '2025-01-18 10:30:00', 30, 'Continuer le traitement antihypertenseur. Contrôle tension artérielle 2x/semaine. RDV dans 1 mois.'),
(3, '2025-01-20 15:00:00', 14, 'Appliquer crème 2 fois par jour sur zones affectées. Éviter contact avec allergènes identifiés.'),
(4, '2025-01-22 11:30:00', 90, 'Prendre metformine matin et soir. Régime alimentaire strict. Activité physique modérée 30min/jour.'),
(5, '2025-01-25 09:30:00', 14, 'Prendre à jeun le matin. Éviter aliments épicés et café. Fractionner les repas.'),
(6, '2025-02-03 11:00:00', 14, 'En cas de douleur uniquement (max 3/jour). Séances kiné 3x/semaine.'),
(7, '2025-02-05 15:30:00', 30, 'Prendre régulièrement à heure fixe. Repos complet. Éviter stress et efforts. Consultation cardiologie urgente.'),
(8, '2025-02-08 11:45:00', 90, 'Poursuivre traitement antidiabétique. Surveillance glycémie quotidienne. Régime strict.'),
(9, '2025-02-10 14:30:00', 90, 'Supplémentation recommandée. Alimentation équilibrée. Repos suffisant.'),
(10, '2025-02-12 10:00:00', 7, 'En cas de crise uniquement. Éviter facteurs déclenchants. Repos dans endroit calme.'),
(11, '2025-02-14 10:45:00', 7, 'Prendre régulièrement. Repos complet. Arrêt scolaire respecté.'),
(12, '2025-02-14 09:30:00', 30, 'Utiliser en cas de crise. Traitement de fond à prendre régulièrement. Consulter si aggravation.'),
(13, '2025-02-15 10:30:00', 5, 'Repos complet. Boire abondamment. Prendre après repas.'),
(15, '2025-02-18 15:00:00', 7, 'Traitement local et oral. Hygiène intime stricte. Éviter rapports pendant traitement.'),
(16, '2025-02-20 09:45:00', 5, 'Gargarismes 3x/jour. Prendre antalgiques si nécessaire.'),
(17, '2025-02-22 16:15:00', 7, 'Prendre après repas. Terminer traitement même si amélioration.'),
(18, '2025-02-25 11:00:00', 30, 'Prendre le matin. Éviter allergènes. Peut causer somnolence.'),
(19, '2025-02-26 14:30:00', 10, 'Appliquer 2-3x/jour. Repos complet membre inférieur. Surélever jambe.'),
(20, '2025-02-28 09:30:00', 60, 'Traitement local matin et soir. Nettoyage doux peau. Éviter soleil.'),
(21, '2025-03-01 11:30:00', 7, 'Prendre après repas. Hydratation abondante. Éviter irritants.'),
(23, '2025-03-05 15:30:00', 14, 'AINS pendant repas. Kiné 3x/semaine. Repos relatif épaule.'),
(25, '2025-03-08 15:00:00', 10, 'Pendant repas pour éviter gastrite. Repos relatif. Exercices étirements.'),
(26, '2025-03-10 10:30:00', 30, 'Continuer crème hydratante. Éviter savons agressifs.'),
(27, '2025-03-12 12:00:00', 30, 'Prendre le matin à jeun. Régime sans sel strict. Surveiller poids.'),
(28, '2025-03-14 09:30:00', 30, 'Continuer traitement. Contrôle tension 2x/semaine.'),
(30, '2025-03-16 14:30:00', 30, 'Prendre à heure fixe. Surveillance tension artérielle. Repos.');

-- Insert Prescription Details
INSERT INTO prescription_details (prescription_id, medication_id, quantity, dosage_instructions, duration, total_price) VALUES
-- Prescription 1: Grippe (Wassim)
(1, 1, 21, '1 comprimé 3 fois par jour après repas', 7, 3150.00),
(1, 11, 1, '1 ampoule en prise unique', 1, 250.00),

-- Prescription 2: HTA (Zoulikha)
(2, 20, 30, '1 comprimé le matin à jeun', 30, 14400.00),

-- Prescription 3: Eczéma (Ismail)
(3, 7, 14, '1 comprimé par jour', 14, 2940.00),

-- Prescription 4: Diabète (Wissam)
(4, 21, 180, '1 comprimé matin et soir pendant repas', 90, 57600.00),
(4, 12, 3, '1 stylo pour 1 mois, injection le soir', 90, 8400.00),

-- Prescription 5: Gastrite (Rahma)
(5, 6, 14, '1 gélule le matin à jeun', 14, 4060.00),

-- Prescription 6: Arthrose (Nadjet)
(6, 1, 14, '1 comprimé si douleur (maximum 3 par jour)', 14, 2100.00),
(6, 5, 14, '1 comprimé matin et soir pendant repas', 14, 4480.00),

-- Prescription 7: Angor (Riyadh)
(7, 24, 30, '1 comprimé le matin', 30, 6300.00),
(7, 19, 30, '1 comprimé le soir', 30, 15600.00),
(7, 6, 30, '1 gélule le matin à jeun', 30, 8700.00),

-- Prescription 8: Diabète suivi (Asma)
(8, 21, 180, '1 comprimé matin et soir', 90, 57600.00),

-- Prescription 9: Grossesse (Massi-Nissa)
(9, 10, 90, '1 comprimé par jour', 90, 19800.00),
(9, 11, 3, '1 ampoule tous les 30 jours', 90, 750.00),

-- Prescription 10: Migraine (Maria)
(10, 1, 10, '2 comprimés dès début crise', 7, 1500.00),

-- Prescription 11: Angine (Hiba)
(11, 2, 1, '10ml 3 fois par jour', 7, 280.00),
(11, 1, 14, '1 comprimé si fièvre (max 3/jour)', 7, 2100.00),

-- Prescription 12: Asthme (Sarah)
(12, 17, 1, '2 bouffées si crise, max 8/jour', 30, 650.00),
(12, 7, 30, '1 comprimé par jour le matin', 30, 6300.00),

-- Prescription 13: Syndrome grippal (Ouassim)
(13, 1, 15, '1 comprimé 3 fois par jour', 5, 2250.00),

-- Prescription 15: Mycose (Maroua)
(15, 23, 14, '1 comprimé 2 fois par jour', 7, 3920.00),

-- Prescription 16: Pharyngite (Aicha Amira)
(16, 3, 5, '1 sachet 2 fois par jour', 5, 1400.00),

-- Prescription 17: Otite (Abdeldjebbar)
(17, 13, 14, '1 comprimé 2 fois par jour', 7, 11900.00),

-- Prescription 18: Rhinite (Yahia)
(18, 9, 30, '1 comprimé par jour', 30, 4800.00),

-- Prescription 19: Entorse (Mohamed Ait Lounis)
(19, 5, 20, '1 comprimé 2 fois par jour pendant repas', 10, 6400.00),

-- Prescription 20: Acné (Amine Adjou)
(20, 16, 6, '1 comprimé par jour', 60, 4080.00),

-- Prescription 21: Trachéite (Hatem)
(21, 1, 15, '1 comprimé 3 fois par jour', 5, 2250.00),

-- Prescription 23: Tendinite (Katia)
(23, 5, 28, '1 comprimé 2 fois par jour', 14, 8960.00),

-- Prescription 25: Lombalgie (Amine Alane)
(25, 5, 20, '1 comprimé 2 fois par jour', 10, 6400.00),

-- Prescription 26: Eczéma contrôle (Ismail)
(26, 7, 30, '1 comprimé par jour si besoin', 30, 6300.00),

-- Prescription 27: IC (Wissam)
(27, 8, 30, '1 comprimé le matin à jeun', 30, 5400.00),
(27, 20, 30, '1 comprimé le matin', 30, 14400.00),

-- Prescription 28: HTA suivi (Zoulikha)
(28, 20, 30, '1 comprimé le matin', 30, 14400.00),

-- Prescription 30: Suivi cardio (Riyadh)
(30, 20, 30, '1 comprimé le matin', 30, 14400.00),
(30, 15, 30, '1 comprimé le soir au coucher', 30, 21600.00),
(30, 24, 30, '1 comprimé le matin (cardioprotection)', 30, 6300.00);
