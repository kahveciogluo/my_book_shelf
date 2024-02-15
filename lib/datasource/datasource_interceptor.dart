import 'package:dio/dio.dart';
import 'package:my_book_shelf/core/app_globals.dart';
import 'package:my_book_shelf/features/widgets/app_snackbar.dart';

class DatasourceInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add headers, authentication tokens, or perform any pre-request actions here
    // For example, adding a common header for authorization
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Handle the response here if needed
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppGlobals.globalKey.currentState!.showSnackBar(
        AppSnackBar.snackBar(message: err.message ?? "Sistem Hatası"));
    super.onError(err, handler);
  }
}
