import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String baseUrl = "https://reqres.in";

class DioConfig {
  DioConfig() : _dio = Dio();

  final int _connectTimeout = 1;
  final int _receiveTimeout = 1;
  final int _sendTimeout = 1;
  final Dio _dio;

  Dio initDio() {
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(minutes: _connectTimeout),
      receiveTimeout: Duration(minutes: _receiveTimeout),
      sendTimeout: Duration(minutes: _sendTimeout),
      responseType: ResponseType.json,
      contentType: 'application/json',
      headers: _getHeader(),
    );
    _logConfig();
    return _dio;
  }

  Map<String, dynamic> _getHeader() {
    return <String, dynamic>{};
  }

  void _logConfig() {
    if (kReleaseMode) {
      debugPrint('Release mode no logs');
    } else {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          request: true,
          maxWidth: 120,
          error: true,
        ),
      );
    }
  }
}
