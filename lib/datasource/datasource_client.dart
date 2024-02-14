import 'package:dio/dio.dart';
import 'package:my_book_shelf/core/app_config.dart';
import 'package:my_book_shelf/models/search_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'datasource_client.g.dart';

@RestApi(baseUrl: AppConfig.baseUrl)
abstract class DatasourceClient {
  factory DatasourceClient(Dio dio, {String baseUrl}) = _DatasourceClient;

  @GET("/volumes?q={bookName}+intitle:")
  Future<SearchEntity> fetchBooks(@Path('bookName') String bookName);
}
