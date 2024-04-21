# Projet de Test de Recrutement Danaya

Ce projet se compose de deux parties : le backend et le frontend.

**REMARQUE** : J'ai placé le frontend dans le répertoire du backend.

## Backend :

### Architecture :
- Monolithique
- Hexagonale

### Exigences :
- Spring Boot 3
- Java 17
- JUnit 5 & Mockito

### Axes d'amélioration :
- Renforcer l'Objet domaine pour réduire l'anémie, et effectuer des tests d'intégration.
- L'API de pagination devrait retourner la taille totale des données en base de données pour faciliter la pagination côté front.

## Frontend :

### Architecture :
- Classique

### Exigences :
- Node.js 21
- npm 10
- Vite

### Axes d'amélioration :
- Implémenter la pagination pour la liste des personnes.
- Effectuer des tests.
- Diviser les champs de mon formulaire en composants pour les rendre réutilisables.
