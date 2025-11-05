import 'package:core_api/core_api.dart';

/// Исключение для ошибок подключения к сети
class ConnectionException extends AppException {
  const ConnectionException({
    super.message = 'No internet connection',
    super.stackTrace,
    super.cause,
  });

  @override
  String toString() => 'ConnectionException: $message';
}
