const String noInternetConnectionStatusCode = '1';
const String timeoutStatusCode = '2';
const String connectionStatusCode = '3';
const String certificateStatusCode = '3';
const String unknownStatusCode = '4';
const String sessionExpiredStatusCode = '419';
const String defaultStatus = 'error';


/////
const String noInternetConnectionError = 'NO INTERNET CONNECTION';
const String timeoutError = 'TIMEOUT';
const String connectionError = 'CONNECTION ERROR';
const String certificateError = 'CERTIFICATE ERROR';
const String unknownError = 'UNKNOWN ERROR';
////
const String noInternetConnectionMessage =
    'No internet connection detected. Please check your network settings and try again.';
const String connectionTimeoutMessage =
    'Unable to connect to the server. Please check your internet connection and try again';
const String sendTimeoutMessage =
    'The request timed out. Please check your internet connection and try again.';
const String receiveTimeoutMessage = 'The server did not respond in time. Please try again';
const String connectionErrorMessage =
    'Unable to establish a connection with the server. Please check your internet connection and try again.';
const String certificateErrorMessage =
    'The certificate presented by the server is not valid. Please contact the website owner to verify the certificate.';

const String unknownErrorMessage =
    'We\'re sorry, but something went wrong on our end. Please try again.';

class Failure {
  final String status;
  final String error;
  final String message;
  final DateTime? timestamp;

  const Failure({
    required this.status,
    required this.error,
    required this.message,
    this.timestamp,
  });

  Failure.constant({String message = ''})
      : this(status: defaultStatus, error: '', message: message);

  Failure.noInternet()
      : this(
          status: noInternetConnectionStatusCode,
          error: noInternetConnectionError,
          message: noInternetConnectionMessage,
          timestamp: DateTime.now(),
        );

  Failure.timeout(String message)
      : this(
          status: timeoutStatusCode,
          error: timeoutError,
          message: message,
          timestamp: DateTime.now(),
        );

  Failure.connectionError()
      : this(
          status: connectionStatusCode,
          error: connectionError,
          message: connectionErrorMessage,
          timestamp: DateTime.now(),
        );

  Failure.certificate()
      : this(
          status: certificateStatusCode,
          error: certificateError,
          message: certificateErrorMessage,
          timestamp: DateTime.now(),
        );

  Failure.unknown(String message)
      : this(
          status: unknownStatusCode,
          error: unknownError,
          message: message,
          timestamp: DateTime.now(),
        );

  Failure.fromJson(Map<String, dynamic> json)
      : this(
          status: json['status'] as String? ?? unknownStatusCode,
          error: json['error'] as String? ?? unknownError,
          message: json['message'] as String? ?? unknownErrorMessage,
          // timestamp: json['timestamp'] == null ? null : DateTime.parse(json['timestamp'] as String),
        );
}
