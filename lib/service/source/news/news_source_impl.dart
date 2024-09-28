import 'package:demo_application/model/response/response.dart';
import 'package:demo_application/service/api/news/news_api.dart';
import 'package:demo_application/service/source/news/news_source.dart';

class NewsSourceImpl extends NewsSource {
  final NewsApi newsApi;

  NewsSourceImpl({
    required this.newsApi,
  });

  @override
  Future<NewsHeadlineRespDto> getNewsHeadline(
      String query, int pageSize, int page, String? date, String? to) {
    return newsApi.getNewsHeadline(query, pageSize, page, date, to);
  }

// @override
// Future<NewsHeadlineRespDto> getNewsHeadline(String country, String? query, String? category) {
//   if (category != null) {
//     query = null;
//   }
//
//   return newsApi.getNewsHeadline(country, query, category);
// }
}
