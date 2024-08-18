import 'package:demo_application/config/dio/news_dio_config.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../model/response/response.dart';

part 'news_api.g.dart';

@RestApi(baseUrl: newsBaseUrl)
abstract class NewsApi {
  factory NewsApi(Dio dio, {String baseUrl}) = _NewsApi;

  @GET('/top-headlines')
  Future<NewsHeadlineRespDto> getNewsHeadline(
    @Query('country') String country,
    @Query('q') String? query,
    @Query('category') String? category,
  );
}
