import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_book_shelf/core/app_config.dart';
import 'package:my_book_shelf/models/book_entity.dart';

class Database {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(BookEntityAdapter());
    Hive.registerAdapter(VolumeInfoAdapter());
    Hive.registerAdapter(ImageLinksAdapter());
    await Hive.openBox<BookEntity>(AppConfig.favoritesBox);
  }

  static Box<BookEntity> getFavorites() =>
      Hive.box<BookEntity>(AppConfig.favoritesBox);
}
