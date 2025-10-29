import 'package:core/src/utils/exceptions/app_exception.dart';

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
