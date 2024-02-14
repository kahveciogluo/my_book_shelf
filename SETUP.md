# MyBookShelf Environment Setup Guide

## Flutter Version: Flutter 3.16.9 • channel stable
## Dart Version: Dart 3.2.6 • DevTools 2.28.5

### Setup: Run the following commands step by step
- `flutter clean`
- `flutter pub get`
- `cd ios && pod install` (for iOS)
- `dart run build_runner build --delete-conflicting-outputs` (Code Generation for Models and DatasourceClient)
- `dart run easy_localization:generate -O lib/core/lang -f keys -o locale_keys.g.dart -S assets/lang` (Code Generation for lang)

