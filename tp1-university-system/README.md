#  TP1 : Système de Gestion Universitaire

## 📋 Description
Base de données pour gérer un système universitaire complet : étudiants, professeurs, cours, inscriptions et notes.

## 🗂️ Fichiers fournis

| Fichier | Description |
|---------|-------------|
| `schema.sql` | Structure de la base de données (CREATE TABLE) |
| `data.sql` | Données de test (INSERT INTO) |
| `queries.sql` | 30 questions à résoudre |

##  Objectif
Résoudre les 30 requêtes SQL dans le fichier `queries.sql`

##  Livrables
Créez un fichier `tp1_solutions.sql` contenant vos 30 réponses numérotées.

## 📅 Date limite
**17 février 2026**

##  Installation

```bash
# 1. Créer la base de données
mysql -u root -p < schema.sql

# 2. Insérer les données
mysql -u root -p universite_db < data.sql

# 3. Tester vos requêtes
mysql -u root -p universite_db
