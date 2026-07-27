# Structure du dossier — Bloc 4

**RNCP 39583 — Expert en Développement Logiciel**
**Bloc 4 : Maintenir l'application logicielle en condition opérationnelle**
Projet *BrackX* — Agence CDS (fictif) — Candidat : Enzo ANGOT

> Logique du dossier : chaque section correspond à une compétence de la grille du Bloc 4,
> présentées dans l'ordre du cycle de maintien en condition opérationnelle
> (surveiller → détecter/corriger → améliorer et tracer).
> Le dossier prend le relais du Bloc 2 : la V1 de BrackX est livrée et exploitée,
> ce dossier documente son maintien en conditions opérationnelles (MCO).
> Limite : **20 pages hors annexes**. Cible : ~18 pages. Aucune compétence éliminatoire au Bloc 4.

---

## Introduction et contexte du maintien en condition opérationnelle (1,5 page)
- Rappel synthétique du projet BrackX (application web de tournois multi-phases configurables)
- Pont Bloc 2 → Bloc 4 : la V1 est livrée, déployée et exploitée ; on passe de la *réalisation* au *maintien en condition opérationnelle*
- Rappel très bref de la stack et de la chaîne CI/CD héritées du Bloc 2 (GitLab CI, image Docker, tags sémantiques) — non rejustifiée
- Périmètre du MCO : dépendances, supervision, anomalies, améliorations, versions, support
- Lien vers le dépôt Git + préproduction en ligne, annonce du plan

## Chapitre 1 : Maintien en condition opérationnelle (6 pages)

### 1.1 — C4.1.1 — Gestion des mises à jour des dépendances (3 pages)
- Processus de veille : surveillance régulière des nouvelles versions (Dependabot / Renovate, `npm outdated`, avis de sécurité GitLab)
- **Fréquence** des mises à jour (ex : hebdomadaire pour la sécurité, mensuelle pour les mineures, trimestrielle pour les majeures)
- **Périmètre logiciel concerné** (dépendances back NestJS/Prisma, front Angular, image Docker de base, actions/outils CI)
- **Type de mise à jour** : automatique (patch/mineure via PR auto + CI verte) vs manuelle (majeure, breaking changes) avec évaluation d'impact
- Intégration sécurisée : `npm audit`, passage obligatoire par la CI (lint + tests + build) avant fusion
- *Livrable grille : la description du processus de mise à jour des dépendances (fréquence, périmètre, type)*

