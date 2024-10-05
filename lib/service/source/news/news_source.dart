import 'package:demo_application/model/response/response.dart';

abstract class NewsSource {
  Future<NewsHeadlineRespDto> getNewsHeadline(
      String query, int pageSize, int page, String? date, String? to);


  Future<NewsHeadlineRespDto> getHeadline(
      String? country,
       int pageSize,
       int page,
      );
}
