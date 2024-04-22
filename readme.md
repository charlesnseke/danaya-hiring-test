# Projet de Test de Recrutement Danaya

Ce projet se compose de deux parties : le backend et le frontend.

**REMARQUE** : J'ai placé le frontend dans le répertoire du backend.

- **backend directory**: danaya-hiring-test/
- **frontend directory**: danaya-hiring-test/frontend

## Backend :

le backend expose des rest api documenté avec swagger, avec une base de données h2.
Test écris avec junit 5 et mockito

### Architecture :

- Monolithique
- Hexagonale

### Exigences :

- Spring Boot 3
- Java 17

### Axes d'amélioration :

- Renforcer l'Objet domaine pour réduire l'anémie
- Effectuer des tests d'intégration.
- L'API de pagination devrait retourner la taille totale des données en base de données pour faciliter la pagination
  côté front.

## Frontend :

le frontend en reactjs 18 et bootstrap 5 cdn, utilisation de fetch API native pour l'intégration des API rest.
projet créer avec vite. Gestion d'état avec useContext. Gestion des errors basique avec ErrorBoundary

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
- Gestion des notifications avec react-toastify
