# Structure du dossier — Bloc 2

**RNCP 39583 — Expert en Développement Logiciel**
**Bloc 2 : Concevoir et développer des applications logicielles**
Projet *TournaBracket* — Agence CDS (fictif) — Candidat : Enzo ANGOT

> Logique du dossier : chaque section correspond à une compétence de la grille,
> présentées dans l'ordre du cycle de développement
> (environnement → prototype → tests → sécurité → déploiement → recette → documentation).
> Limite : 30 pages hors annexes. Cible : ~26 pages.
> Compétences **éliminatoires** : C2.2.1, C2.2.2, C2.2.3, C2.3.1.

---

## Introduction et contexte du développement (1 page)
- Rappel synthétique du projet TournaBracket (application web de tournois multi-phases configurables)
- Rappel du périmètre V1/PMV validé en COPIL (commanditaire : Paul-Lucas Estrada, agence CDS)
- Rappel de la stack technique retenue (NestJS, Angular, PostgreSQL, Prisma, Docker) — validée au Bloc 1, non rejustifiée
- Lien vers le dépôt Git livré au jury + période de développement
- Pont entre le Bloc 1 (cadrage) et le Bloc 2 (réalisation), annonce du plan

## Chapitre 1 : Environnement de développement, de test et d'intégration continue (4 pages)

### 1.1 — C2.1.1 — Environnement de déploiement et de test (2 pages)
- Environnement de développement local (VS Code + extensions, Node LTS via .nvmrc, npm + package-lock)
- Les trois environnements distincts (développement / test / production)
- Outils de qualité et de performance (ESLint, Prettier, Husky, Jest, Jasmine/Karma)
- Critères de qualité et de performance retenus (couverture ≥ 70 %, zéro erreur ESLint, temps de réponse API)
- *Livrable grille : protocole de déploiement continu + critères de qualité et de performance*

### 1.2 — C2.1.2 — Intégration continue (2 pages)
- Outil retenu : GitHub Actions (justification)
- Description du pipeline CI (.github/workflows/ci.yml) : checkout → install → lint → build → test → couverture
- Stratégie de branches (main protégée, develop, feature/xxx)
- Garantie de non-régression avant fusion
- *Livrable grille : protocole d'intégration continue*

## Chapitre 2 : Conception et développement du prototype (5 pages) — **ÉLIMINATOIRE**

