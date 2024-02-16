import 'dart:async';
import 'package:my_book_shelf/core/app_config.dart';
import 'package:my_book_shelf/features/data/datasource/datasource.dart';
import 'package:my_book_shelf/features/data/datasource/datasource_client.dart';
import 'package:my_book_shelf/features/domain/entities/search_entity.dart';

class BookRepository {
  static late DatasourceClient apiClient;

  static void init() {
    apiClient =
        DatasourceClient(Datasource.getDio(), baseUrl: AppConfig.baseUrl);
  }

  static Future<SearchEntity?> fetchBooks({required String bookName}) async {
    try {
      return await apiClient.fetchBooks(bookName);
    } catch (_) {
      return null;
    }
  }
}
