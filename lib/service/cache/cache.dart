import '../../application/initializer.dart';
import '../../model/response/response.dart';

const int expiryTimeMinute = 1;

class MemoryCache {
  final Map<String, CacheData<dynamic>> _cacheData = {};
  final String _weatherRespKey = 'weatherRespKey';
  final String _forecastKey = 'forecastKey';

  WeatherRespDto? getWeatherRespDto(double lat, double lon, String? unit) {
    return _filterData<WeatherRespDto>('$lat$lon${unit ?? ''}$_weatherRespKey');
  }

  void setWeatherResp(WeatherRespDto weatherResp, double lat, double lon, String? unit) {
    _cacheData['$lat$lon${unit ?? ''}$_weatherRespKey'] =
        CacheData<WeatherRespDto>(data: weatherResp);
  }

  ForecastRespDto? getForecastResp(double lat, double lon, String? unit) {
    return _filterData<ForecastRespDto>('$lat$lon${unit ?? ''}$_forecastKey');
  }

  void setForecastResp(ForecastRespDto forecast, double lat, double lon, String? unit) {
    _cacheData['$lat$lon${unit ?? ''}$_forecastKey'] = CacheData<ForecastRespDto>(data: forecast);
  }

  T? _filterData<T>(String key) {
    CacheData<dynamic>? cacheData = _cacheData[key];
    if (cacheData == null) return null;
    logger.i('cached date: ${cacheData.dateTime}');
    if (cacheData.isExpire()) {
      _cacheData.remove(key);
      return null;
    }
    logger.i('getting data from cache for $key');
    return cacheData.data as T;
  }
}

class CacheData<T> {
  final T data;
  final DateTime dateTime;

  CacheData({required this.data}) : dateTime = DateTime.now();

  bool isExpire() =>
      dateTime.add(const Duration(minutes: expiryTimeMinute)).isBefore(DateTime.now());
}
