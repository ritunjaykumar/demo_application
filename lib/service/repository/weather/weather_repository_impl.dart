import 'package:dartz/dartz.dart';
import 'package:demo_application/service/source/weather/weather_source.dart';

import '../../../model/mapper/mapper.dart';
import '../../../screen/home/weather_model.dart';
import '../../error/error_handler.dart';
import '../../error/error_model.dart';
import '../../network/network.dart';
import 'weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final Network _network;
  final ErrorHandler _errorHandler;
  final Mapper _mapper;
  final WeatherSource _weatherSource;

  WeatherRepositoryImpl(this._network, this._errorHandler, this._mapper, this._weatherSource);

  @override
  Future<Either<Failure, WeatherDetail>> getCurrentWeather(double lat, double lon,
      {String? unit}) async {
    if (await _network.checkNetworkStatus == false) {
      return Left(Failure.noInternet());
    }
    try {
      final response = await _weatherSource.getCurrentWeather(lat, lon, unit: unit);
      return Right(_mapper.weatherDetail(response));
    } catch (error) {
      return Left(_errorHandler.handleError(error));
    }
  }

  @override
  Future<Either<Failure, Forecast>> getForecast(double lat, double lon, {String? unit}) async {
    if (await _network.checkNetworkStatus == false) {
      return Left(Failure.noInternet());
    }

    try {
      final response = await _weatherSource.getForecast(lat, lon, unit: unit);
      return Right(_mapper.forecast(response));
    } catch (error) {
      return Left(_errorHandler.handleError(error));
    }
  }
}
