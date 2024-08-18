import 'package:dio/dio.dart';

import 'dio_util.dart';

const String weatherBaseUrl = "https://api.openweathermap.org/data/2.5";

const String apiKey = 'b5b200d26255b2bbcb8cb35977879abd';

class WeatherDioConfig {
  WeatherDioConfig() : _dio = Dio();

  final int _connectTimeout = 1;
  final int _receiveTimeout = 1;
  final int _sendTimeout = 1;
  final Dio _dio;

  Dio initDio() {
    _dio.options = BaseOptions(
      baseUrl: weatherBaseUrl,
      connectTimeout: Duration(minutes: _connectTimeout),
      receiveTimeout: Duration(minutes: _receiveTimeout),
      sendTimeout: Duration(minutes: _sendTimeout),
      responseType: ResponseType.json,
      contentType: 'application/json',
      headers: _getHeader(),
    );
    dioInterceptor(_dio);
    return _dio;
  }

  Map<String, dynamic> _getHeader() {
    return <String, dynamic>{};
  }
}
