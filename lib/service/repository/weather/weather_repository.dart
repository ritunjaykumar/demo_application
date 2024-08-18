
import 'package:dartz/dartz.dart';
import 'package:demo_application/service/error/error_model.dart';

import '../../../screen/home/weather_model.dart';

abstract class WeatherRepository{
  Future<Either<Failure, WeatherDetail>> getCurrentWeather(double lat, double lon, {String? unit});

  Future<Either<Failure, Forecast>> getForecast(double lat, double lon, {String? unit});
}