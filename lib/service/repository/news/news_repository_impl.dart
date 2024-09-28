import 'package:dartz/dartz.dart';

import 'package:demo_application/screen/home/weather_model.dart';

import 'package:demo_application/service/error/error_model.dart';
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

  NewsRepositoryImpl({
    required this.network,
    required this.errorHandler,
    required this.mapper,
    required this.newsSource,
  });

  @override
  Future<Either<Failure, List<NewsHeadline>>> getNewsHeadline(
      String query, int pageSize, int page, String? fromDate, String? toDate) async {
    if (await network.checkNetworkStatus == false) {
      return Left(Failure.noInternet());
    }
    try {
      final response = await newsSource.getNewsHeadline(query, pageSize, page, fromDate, toDate);
      return Right(response.articles.map(mapper.newsHeadline).toList());
    } catch (error) {
      return Left(errorHandler.handleError(error));
    }
  }
}