### 1.2 — C4.1.2 — Système de supervision et d'alerte (3 pages)
- Périmètre de supervision adapté à la typologie (application web conteneurisée : disponibilité HTTP, base PostgreSQL, ressources conteneur)
- **Sondes** mises en place et leur finalité : healthcheck applicatif (`/health`), healthcheck base, uptime externe (UptimeRobot), logs applicatifs
- **Indicateurs de suivi** pertinents et **critères de qualité/performance** : disponibilité (uptime %), temps de réponse API, taux d'erreurs 5xx, usage CPU/mémoire
- Modalités de **signalement** (alerte e-mail / webhook en cas d'indisponibilité ou de seuil dépassé)
- Garantie de disponibilité permanente du logiciel
- *Livrable grille : la description du système de supervision (sondes, critères, disponibilité)*

## Chapitre 2 : Détection et correction des anomalies (6 pages)

### 2.1 — C4.2.1 — Consignation des anomalies (3 pages)
- Processus de **collecte** structuré et adapté à la typologie du logiciel (canaux : supervision, retours utilisateurs/support, logs)
- Outil de consignation (issues GitLab, gabarit de ticket de bogue)
- Contenu d'une **fiche de consignation** : identifiant, environnement, étapes de reproduction, résultat attendu/obtenu, sévérité, logs/captures
- Présentation d'une **fiche complète d'une anomalie réelle** rencontrée au cours du projet (avec analyse et préconisations de correction)
- *Livrable grille : la description du processus de collecte/consignation + une fiche de consignation d'une anomalie*

### 2.2 — C4.2.2 — Création et déploiement d'un correctif (3 pages)
- Reprise de l'anomalie consignée en 2.1 : de la reproduction au correctif
- **Traitement tirant profit du CI/CD** : branche `fix/…`, commit conventionnel, PR, pipeline CI (lint + tests de non-régression), déploiement par tag correctif (ex : `v1.0.1`)
- **Description du correctif** mis en place (cause racine, modification apportée, test ajouté) et vérification de la résolution
- Retour à un état stable, traçabilité du hotfix
- *Livrable grille : la présentation du traitement d'une anomalie détectée au cours du projet*

## Chapitre 3 : Amélioration continue et suivi des versions (6 pages)

### 3.1 — C4.3.1 — Axes d'amélioration (2,5 pages)
- Analyse des **indicateurs de performance** (issus de la supervision) et des **retours utilisateurs** (support, recette)
- **Recommandations argumentées** d'amélioration, chacune évaluée : gain attendu, coût, délai de mise en œuvre, faisabilité au regard du projet
- Priorisation (ex : matrice valeur/effort) et lien avec l'attractivité du logiciel
- *Livrable grille : la présentation des recommandations argumentées d'amélioration*

### 3.2 — C4.3.2 — Journal des versions déployées (2 pages)
- Tenue d'un **journal des versions** (`CHANGELOG.md`) suivant les tags sémantiques
- Contenu par version : anomalies corrigées, nouvelles fonctionnalités, correctifs **documentés**
- Lien avec les Conventional Commits et le processus de déploiement (traçabilité des évolutions)
- Extrait d'un exemplaire du journal de version
- *Livrable grille : la présentation d'un exemplaire du journal de version*

### 3.3 — C4.3.3 — Collaboration avec le support (2 pages)
- Contexte d'un **retour client** réel (via l'équipe support / le commanditaire) et explication du problème à résoudre
- **Résolution apportée** en fournissant une expertise technique
- Explication de la **contribution des différentes parties prenantes** (support, développeur, commanditaire)
- *Livrable grille : un exemple de problème résolu en collaboration avec le support client*

## Conclusion et bilan du maintien en condition opérationnelle (1 page)
- Bilan du MCO : disponibilité tenue, anomalies traitées, versions livrées
- Points forts (chaîne CI/CD réutilisée pour les correctifs, supervision légère mais efficace)
- Points d'amélioration et perspectives (industrialisation de la supervision, automatisation accrue des mises à jour)
- Retour d'expérience personnel sur la posture de mainteneur

---

## Annexes (hors comptage des pages)
- **A.** Validation des compétences du Bloc 4 (mapping compétence → section → preuve)
- **B.** Processus de mise à jour des dépendances (config Dependabot/Renovate, rapport `npm audit`, `npm outdated`)
- **C.** Système de supervision (configuration des sondes / healthchecks, captures du tableau de bord d'uptime)
- **D.** Fiche de consignation complète d'une anomalie (gabarit rempli)
- **E.** Traitement d'un correctif (issue → branche `fix/…` → merge request → pipeline CD → tag)
- **F.** Journal des versions déployées (`CHANGELOG.md` complet + `git tag`)
- **G.** Échange avec le support client (fil de la demande et de sa résolution)
- Glossaire des termes techniques et métier

---

## Repères de pagination (cible 18 pages, marge 2 pages)

| Section | Compétence | Pages |
|---|---|---|
| Introduction | — | 1,5 |
| 1.1 | C4.1.1 | 3 |
| 1.2 | C4.1.2 | 3 |
| 2.1 | C4.2.1 | 3 |
| 2.2 | C4.2.2 | 3 |
| 3.1 | C4.3.1 | 2,5 |
| 3.2 | C4.3.2 | 2 |
| 3.3 | C4.3.3 | 2 |
| Conclusion | — | 1 |
| **Total** | | **~20** |

> Cible réelle ~18 pages : viser 2,5 pages sur 1.1/1.2/2.1/2.2 seulement si le contenu le justifie.
> Reporter en annexe tout élément volumineux (configs, captures, changelog complet, fils de discussion).
