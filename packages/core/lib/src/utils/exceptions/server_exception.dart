import 'package:core/src/utils/exceptions/app_exception.dart';
import 'package:core/src/utils/exceptions/exceptions.dart';

class ServerException extends AppException {
  const ServerException({
    required super.message,
    required this.statusCode,
    required this.errorModel,
    super.stackTrace,
    super.cause,
    this.serverErrorType,
  });


  factory ServerException.fromNetworkException(
    NetworkException networkException, {
    ServerErrorType? serverErrorType,
  }) {
    return ServerException(
      message: networkException.message,
      statusCode: networkException.statusCode,
      stackTrace: networkException.stackTrace,
      cause: networkException.cause,
      errorModel: networkException.errorModel,
      serverErrorType: serverErrorType ?? _determineServerErrorType(networkException.statusCode),
    );
  }

  final int statusCode;
  final Object? errorModel;


  final ServerErrorType? serverErrorType;

  static ServerErrorType _determineServerErrorType(int statusCode) {
    return switch (statusCode) {
      500 => ServerErrorType.internalError,
      502 => ServerErrorType.badGateway,
      503 => ServerErrorType.serviceUnavailable,
      504 => ServerErrorType.gatewayTimeout,
      _ => ServerErrorType.unknown,
    };
  }

  String get userFriendlyMessage {
    return switch (serverErrorType) {
      ServerErrorType.internalError => 'На сервере произошла ошибка. Попробуйте позже.',
      ServerErrorType.badGateway => 'Сервис временно недоступен. Попробуйте через несколько минут.',
      ServerErrorType.serviceUnavailable => 'Сервис временно недоступен из-за технического обслуживания.',
      ServerErrorType.gatewayTimeout => 'Превышено время ожидания ответа от сервера.',
      ServerErrorType.unknown => 'Произошла ошибка на сервере. Обратитесь в поддержку.',
      null => message,
    };
  }

  @override
  String toString() {
    return 'ServerException: $message ($statusCode) - ${serverErrorType?.name}';
  }
}

/// Типы серверных ошибок
enum ServerErrorType {
  internalError, // 500
  badGateway, // 502
  serviceUnavailable, // 503
  gatewayTimeout, // 504
  unknown,
}
