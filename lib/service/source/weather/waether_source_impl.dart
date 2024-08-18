import 'package:demo_application/model/response/response.dart';
import 'package:demo_application/service/api/weather/weather_api.dart';
import 'package:demo_application/service/source/weather/weather_source.dart';

import '../../../config/dio/weather_dio_config.dart';
import '../../cache/cache.dart';

class WeatherSourceImpl implements WeatherSource {
  final WeatherApi weatherApi;
  final MemoryCache memoryCache;

  WeatherSourceImpl(this.weatherApi, this.memoryCache);

  @override
  Future<WeatherRespDto> getCurrentWeather(double lat, double lon, {String? unit}) async {
    var weatherDetails = memoryCache.getWeatherRespDto(lat, lon, unit);
    if (weatherDetails != null) {
      return weatherDetails;
    }
    weatherDetails = await weatherApi.getCurrentWeather(lat, lon, apiKey, unit);
    memoryCache.setWeatherResp(weatherDetails, lat, lon, unit);
    return weatherDetails;
  }

  @override
  Future<ForecastRespDto> getForecast(double lat, double lon, {String? unit}) async {
    var forecast = memoryCache.getForecastResp(lat, lon, unit);
    if (forecast != null) {
      return forecast;
    }
    var forecastRespDto = await weatherApi.getForecast(lat, lon, apiKey, unit);
    memoryCache.setForecastResp(forecastRespDto, lat, lon, unit);
    return forecastRespDto;
  }
}
