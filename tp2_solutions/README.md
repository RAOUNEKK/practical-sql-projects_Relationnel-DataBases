# SYSTÈME DE GESTION HOSPITALIÈRE ALGÉRIEN
## Projet SQL Complet - 30 Requêtes

---

## APERÇU DU PROJET

Ce projet crée un système complet de gestion hospitalière basé sur le **système de santé publique algérien** avec:
- **10 Spécialités médicales** (Médecine Générale, Cardiologie, Pédiatrie, etc.)
- **17 Médecins** algériens avec noms authentiques et numéros de licence
- **25 Patients** avec noms réels 
- **25 Médicaments** avec prix en DZD et fabricants algériens
- **30 Consultations** avec diagnostics, signes vitaux et traitements
- **30 Ordonnances** avec médicaments prescrits et instructions
- **70+ Lignes de prescriptions** détaillées avec calcul des coûts

### 🇩🇿 Spécificités Algériennes

- **Soins de santé publics** - Système CNAS/CASNOS
- **Consultations à tarifs réglementés** - Prix en DZD (Dinar Algérien)
- **Médicaments locaux** - Produits par SAIDAL, BIOPHARM, IBN SINA
- **Numéros de dossier médical** - Format: P-2024-0001
- **Noms authentiques** - Patients issus du concours ESI 2022
- **Provinces algériennes** - Alger, Béjaïa, Sidi-Bel-Abbès

---

## STRUCTURE DE LA BASE DE DONNÉES

### Tables créées:
1. **specialties** - Spécialités médicales avec tarifs de consultation
2. **doctors** - Médecins avec spécialités, numéros de licence et cabinets
3. **patients** - Dossiers patients avec assurances, allergies et historique médical
4. **medications** - Catalogue de médicaments avec formes, dosages et statut prescription
5. **consultations** - Consultations médicales avec signes vitaux et diagnostics
6. **prescriptions** - Ordonnances avec durée de traitement et instructions
7. **prescription_details** - Détails des médicaments prescrits avec calcul des coûts

### Relations:
- Les médecins appartiennent aux spécialités (N-1)
- Les patients consultent les médecins (N-N via consultations)
- Les consultations génèrent des ordonnances (1-1 ou 1-N)
- Les ordonnances contiennent plusieurs médicaments (N-N via prescription_details)

---

##  INSTRUCTIONS D'INSTALLATION

### Étape 1: Créer la base de données
```sql
CREATE DATABASE hospital_db;
USE hospital_db;
```

### Étape 2: Exécuter le schéma
Exécutez le fichier: `create_schema.sql`

### Étape 3: Insérer les données
Exécutez le fichier: `insert_data.sql`

### Étape 4: Tester les requêtes
Exécutez le fichier: `queries_solutions.sql`

**OU simplement exécutez**: `complete_setup.sql` (tout en un)

---

## RÉPARTITION DES REQUÊTES

### PARTIE 1: REQUÊTES BASIQUES (Q1-Q5)
Requêtes SELECT simples avec clauses WHERE

### PARTIE 2: REQUÊTES AVEC JOINTURES (Q6-Q10)
Combinaison de données de plusieurs tables

### PARTIE 3: FONCTIONS D'AGRÉGATION (Q11-Q15)
Calculs de statistiques et résumés

### PARTIE 4: REQUÊTES AVANCÉES (Q16-Q20)
Filtrage complexe et analyses

### PARTIE 5: SOUS-REQUÊTES (Q21-Q25)
Requêtes imbriquées pour comparaisons

### PARTIE 6: ANALYSE MÉTIER (Q26-Q30)
Requêtes d'intelligence d'affaires réelles

---

## PATIENTS DANS LA BASE DE DONNÉES

