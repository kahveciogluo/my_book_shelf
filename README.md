# my_book_shelf

## About
This Flutter project is a mobile application that allows users to manage their favorite books. The app design with Clean Architecture and uses the Google Books API for searching books, Dio for handling HTTP requests, Hive for local database storage, and the BLoC pattern for state management.

### Flutter Version
Flutter 3.16.9 • channel stable
### Dart Version
Dart 3.2.6 • DevTools 2.28.5

## Getting Started
To get started, you will need to have the following installed:
```bash
 dependencies:
  flutter:
    sdk: flutter
  # ----- Datasource -----
  dio: ^5.4.0
  retrofit: ^4.1.0
  # ----- Database -----
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  # ----- State Management -----
  flutter_bloc: ^8.1.4
  equatable: ^2.0.5
  # ----- l10n -----
  easy_localization: ^3.0.4
  # ----- Network Image -----
  cached_network_image: ^3.3.1
  # ----- Responsive UI -----
  responsive_sizer: ^3.3.0+1
  # ----- Json Annotation -----
  json_annotation: ^4.8.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0
  build_runner: ^2.4.8
  json_serializable: ^6.7.1
  retrofit_generator: ^8.1.0
  hive_generator: ^2.0.1
```
Once you have these added to pubsecp.yaml, you can clone the repository and run the following command step by step

```bash
$ flutter clean
$ flutter pub get
$ cd ios && pod install
$ dart run build_runner build --delete-conflicting-outputs
$ dart run easy_localization:generate -O lib/core/lang -f keys -o locale_keys.g.dart -S assets/lang
```

### App Video

![my_book_shelf_app_video] (https://github.com/kahveciogluo/my_book_shelf/assets/80224415/9629b7fb-a0ab-4306-99fc-2cbbd6089a44)





