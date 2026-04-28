# Testech

Petite app Flutter pour pratiquer **Clean Architecture**, **MVVM** et **Dependency Injection** avec Provider.

## Features

- **Counter** : compteur avec historique des valeurs (état immutable, `copyWith`, persistance via repository)
- **Shopping List** : ajout/suppression d'articles avec `TextField` + `TextEditingController` + `dispose`
- **Magic Button** : démo `async` / `await` + `setState` + cycle de vie (initState / dispose)
- Drawer de navigation entre les écrans

## Architecture

Chaque feature suit une découpe **Clean Architecture** en 3 couches :

```
features/{feature}/
├── domain/        # Entités + interfaces (Dart pur, aucune dépendance Flutter)
│   ├── *_state.dart            # Value objects immutables (copyWith)
│   └── repositories/*.dart     # Interfaces abstraites
├── data/          # Implémentations concrètes des repositories
└── presentation/  # ViewModels (ChangeNotifier) + Widgets (Stateless / Stateful)
```

Le `ViewModel` dépend d'une **interface** `Repository`, pas d'une implémentation concrète. Ça permet :

- de **tester** la logique métier avec un fake sans toucher Flutter
- de **swap l'impl** (RAM → API → SharedPreferences) sans modifier le ViewModel ni l'UI
- d'**isoler** la logique métier de Flutter

C'est l'application du **Dependency Inversion Principle** (le D de SOLID).

## Stack

- Flutter / Dart
- [provider](https://pub.dev/packages/provider) pour le state management
- `ChangeNotifier` pour les ViewModels
- Pattern MVVM côté presentation

## Run

```bash
flutter pub get
flutter run -d chrome
```
