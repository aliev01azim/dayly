import 'package:core/src/utils/exceptions/app_exception.dart';

/// Исключение для пользовательских ошибок с произвольным сообщением
class CustomException extends AppException {
  const CustomException({
    required super.message,
    super.stackTrace,
    super.cause,
  });

  @override
  String toString() => 'CustomException: $message';
}
