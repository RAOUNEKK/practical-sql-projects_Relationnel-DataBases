# SYSTÈME DE GESTION UNIVERSITAIRE ALGÉRIEN
## Projet SQL Complet - 30 Requêtes

---

## APERÇU DU PROJET

Ce projet crée un système complet de gestion universitaire basé sur le **système d'enseignement supérieur algérien** avec:
- **5 Départements** (Informatique, Mathématiques, Physique, Gestion, Génie Électrique)
- **13 Professeurs** algériens
- **20 Étudiants** avec des noms réels 
- **20 Cours** avec différents crédits
- **48 Inscriptions** avec différents statuts
- **40+ Notes** sur le système algérien (0-20)

### 🇩🇿 Spécificités Algériennes

- **Enseignement gratuit** - Pas de frais de scolarité
- **Matricules** - Numéros d'inscription uniques (format: 232332029109)
- **Notation sur 20** - Système de notation standard algérien
- **Budget en DZD** - Dinar algérien (pas de salaires des professeurs pour simplifier)

---

##  STRUCTURE DE LA BASE DE DONNÉES

### Tables créées:
1. **departments** - Départements académiques avec budgets
2. **professors** - Enseignants avec spécialisations
3. **students** - Dossiers étudiants avec matricules et niveaux (L1, L2, L3)
4. **courses** - Catalogue de cours avec crédits
5. **enrollments** - Inscriptions des étudiants aux cours
6. **grades** - Notes des étudiants (système 0-20)

### Relations:
- Les étudiants appartiennent aux départements (N-1)
- Les professeurs appartiennent aux départements (N-1)
- Les cours appartiennent aux départements (N-1)
- Les cours sont enseignés par des professeurs (N-1)
- Les étudiants s'inscrivent aux cours (N-N via enrollments)
- Les étudiants reçoivent des notes (N-N via grades)

---

##  INSTRUCTIONS D'INSTALLATION

### Étape 1: Créer la base de données
```sql
CREATE DATABASE university_db;
USE university_db;
```

### Étape 2: Exécuter le schéma
Exécutez le fichier: `create_schema.sql`

### Étape 3: Insérer les données
Exécutez le fichier: `insert_data.sql`

### Étape 4: Tester les requêtes
Exécutez le fichier: `queries_solutions.sql`

**OU simplement exécutez**: `complete_setup.sql` (tout en un)

---

##  RÉPARTITION DES REQUÊTES

### PARTIE 1: REQUÊTES BASIQUES (Q1-Q5)
Requêtes SELECT simples avec clauses WHERE

### PARTIE 2: REQUÊTES AVEC JOINTURES (Q6-Q10)
Combinaison de données de plusieurs tables

### PARTIE 3: FONCTIONS D'AGRÉGATION (Q11-Q15)
Calculs de résumés et statistiques

### PARTIE 4: REQUÊTES AVANCÉES (Q16-Q20)
Filtrage complexe et analyse

### PARTIE 5: SOUS-REQUÊTES (Q21-Q25)
Requêtes imbriquées pour comparaisons complexes

### PARTIE 6: ANALYSE MÉTIER (Q26-Q30)
Requêtes d'intelligence d'affaires réelles

---

##  ÉTUDIANTS DANS LA BASE DE DONNÉES

**Informatique:**
1. Abadelia Mohammed Imad Eddine (L3) - Excellent
2. Abbaci Ilham (L3) - Bon, 1 échec
3. Abid Saadia (L2) - Bon
4. Abida Hiba (L2) - Très bon
5. Adjal Anes (L1) - Nouveau
6. Ahdibi Khanssa (L1) - Nouveau

**Mathématiques:**
7. Ait Fella Anissa (L3) - Excellent
8. Ali Abderrahmane Fiche (L3) - Bon
9. Alili Khadidja (L2) - Moyen
10. Aouya Oussama Abdelhadi (L1) - Nouveau

**Physique:**
11. Badsi Chaima (L3) - Bon
12. Baghdadi Ichrak Malek (L2) - Nouveau
13. Bahi Adem Abderrahim (L1) - Nouveau

**Gestion:**
14. Bechiche Toufik (L3) - Excellent
15. Bedrane Sid Ali (L2) - Nouveau
16. Bekki Mustapha Aimen (L1) - Nouveau

**Génie Électrique:**
17. Belaidi Walid (L3) - Bon
18. Belaiouar Abderraouf (L2) - Nouveau
19. Belfaci Younes (L1) - Nouveau
20. Belghait Mohamed (L1) - Nouveau

