import 'package:dio/dio.dart';
import 'package:my_book_shelf/core/app_config.dart';
import 'package:my_book_shelf/datasource/datasource_client.dart';
import 'package:my_book_shelf/datasource/datasource_interceptor.dart';

class Datasource {
  static Dio? _dio;

  static Dio _getDio() {
    if (_dio == null) {
      _dio = Dio();
      _dio!.options.baseUrl = AppConfig.baseUrl;
      _dio!.options.connectTimeout = const Duration(seconds: 5);
      _dio!.options.receiveTimeout = const Duration(seconds: 5);
      _dio!.interceptors.add(DatasourceInterceptor());
    }

    return _dio!;
  }

  static DatasourceClient initDatasourceClient() {
    final dsClient = DatasourceClient(_getDio(), baseUrl: AppConfig.baseUrl);
    return dsClient;
  }
}
