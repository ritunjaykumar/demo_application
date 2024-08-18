import '../../../model/response/response.dart';

abstract class WeatherSource {
  Future<WeatherRespDto> getCurrentWeather(double lat, double lon, {String? unit});
  Future<ForecastRespDto> getForecast(double lat, double lon, {String? unit});
}