**Alger (15 patients):**
1. Abahri Wassim (M, O+) - Enfant, avec assurance CNAS
2. Abbaci Zoulikha (F, A+) - Allergie: Pénicilline, assurance CNAS
3. Abboud Massi-Nissa (F, O-) - Adulte, sans assurance
4. Abdelhamid Rahma (F, A-) - Allergie: Iode, assurance CNAS
5. Abderrezague Ismail (M, AB-) - Adulte, sans assurance
6. Aidouni Sid Ahmed Ouassim (M, O+) - Assurance CASNOS
7. Aissaoui Wissam (M, A+) - Diabète type 2, assurance CNAS
8. Ait Ferhat Maria (F, B+) - Hypertension, assurance CNAS
9. Alik Nadjet (F, AB+) - Senior, allergies: Latex, assurance CNAS
10. Alilat Zohra (F, O-) - Senior, diabète et arthrite, assurance CNAS
11. Abdelmoumen Hatem Mohamed (M, B-) - Adulte, sans assurance

**Béjaïa (8 patients):**
1. Addou Aicha Amira (F, B+) - Assurance CASNOS
2. Adjou Amine (M, O-) - Sans assurance
3. Aiboud Katia (F, B-) - Assurance CNAS
4. Abbad Hiba (F, B+) - Enfant, assurance CASNOS
5. Ait Lounis Mohamed (M, AB+) - Assurance CNAS
6. Ait Said Sarah (F, O+) - Enfant, allergie pénicilline, asthme, CASNOS
7. Agoun Zakaria (M, A-) - Sans assurance
8. Alane Amine (M, B+) - Fracture 2020, assurance CASNOS

**Sidi-Bel-Abbès (6 patients):**
1. Abbou Riyadh (M, AB+) - Senior, allergie aspirine, maladie coronarienne, CNAS
2. Abid Abdeldjebbar (M, O+) - Sans assurance
3. Achiri Asma (F, A+) - Allergie antibiotiques, diabète type 2, CNAS
4. Adem Maroua (F, AB+) - Assurance CNAS
5. Akermi Yahia (M, A+) - Sans assurance
6. Aid Abderrahmane (M, AB-) - Assurance CNAS

---

##  MÉDICAMENTS DISPONIBLES

### Médicaments Courants (< 500 DA, sans ordonnance):
- Doliprane 1000mg - 150 DA (Stock: 500)
- Paracétamol Sirop - 280 DA (Stock: 190)
- Aspégic 1000mg - 280 DA (Stock: 250)
- Loratadine 10mg - 160 DA (Stock: 150)
- Calcium 500mg - 220 DA (Stock: 200)
- Vitamine D3 - 250 DA (Stock: 180)

### Médicaments sur Ordonnance (> 500 DA):
- Insuline Lantus - 2800 DA (Stock: 45)
- Augmentin 1g - 850 DA (Stock: 180)
- Ceftriaxone Injectable - 950 DA (Stock: 90)
- Atorvastatine 40mg - 720 DA (Stock: 120)
- Azithromycine 500mg - 680 DA (Stock: 110)
- Ventoline Spray - 650 DA (Stock: 80)
- Ciprofloxacine 500mg - 580 DA (Stock: 5) 
- Losartan 50mg - 480 DA (Stock: 160)

### Médicaments en Rupture de Stock:
- **Ciprofloxacine 500mg**: 5 unités (minimum: 20) - Manque 15
- **Ranitidine 150mg**: 8 unités (minimum: 25) - Manque 17
- **Metronidazole 500mg**: 12 unités (minimum: 18) - Manque 6

---

##  MÉDECINS PAR SPÉCIALITÉ

### Médecine Générale (3 médecins):
- Dr. Benabdallah Karim - Cabinet 101 - License: DZ-MED-2015-001
- Dr. Bouziane Amina - Cabinet 102 - License: DZ-MED-2018-089
- Dr. Hamidi Rachid - Cabinet 103 - License: DZ-MED-2019-134

