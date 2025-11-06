import 'package:core_api/core_api.dart';

/// Исключение для ошибок таймаута
class TimeoutException extends AppException {
  const TimeoutException({
    super.message = 'Время ожидания запроса истекло',
    super.stackTrace,
    super.cause,
    this.timeoutDuration,
  });

  final Duration? timeoutDuration;

  @override
  String toString() => 'TimeoutException: $message';
}
