import 'package:demo_application/model/response/response.dart';
import 'package:demo_application/service/api/news/news_api.dart';
import 'package:demo_application/service/source/news/news_source.dart';

import '../../cache/cache.dart';

class NewsSourceImpl extends NewsSource {
  final NewsApi newsApi;
  final MemoryCache memoryCache;

  NewsSourceImpl({
    required this.newsApi,
    required this.memoryCache,
  });

  @override
  Future<NewsHeadlineRespDto> getNewsHeadline(
      String query, int pageSize, int page, String? date, String? to) async {
    var headline = memoryCache.getHeadline(query, pageSize, page, date, to);
    if (headline != null) return headline;
    headline = await newsApi.getNewsHeadline(query, pageSize, page, date, to);
    memoryCache.setHeadline(headline, query, pageSize, page, date, to);
    return headline;
  }

  @override
  Future<NewsHeadlineRespDto> getHeadline(String? country, int pageSize, int page) {
    return newsApi.getHeadline(country, pageSize, page);
  }


}
