import 'dart:async';
import 'package:my_book_shelf/datasource/datasource.dart';
import 'package:my_book_shelf/datasource/datasource_client.dart';
import 'package:my_book_shelf/models/search_entity.dart';

class BookService {
  static final DatasourceClient _apiClient = Datasource.initDatasourceClient();

  static Future<SearchEntity?> fetchBooks({required String bookName}) async {
    try {
      return await _apiClient.fetchBooks(bookName);
    } catch (_) {
      return null;
    }
  }
}