### Cardiologie (2 médecins):
- Dr. Mansouri Ahmed - Cabinet 201 - License: DZ-MED-2012-045
- Dr. Boudjema Farida - Cabinet 202 - License: DZ-MED-2016-223

### Pédiatrie (2 médecins):
- Dr. Sebaihi Mohamed - Cabinet 301 - License: DZ-MED-2014-078
- Dr. Meziani Soraya - Cabinet 302 - License: DZ-MED-2017-156

### Chirurgie Générale (2 médecins):
- Dr. Sahraoui Leila - Bloc 401 - License: DZ-MED-2011-023
- Dr. Messaoud Djamel - Bloc 402 - License: DZ-MED-2013-167

### Gynécologie-Obstétrique (2 médecins):
- Dr. Belaidi Anissa - Cabinet 501 - License: DZ-MED-2015-234
- Dr. Belhamri Zelikha - Cabinet 502 - License: DZ-MED-2016-098

### Autres Spécialités (6 médecins):
- Dr. Cherif Thanina - Dermatologie - License: DZ-MED-2014-122
- Dr. Khelifi Nadia - ORL - License: DZ-MED-2017-189
- Dr. Benali Youcef - Ophtalmologie - License: DZ-MED-2013-201
- Dr. Larbi Youcef - Neurologie - License: DZ-MED-2012-067
- Dr. Boumediene Samia - Orthopédie - License: DZ-MED-2016-045
- Dr. Benmohamed Hicham - Orthopédie - License: DZ-MED-2018-178

---

## STATISTIQUES DES DONNÉES

### Consultations:
- **Total**: 30 consultations
- **Janvier 2025**: 5 consultations
- **Février 2025**: 18 consultations
- **Mars 2025**: 7 consultations
- **Montant moyen**: ~2,500 DA
- **Statuts**: 26 Completed, 1 In Progress, 3 Scheduled

### Distribution par statut de paiement:
- **Payées**: 19 consultations (63%)
- **Non payées**: 11 consultations (37%)

### Signes vitaux enregistrés:
- **Tension artérielle**: Toutes consultations complétées
- **Température**: Toutes consultations complétées
- **Poids/Taille**: Tous les patients

### Ordonnances:
- **Total**: 30 ordonnances
- **Moyenne**: 2.3 médicaments par ordonnance
- **Durée moyenne traitement**: 30 jours

### Top 5 Médicaments Prescrits:
1. **Losartan 50mg**: Prescrit 5 fois (antihypertenseur)
2. **Doliprane 1000mg**: Prescrit 5 fois (antalgique)
3. **Atorvastatine 40mg**: Prescrit 3 fois (hypolipémiant)
4. **Metformine 850mg**: Prescrit 2 fois (antidiabétique)
5. **Voltarène 50mg**: Prescrit 3 fois (anti-inflammatoire)

---

##  DONNÉES FINANCIÈRES

### Revenus par Spécialité (Consultations payées):
1. **Médecine Générale**: ~15,000 DA (10 consultations)
2. **Orthopédie**: ~12,000 DA (4 consultations)
3. **Cardiologie**: ~10,500 DA (3 consultations)
4. **Gynécologie**: ~6,400 DA (2 consultations)
5. **Pédiatrie**: ~5,000 DA (2 consultations)

### Valeur du stock de pharmacie:
- **Nombre total de médicaments**: 25
- **Valeur totale du stock**: ~280,000 DA
- **Médicament le plus cher**: Insuline Lantus (2,800 DA)
- **Médicament le moins cher**: Doliprane (150 DA)

---

##  EXEMPLES DE DIAGNOSTICS

### Pathologies Traitées:
- Grippe saisonnière, Hypertension artérielle
- Eczéma de contact, Diabète type 2
- Gastrite aiguë, Arthrose débutante
- Angor stable, Migraine commune
- Angine virale, Asthme allergique
- Syndrome grippal, Vertige positionnel
- Mycose vaginale, Pharyngite virale
- Otite moyenne aiguë, Rhinite allergique
- Entorse cheville, Acné juvénile
- Trachéite, Tendinite sus-épineuse
- Myopie légère, Lombalgie commune
- Insuffisance cardiaque légère
- Grossesse normale (suivi)