### 2.1 — C2.2.1 — Prototype de l'application
- Architecture applicative mise en œuvre (rappel bref du schéma validé en C1.5)
- Paradigmes et frameworks : NestJS (modules/DI/Controller-Service-DTO), Angular (composants/Reactive Forms), Prisma (schema-first, migrations, client typé)
- Présentation des fonctionnalités principales (avec captures annotées en annexe) :
  1. Authentification et gestion des rôles (JWT, interceptor Angular, admin/utilisateur)
  2. Création d'un tournoi multi-phases (formats, glisser-déposer)
  3. Configuration des qualifications inter-phases (saut d'étape)
  4. Saisie des résultats et mise à jour du classement (cascade de critères d'égalité)
  5. Affichage du bracket et des classements
  6. Bibliothèque de templates
- Respect des exigences de sécurité visibles dans le prototype (court — détaillé au chap. 3)
- User stories couvertes (5 à 8, format « En tant que… je peux… afin de… »)
- *Livrable grille : architecture maintenable + présentation d'un prototype + frameworks et paradigmes*

## Chapitre 3 : Qualité, sécurité et accessibilité du logiciel (5 pages) — **ÉLIMINATOIRE**

### 3.1 — C2.2.2 — Tests unitaires (2 pages) — **ÉLIMINATOIRE**
- Frameworks de test (Jest backend, Jasmine frontend) et justification
- Stratégie de test (priorité à la logique métier des services)
- Services testés et taux de couverture cible (QualificationService, TiebreakService, MatchesService, AuthService)
- Cas de test représentatif commenté (pattern Arrange/Act/Assert, mocks @nestjs/testing)
- Rapport de couverture (annexe) + analyse honnête des écarts
- *Livrable grille : jeu de tests unitaires couvrant une fonctionnalité demandée*

### 3.2 — C2.2.3 — Sécurité, accessibilité et évolutivité (3 pages) — **ÉLIMINATOIRE**
- **Sécurité — OWASP Top 10** : tableau des 10 failles et mesure mise en place (RoleGuard, bcrypt, Prisma/class-validator, Helmet/CORS, Dependabot, logging…)
- **Accessibilité — RGAA 4.1** : aria-label, labels associés, contraste 4.5:1, navigation clavier, aria-live + limites (vue bracket)
- **Évolutivité** : ajout export statistique, partage public, notifications WebSocket sans refonte
- *Livrable grille : présentation des mesures de sécurité + des actions d'accessibilité (handicap)*

## Chapitre 4 : Déploiement et gestion des versions (2 pages)

### 4.1 — C2.2.4 — Déploiement et gestion des versions
- Gestion des versions : Git + GitHub, tags sémantiques (vX.Y.Z)
- Processus de déploiement en production (merge → tag → CD → images Docker → docker-compose → migrations Prisma)
- Traçabilité des évolutions (Conventional Commits, tableau synthétique des versions)
- Vérification de stabilité à chaque déploiement (smoke tests < 10 min)
- *Livrable grille : historique des versions + dernière version fonctionnelle, fiable et viable*

## Chapitre 5 : Recette et correction des anomalies (5 pages)

### 5.1 — C2.3.1 — Cahier de recettes (3 pages) — **ÉLIMINATOIRE**
- Structure d'un scénario (identifiant, pré-conditions, étapes, résultat attendu/obtenu, statut)
- Catégories couvertes : tests fonctionnels (auth, tournois, qualifications, résultats, robin stage), tests structurels, tests de sécurité
- Cahier complet en annexe C + tableau synthétique des résultats de recette
- *Livrable grille : le cahier de recettes*

### 5.2 — C2.3.2 — Plan de correction des bogues (2 pages)
- Processus de gestion des anomalies (issues GitHub, 4 niveaux de sévérité)
- 2 à 3 bogues réels documentés (description / analyse / correction / commit)
- Bilan de la recette (anomalies traitées avant livraison, reports en TMA justifiés)
- *Livrable grille : le plan de correction des bogues*

## Chapitre 6 : Documentation technique d'exploitation (3 pages)

### 6.1 — C2.4.1 — Documentation technique d'exploitation
- Manuel de déploiement (prérequis, clonage, .env, docker-compose, migrations, smoke tests)
- Manuel d'utilisation (administrateur non technique : compte, template, phases, participants, résultats, classements)
- Manuel de mise à jour (git pull / docker-compose pull / migrate deploy / rollback)
- Documentation d'API auto-générée (Swagger NestJS)
- *Livrable grille : manuel de déploiement + manuel d'utilisation + manuel de mise à jour*

## Conclusion et bilan technique (1 page)
- Bilan de la V1 livrée par rapport au périmètre validé en COPIL
- Points forts techniques (ex : gestion des égalités en cascade, architecture modulaire NestJS)
- Points d'amélioration identifiés (honnêteté : couverture frontend, granularité des erreurs API…)
- Perspectives et évolutions planifiées (export, partage public, notifications, mobile, commentaires)
- Retour d'expérience personnel (montée en compétences)

---

## Annexes (hors comptage des pages)
- **A.** Extraits de code commentés (priorité : QualificationService, TiebreakService)
- **B.** Captures d'écran de l'interface (connexion, création de tournoi, configuration des phases, bracket, classement) — annotées
- **C.** Cahier de recettes complet (scénarios et résultats)
- **D.** Journal des versions Git (`git log --oneline --decorate`)
- **E.** Rapport de couverture des tests (Jest `--coverage`)
- **F.** Documentation Swagger générée par NestJS (optionnel)
- Glossaire des termes techniques et métier

---

## Repères de pagination (cible 26 pages, marge 4 pages)

| Section | Compétence | Pages | Éliminatoire |
|---|---|---|---|
| Introduction | — | 1 | — |
| 1.1 | C2.1.1 | 2 | Non |
| 1.2 | C2.1.2 | 2 | Non |
| 2.1 | C2.2.1 | 5 | **Oui** |
| 3.1 | C2.2.2 | 2 | **Oui** |
| 3.2 | C2.2.3 | 3 | **Oui** |
| 4.1 | C2.2.4 | 2 | Non |
| 5.1 | C2.3.1 | 3 | **Oui** |
| 5.2 | C2.3.2 | 2 | Non |
| 6.1 | C2.4.1 | 3 | Non |
| Conclusion | — | 1 | — |
| **Total** | | **26** | |

> Concentrer l'espace et l'effort sur les sections éliminatoires (2.1, 3.1, 3.2, 5.1).
> Ne pas dépasser 2 pages sur les sections non éliminatoires 1.1, 1.2, 4.1 et 5.2.
> Utiliser la marge de 4 pages en priorité sur le prototype (2.1) et l'OWASP (3.2).
