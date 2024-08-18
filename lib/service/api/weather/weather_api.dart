import 'package:demo_application/config/dio/weather_dio_config.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../model/response/response.dart';

part 'weather_api.g.dart';

@RestApi(baseUrl: weatherBaseUrl)
abstract class WeatherApi {
  factory WeatherApi(Dio dio, {String baseUrl}) = _WeatherApi;

  @GET('/weather')
  Future<WeatherRespDto> getCurrentWeather(
    @Query('lat') double lat,
    @Query('lon') double lon,
    @Query('appid') String apiId,
    @Query('units') String? unit,
  );

  @GET('/forecast')
  Future<ForecastRespDto> getForecast(
      @Query('lat') double lat,
      @Query('lon') double lon,
      @Query('appid') String apiId,
      @Query('units') String? unit,
      );


}


//api.openweathermap.org/data/2.5/forecast?lat=44.34&lon=10.99&appid={API key}