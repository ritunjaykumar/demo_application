import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

void dioInterceptor(Dio dio) {
  if (kReleaseMode) {
    debugPrint('Release mode no logs');
  } else {
    dio.interceptors.add(
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
