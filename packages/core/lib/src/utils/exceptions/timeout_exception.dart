import 'package:core/src/utils/exceptions/app_exception.dart';

/// Исключение для ошибок таймаута
class TimeoutException extends AppException {
  const TimeoutException({
    super.message = 'Request timeout',
    super.stackTrace,
    super.cause,
    this.timeoutDuration,
  });

  final Duration? timeoutDuration;

  @override
  String toString() => 'TimeoutException: $message';
}
