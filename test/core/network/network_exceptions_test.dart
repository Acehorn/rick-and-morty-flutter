import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rickmortyproject/core/network/network_exceptions.dart';

void main() {
  group('NetworkExceptions.getMessage', () {
    test('returns connection timeout message', () {
      final error = DioException(
        type: DioExceptionType.connectionTimeout,
        requestOptions: RequestOptions(path: ''),
      );

      final message = NetworkExceptions.getMessage(error);

      expect(message, 'Connection timeout');
    });

    test('returns server error message on bad response', () {
      final error = DioException(
        type: DioExceptionType.badResponse,
        requestOptions: RequestOptions(path: ''),
      );

      final message = NetworkExceptions.getMessage(error);

      expect(message, 'Server error');
    });

    test('returns unexpected error for unknown type', () {
      final error = DioException(
        type: DioExceptionType.unknown,
        requestOptions: RequestOptions(path: ''),
      );

      final message = NetworkExceptions.getMessage(error);

      expect(message, 'Unexpected error');
    });

    test('returns unknown error for non-DioException', () {
      final message = NetworkExceptions.getMessage(Exception('boom'));

      expect(message, 'Unknown error');
    });
  });
}
