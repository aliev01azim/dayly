import 'package:core_api/core_api.dart';

/// Исключение для необработанных ошибок
class UnhandledException extends AppException {
  const UnhandledException({
    required super.message,
    super.stackTrace,
    super.cause,
  });

  @override
  String toString() => 'UnhandledException: $message';
}
