import 'package:dio/dio.dart';
import 'package:my_book_shelf/core/app_config.dart';
import 'package:my_book_shelf/features/data/datasource/datasource_interceptor.dart';

class Datasource {
  static Dio? _dio;

  static Dio getDio() {
    if (_dio == null) {
      _dio = Dio();
      _dio!.options.baseUrl = AppConfig.baseUrl;
      _dio!.options.connectTimeout = const Duration(seconds: 5);
      _dio!.options.receiveTimeout = const Duration(seconds: 5);
      _dio!.interceptors.add(DatasourceInterceptor());
    }

    return _dio!;
  }
}
