import 'package:dartz/dartz.dart';
import 'package:demo_application/screen/home/weather_model.dart';
import 'package:demo_application/service/error/error_model.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<NewsHeadline>>> getNewsHeadline(
      String country, String query, String? category);
}
