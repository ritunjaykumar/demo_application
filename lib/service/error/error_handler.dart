import 'package:dio/dio.dart';

import '../../application/initializer.dart';
import 'error_model.dart';

class ErrorHandler {
  Failure handleError(error) {
    logger.e('api error: $error');
    if (error.runtimeType == DioException) {
      DioException dioException = error;
      Map<String, dynamic> data;
      if (dioException.type == DioExceptionType.badResponse) {
        data = dioException.response!.data;
      } else {
        data = {};
      }

      return switch (dioException.type) {
        DioExceptionType.connectionTimeout => Failure.timeout(connectionTimeoutMessage),
        DioExceptionType.sendTimeout => Failure.timeout(sendTimeoutMessage),
        DioExceptionType.receiveTimeout => Failure.timeout(receiveTimeoutMessage),
        DioExceptionType.badCertificate => Failure.certificate(),
        DioExceptionType.badResponse => Failure.fromJson(data),
        DioExceptionType.cancel => throw UnimplementedError(),
        DioExceptionType.connectionError => Failure.connectionError(),
        DioExceptionType.unknown => Failure.unknown(dioException.message ?? unknownErrorMessage)
      };
    } else {
      return Failure.unknown(error == null ? unknownErrorMessage : error.toString());
    }
  }
}
