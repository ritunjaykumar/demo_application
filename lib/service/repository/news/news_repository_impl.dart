import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:demo_application/application/initializer.dart';

import 'package:demo_application/screen/home/weather_model.dart';

import 'package:demo_application/service/error/error_model.dart';
import 'package:demo_application/service/sentiment/sentiment_service.dart';
import 'package:demo_application/service/source/news/news_source.dart';

import '../../../model/mapper/mapper.dart';
import '../../error/error_handler.dart';
import '../../network/network.dart';
import 'news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  final Network network;
  final ErrorHandler errorHandler;
  final Mapper mapper;
  final NewsSource newsSource;
  final SentimentAnalysis sentimentAnalysis;

  NewsRepositoryImpl({
    required this.network,
    required this.errorHandler,
    required this.mapper,
    required this.newsSource,
    required this.sentimentAnalysis,
  });

  @override
  Future<Either<Failure, List<NewsHeadline>>> getNewsHeadline(
      String query, int pageSize, int page, String? fromDate, String? toDate) async {
    if (await network.checkNetworkStatus == false) {
      return Left(Failure.noInternet());
    }
    try {
      final response = await newsSource.getNewsHeadline(query, pageSize, page, fromDate, toDate);
      List<NewsHeadline> headlines = response.articles.map(mapper.newsHeadline).toList();
      return Right(headlines);
    } catch (error) {
      return Left(errorHandler.handleError(error));
    }
  }

  @override
  Future<Either<Failure, List<NewsHeadline>>> getHeadline(String? country, int pageSize, int page, String category) async{
    if (await network.checkNetworkStatus == false) {
      return Left(Failure.noInternet());
    }
    logger.i('category: $category');
    try {
      final response = await newsSource.getHeadline(country, pageSize, page);
      List<NewsHeadline> headlines = response.articles
          .map((e) => sentimentAnalysis.analysis(e, category))
          .where((e) => e != null)
          .map((e) => e!)
          .toList();
      return Right(headlines);
    } catch (error) {
      return Left(errorHandler.handleError(error));
    }
  }
}
