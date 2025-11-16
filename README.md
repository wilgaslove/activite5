# CareConnect - Flutter scaffold

Ce dépôt contient un scaffold minimal d'une application Flutter **CareConnect**.
Il inclut:
- Structure des modèles
- Écrans principaux (placeholders)
- Services Firebase (stubs)
- README d'installation Firebase

## Installation (local)
1. Installer Flutter SDK.
2. Copier ce projet dans un dossier.
3. Ajouter les fichiers de configuration Firebase:
   - `android/app/google-services.json`
   - `ios/Runner/GoogleService-Info.plist`
4. Exécuter:
   ```
   flutter pub get
   flutter run
   ```

## Notes
- Ce scaffold ne contient pas les configurations Firebase réelles.
- Complète `lib/services/firebase_service.dart` selon ton projet Firebase.