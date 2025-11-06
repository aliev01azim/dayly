import 'package:core_api/core_api.dart';
import 'package:dio/dio.dart';

abstract class UseCase<T, P> extends BaseUseCase<T, P, AppException> {
  const UseCase();

  @override
  AppException convertError(Object error, StackTrace stackTrace) {
    if (error is AppException) {
      return error;
    }

    if (error is DioException) {
      return _convertDioException(error, stackTrace);
    }

    return UnhandledException(message: error.toString(), stackTrace: stackTrace, cause: error);
  }

  AppException _convertDioException(DioException dio, StackTrace stackTrace) {
    return switch (dio.type) {
      DioExceptionType.connectionError => ConnectionException(stackTrace: stackTrace),
      DioExceptionType.receiveTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.connectionTimeout => TimeoutException(stackTrace: stackTrace),
      DioExceptionType.badResponse => _handleBadResponse(dio, stackTrace),
      _ => NetworkException(
        message: dio.message ?? 'Unknown network error',
        statusCode: 0,
        stackTrace: stackTrace,
        cause: dio,
      ),
    };
  }

  AppException _handleBadResponse(DioException dio, StackTrace stackTrace) {
    final statusCode = dio.response?.statusCode ?? 0;
    final errorData = dio.response?.data;

    var message = dio.message ?? 'Network error';

    if (errorData is Map<String, dynamic> && errorData['text'] != null) {
      message = errorData['text'].toString();

      // Проверяем на fraud detected ошибки
      if (message.toLowerCase().contains('fraud detected') || message.toLowerCase().contains('tid limit exceeded')) {
        return FraudDetectedException(message: message, stackTrace: stackTrace, cause: dio);
      }
    }

    if (statusCode >= 500) {
      final serverException = _createServerException(
        message: message,
        statusCode: statusCode,
        errorData: errorData,
        stackTrace: stackTrace,
        cause: dio,
      );

      // Возвращаем userFriendlyMessage вместо оригинального сообщения
      return ServerException(
        message: serverException.userFriendlyMessage,
        statusCode: serverException.statusCode,
        errorModel: serverException.errorModel,
        stackTrace: stackTrace,
        cause: dio,
        serverErrorType: serverException.serverErrorType,
      );
    }
    return switch (statusCode) {
      401 => AuthException(message: message, stackTrace: stackTrace, authErrorType: AuthErrorType.unauthorized),
      403 => AuthException(message: message, stackTrace: stackTrace, authErrorType: AuthErrorType.unauthorized),
      422 => ValidationException(
        message: _extractValidationErrors(errorData)?['message'] ?? message,
        stackTrace: stackTrace,
        validationErrors: _extractValidationErrors(errorData),
      ),
      _ => NetworkException(
        message: message,
        statusCode: statusCode,
        errorModel: errorData,
        stackTrace: stackTrace,
        cause: dio,
      ),
    };
  }

  ServerException _createServerException({
    required String message,
    required int statusCode,
    required dynamic errorData,
    required StackTrace stackTrace,
    required DioException cause,
  }) {
    // Создаем базовый NetworkException
    final networkException = NetworkException(
      message: message,
      statusCode: statusCode,
      errorModel: errorData,
      stackTrace: stackTrace,
      cause: cause,
    );

    // Конвертируем в ServerException
    return ServerException.fromNetworkException(networkException);
  }

  Map<String, dynamic>? _extractValidationErrors(dynamic errorData) {
    if (errorData is Map<String, dynamic>) {
      final errors = errorData['violations'];
      if (errors != null && errors is List && errors.first is Map) {
        return Map<String, dynamic>.from(errors.first);
      }
    }
    return null;
  }
}

abstract class SyncUseCase<T, P> extends BaseSyncUseCase<T, P, AppException> {
  const SyncUseCase();

  @override
  AppException convertError(Object error, StackTrace stackTrace) {
    if (error is AppException) {
      return error;
    }

    return UnhandledException(message: error.toString(), stackTrace: stackTrace, cause: error);
  }
}

abstract class StreamUseCase<T, P> extends BaseStreamUseCase<T, AppException, P> {
  const StreamUseCase();

  @override
  AppException convertError(Object error, StackTrace stackTrace) {
    if (error is AppException) {
      return error;
    }

    return UnhandledException(message: error.toString(), stackTrace: stackTrace, cause: error);
  }
}

class EmptyUseCaseParams {
  const EmptyUseCaseParams();
}
