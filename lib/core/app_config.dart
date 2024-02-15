import 'package:flutter/material.dart';

class AppConfig {
  /// MARK: Theme
  static const String appFontFamily = "Quicksand";

  /// MARK: Datasource
  static const String baseUrl = "https://www.googleapis.com/books/v1";

  /// MARK: Language
  static const langPath = "assets/lang";
  static const trLocale = Locale("tr", "TR");
  static const enLocale = Locale("en", "US");

  /// MARK: Database
  static const favoritesBox = "favorite_books";
}