---

## CONSEILS DE TEST DES REQUÊTES

### Requêtes basiques (Q1-Q5)
- Doivent retourner plusieurs lignes
- Vérifier que le filtrage fonctionne correctement
- Vérifier ORDER BY

### Requêtes avec jointures (Q6-Q10)
- Vérifier toutes les combinaisons attendues
- LEFT JOIN vs INNER JOIN
- CONCAT pour noms complets

### Requêtes d'agrégation (Q11-Q15)
- Vérifier l'exactitude des calculs
- ROUND à 2 décimales
- GROUP BY correct

### Requêtes avancées (Q16-Q20)
- Q16: Top 5 médicaments
- Q17: Patients sans consultations
- Q19: Consultations non payées 
- Q20: Médicaments expirant < 6 mois

### Requêtes avec sous-requêtes (Q21-Q25)
- Vérifier les sous-requêtes
- Comparaisons avec moyennes

### Analyse métier (Q26-Q30)
- Q26: Revenus par médecin (payé seulement)
- Q27: Top 3 spécialités (RANK function)
- Q28: Liste de réapprovisionnement
- Q29: Moyenne médicaments/ordonnance
- Q30: Démographie par groupe d'âge



---


## TERMINOLOGIE MÉDICALE ALGÉRIENNE

### Types d'évaluation:
- **Contrôle** = Consultation de suivi
- **Examen** = Consultation complète
- **IPP** = Inhibiteur de la Pompe à Protons
- **ECG** = Électrocardiogramme
- **AINS** = Anti-Inflammatoires Non Stéroïdiens

### Statuts:
- **Scheduled** = Programmée mais pas encore effectuée
- **In Progress** = En cours
- **Completed** = Consultation effectuée
- **Cancelled** = Consultation annulée
- **paid = TRUE** = Consultation réglée
- **paid = FALSE** = En attente de paiement

### Fabricants algériens:
- **SAIDAL** = Société Algérienne des Industries Pharmaceutiques (publique)
- **BIOPHARM** = Laboratoire pharmaceutique algérien
- **IBN SINA** = Laboratoire pharmaceutique privé algérien

### Assurances:
- **CNAS** = Caisse Nationale des Assurances Sociales (salariés)
- **CASNOS** = Caisse Nationale de Sécurité Sociale des Non-Salariés

### Provinces:
- **Alger (16)** = Capitale, région Centre
- **Béjaïa (06)** = Kabylie, région Nord-Est
- **Sidi-Bel-Abbès (22)** = Région Ouest

---

##  EXEMPLES D'UTILISATION

### Exemple 1: Trouver tous les patients allergiques
```sql
SELECT file_number, CONCAT(last_name, ' ', first_name) AS patient_name, allergies
FROM patients
WHERE allergies IS NOT NULL;
```

### Exemple 2: Calculer le revenu total d'un médecin
```sql
SELECT 
    CONCAT(d.last_name, ' ', d.first_name) AS doctor_name,
    SUM(c.amount) AS total_revenue
FROM doctors d
INNER JOIN consultations c ON d.doctor_id = c.doctor_id
WHERE d.doctor_id = 1 AND c.paid = TRUE
GROUP BY d.doctor_id, d.last_name, d.first_name;
```

### Exemple 3: Lister les médicaments d'une ordonnance
```sql
SELECT 
    m.commercial_name,
    pd.quantity,
    pd.dosage_instructions,
    m.unit_price,
    pd.total_price
FROM prescription_details pd
INNER JOIN medications m ON pd.medication_id = m.medication_id
WHERE pd.prescription_id = 1;
```


---
