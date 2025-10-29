import 'package:core/src/utils/exceptions/app_exception.dart';

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
