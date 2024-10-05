import 'package:dart_sentiment/dart_sentiment.dart';

import '../../model/mapper/mapper.dart';
import '../../model/response/response.dart';
import '../../screen/home/weather_model.dart';

final class SentimentAnalysis {
  final Sentiment sentiment = Sentiment();
  final Mapper mapper;

  NewsHeadline? analysis(NewsHeadlineRespData headline, String category) {
    var analysis = sentiment.analysis(headline.title);
    int score = analysis['score'];
    final comparative = analysis['comparative'];
    if (category == 'cold' && score < 0) {
      //showing negative article
      return mapper.newsHeadline(headline);
    } else if (category == 'hot' && comparative < -0.2) {
      // (more negative)
      return mapper.newsHeadline(headline);
    } else if (category == 'cool' && score > 0) {
      return mapper.newsHeadline(headline);
    }

    // if (score < 0) {
    //   //showing negative article
    //   return mapper.newsHeadline(headline);
    // } else if (comparative < -0.5) {
    //   // (more negative)
    //   return mapper.newsHeadline(headline);
    // } else if (score > 0) {
    //   return mapper.newsHeadline(headline);
    // }
    return null;
  }

  SentimentAnalysis(this.mapper);
}
