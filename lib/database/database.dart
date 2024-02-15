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

  /// MARK: Get Favorites Database
  static Box<BookEntity> getFavoritesFromDatabase() =>
      Hive.box<BookEntity>(AppConfig.favoritesBox);

  /// MARK: Add Book To Favorites Database
  static addBookToFavoritesDatabase(BookEntity book) async {
    await Database.getFavoritesFromDatabase().add(book);
  }

  /// MARK: Delete Book From Favorites Database
  static deleteBookFromFavoritesDatabase(BookEntity book) async {
    await Database.getFavoritesFromDatabase()
        .values
        .firstWhere((element) => element == book)
        .delete();
  }
}
