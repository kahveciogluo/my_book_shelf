import 'package:easy_localization/easy_localization.dart';

extension StringExtension on String {
  /// MARK: Converts String to Locale
  String get locale => this.tr();
}
