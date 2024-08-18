

import 'package:demo_application/model/response/response.dart';

abstract class NewsSource{
  Future<NewsHeadlineRespDto> getNewsHeadline(String country,String? query,String? category);
}