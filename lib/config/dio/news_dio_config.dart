import 'package:dio/dio.dart';

import 'dio_util.dart';

const String newsBaseUrl = "https://newsapi.org/v2/";
const String _newsApi = '51f6579d47524b66baf8feacf466d98f';

class NewsDioConfig {
  NewsDioConfig() : _dio = Dio();

  final int _connectTimeout = 1;
  final int _receiveTimeout = 1;
  final int _sendTimeout = 1;
  final Dio _dio;

  Dio initDio() {
    _dio.options = BaseOptions(
      baseUrl: newsBaseUrl,
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
    return <String, dynamic>{
      'X-Api-Key': _newsApi,
    };
  }
}