---

##  STATISTIQUES DES DONNÉES

### Départements:
- Informatique (Budget: 8.5M DZD) - 6 étudiants
- Mathématiques (Budget: 6.2M DZD) - 4 étudiants
- Physique (Budget: 7.8M DZD) - 3 étudiants
- Gestion (Budget: 7M DZD) - 3 étudiants
- Génie Électrique (Budget: 9.5M DZD) - 4 étudiants

### Distribution des performances:
- **Excellents étudiants** (moy > 16): Abadelia, Ait Fella, Bechiche
- **Bons étudiants** (moy 13-16): Abbaci, Abid, Abida, Ali Abderrahmane
- **Étudiants moyens** (moy 10-13): Alili
- **Nouveaux étudiants** (sans notes): 10 étudiants avec inscriptions actives

---

##  CONSEILS DE TEST DES REQUÊTES

### Requêtes basiques (Q1-Q5)
- Doivent retourner plusieurs lignes
- Vérifier que le filtrage fonctionne
- Vérifier que ORDER BY trie correctement

### Requêtes avec jointures (Q6-Q10)
- Vérifier que toutes les combinaisons attendues apparaissent
- Utiliser LEFT JOIN quand approprié
- S'assurer que CONCAT produit des noms lisibles

### Requêtes d'agrégation (Q11-Q15)
- Vérifier l'exactitude des calculs
- ROUND doit produire 2 décimales
- GROUP BY doit grouper correctement

### Requêtes avancées (Q16-Q20)
- Q16: Doit retourner exactement 3 lignes
- Q17: Doit montrer les cours sans inscriptions
- Q18: Vérifier que seuls les étudiants avec "Passed" apparaissent

### Requêtes avec sous-requêtes (Q21-Q25)
- Vérifier que les sous-requêtes retournent les bonnes valeurs
- Vérifier que les comparaisons fonctionnent

### Analyse métier (Q26-Q30)
- Q26: Taux de réussite entre 0-100
- Q27: Classement séquentiel (1, 2, 3...)
- Q30: Seulement les cours > 80% de capacité

---

##  MODÈLES SQL COURANTS

### Modèle 1: Combiner prénom et nom
```sql
CONCAT(last_name, ' ', first_name) AS full_name
```

### Modèle 2: Calcul de pourcentage
```sql
ROUND((COUNT(passed) * 100.0) / COUNT(*), 2) AS percentage
```

### Modèle 3: Trouver les enregistrements sans données liées
```sql
SELECT ... FROM table1
LEFT JOIN table2 ON table1.id = table2.fk_id
WHERE table2.id IS NULL
```

### Modèle 4: Top N enregistrements
```sql
SELECT ... ORDER BY value DESC LIMIT N
```

---

##  COMPÉTENCES SQL DÉMONTRÉES

1. Conception de base de données normalisée
2. Clés étrangères et intégrité référentielle
3. Requêtes SELECT basiques et avancées
4. Opérations JOIN (INNER, LEFT)
5. Fonctions d'agrégation et GROUP BY
6. Sous-requêtes (scalaires, corrélées)
7. Fonctions de fenêtrage pour le classement
8. Expressions CASE pour logique conditionnelle
9. Clause HAVING pour filtrer les agrégats
10. Requêtes d'analyse métier réelles

---


##  TERMINOLOGIE ALGÉRIENNE

### Système de notation:
- **Note sur 20** - Système standard (0-20)
- **Note de passage: 10/20** - Minimum pour réussir
- **Contrôle** - Examen de mi-semestre
- **Examen** - Examen de fin de semestre
- **TP** - Travaux Pratiques
- **TD** - Travaux Dirigés

### Niveaux académiques:
- **L1** - Première année Licence
- **L2** - Deuxième année Licence
- **L3** - Troisième année Licence
- **M1** - Première année Master
- **M2** - Deuxième année Master

### Types de cours:
- **CM** - Cours Magistral
- **TD** - Travaux Dirigés
- **TP** - Travaux Pratiques

---



---

**Fichiers du projet:**
1. `complete_setup.sql` - Configuration complète
2. `create_schema.sql` - Structure de base de données
3. `insert_data.sql` - Données d'exemple
4. `queries_solutions.sql` - Toutes les 30 solutions de requêtes
5. `README.md` - Cette documentation

**Contexte:** Système universitaire algérien   
**Notation:** Système algérien (0-20)  
**Date:** Février 2026  
**Version:** 1.0
**AUTHOR:** HARIZI Raounek Nour El Yakine 