import 'package:dio/dio.dart';

class NetworkExceptions {
  static String getMessage(Object error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return 'Connection timeout';
        case DioExceptionType.sendTimeout:
          return 'Send timeout';
        case DioExceptionType.receiveTimeout:
          return 'Receive timeout';
        case DioExceptionType.badResponse:
          return 'Server error';
        case DioExceptionType.cancel:
          return 'Request cancelled';
        case DioExceptionType.unknown:
        default:
          return 'Unexpected error';
      }
    }
    return 'Unknown error';
  }
}
